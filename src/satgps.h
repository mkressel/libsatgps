#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>

#include <termios.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h>

#include "serial.h"

#define GPS_MAX_FIELDS  32      /* probably too high; NMEA-0183 has maximum string length of 82 chars. */
#define GPS_MAX_SATS    32      /* maximum number of satellites to store. */

#define METERS_PER_SECOND_PER_KNOT  0.5144444444        /* to convert knots to meters per second */
#define METERS_PER_SECOND_PER_KPH   0.2777777778        /* to convert kph to meters per second */

/* NMEA-0183 prefixes we can parse */
#define NMEA_PREFIX_GLGSV           "$GLGSV"    /* Glonass Receiver GSV */
#define NMEA_PREFIX_GPGSV           "$GPGSV"    /* GPS GSV */
#define NMEA_PREFIX_GNGLL           "$GNGLL"    /* Combined GPS and GLONASS */
#define NMEA_PREFIX_GNRMC           "$GNRMC"    /* Time, date, position, course and speed data.  */
#define NMEA_PREFIX_GNVTG           "$GNVTG"    /* Track made good and speed over ground  */
#define NMEA_PREFIX_GNGGA           "$GNGGA"    /* Time, position, and fix related data */
#define NMEA_PREFIX_GNGSA           "$GNGSA"    /* GPS DOP and active satellites */
#define NMEA_PREFIX_GNTXT           "$GNTXT"    /* GPS DOP and active satellites */

/* Sentence filter bitmasks. Use gps_set_filters() to turn on or off */
#define GLGSV_MESSAGE       1<<0    /* $GLGSV */
#define GPGSV_MESSAGE       1<<1    /* $GPGSV */
#define GNGLL_MESSAGE       1<<2    /* $GNGLL */
#define GNRMC_MESSAGE       1<<3    /* $GNRMC */
#define GNVTG_MESSAGE       1<<4    /* $GNVTG */
#define GNGGA_MESSAGE       1<<5    /* $GNGGA */
#define GNGSA_MESSAGE       1<<6    /* $GNGGA */
#define GNTXT_MESSAGE       1<<7    /* $GNGGA */

/*
 * GSV satellite type
 * */
typedef struct {
    int                 prn_number;
    int                 elevation;
    int                 azimuth;
    int                 signal_to_noise;
} gsv_sat_t;

/*
 * GSV message type
 * */
typedef struct {
    int                 total_messages;
    int                 message_number;
    int                 satellites_in_view;
    gsv_sat_t           gsv_sat[GPS_MAX_SATS];
} gsv_data_t;

/*
 * GLL message type
 * */
typedef struct {
    double              latitude;                   /* in degrees, N is positive, S negative */
    double              longitude;                  /* in degrees, E is positive, W negative */
    char                utc_time_string[256];       /* UTC time, as a raw string from GPS */
    struct timeval      utc_time;                   /* UTC time as timeval, with microsecond resolution */
    int                 valid;                      /* 1 = valid, 0 = invalid */
} gll_data_t;

/*
 * RMC message type
 * */
typedef struct {
    char                utc_time_string[256];       /* UTC time, as a raw string from GPS */
    struct timeval      utc_time;                   /* UTC time as timeval, with microsecond resolution */
    int                 valid;                      /* 1 = valid, 0 = invalid */
    double              latitude;                   /* in degrees, N is positive, S negative */
    double              longitude;                  /* in degrees, E is positive, W negative */
    double              speed;                      /* ground speed in m/s */
    double              track_angle;                /* in degrees */
    char                utc_date_string[256];       /* UTC date, as raw string from GPS */
    struct tm           utc_date;                   /* UTC date as tm struct */
    double              magnetic_variation;         /* magnetic variation in degrees */
} rmc_data_t;

/*
 * VTG message type
 */
typedef struct {
    double              track_true;                 /* Track made good, degrees true north */
    double              track_magnetic;             /* Track made good, degrees magnetic north */
    double              speed;                      /* speed over ground in m/s */
} vtg_data_t;

/*
 * GGA message type
 */

typedef struct {
    char                utc_time_string[256];       /* UTC time, as a raw string from GPS */
    struct timeval      utc_time;                   /* UTC time as timeval, with microsecond resolution */
    double              latitude;                   /* in degrees, N is positive, S negative */
    double              longitude;                  /* in degrees, E is positive, W negative */
    int                 gps_quality;                /* GPS quality indicator */
    int                 number_svs;                 /* Number of SVs in use */
    double              HDOP;                       /* HDOP */
    double              orthometric_height;         /* Orthometric height (MSL reference) in meters */
    double              geoid_separation;           /* Geoid separation in meters */
    double              age_of_differential;        /* Age of differential GPS data record */
    int                 reference_id;               /* Reference station ID */
} gga_data_t;

/*
 * GSA message type
 */

typedef struct {
   int                  mode_1;                     /* Mode 1, 0 = manual, 1 = automatic */
   int                  mode_2;                     /* Mode 2, Fix type, 1 = not available, 2 = 2D, 3 = 3D */
   int                  prn_number[12];             /* Satellite PRN numbers */
   double               PDOP;                       /* PDOP */
   double               HDOP;                       /* HDOP */
   double               VDOP;                       /* VDOP */

} gsa_data_t;

typedef struct {
    int                 num_sentences;               /* number of TXT sentences */
    int                 text_id[128];                /* text identifier */
    char                message[128][100];           /* 100 messages of 128 chars each */
} txt_data_t;

/* all combined into one struct
 *
 * This is about 16K
 * Needs recode to allow for declaring only some of the following structures
 *
 * */

typedef struct {
    gsv_data_t      *GsvDataGlonass;                 /* GLONASS GSV data */
    gsv_data_t      *GsvDataGps;                     /* GPS GSV data */
    gll_data_t      *GllDataGn;                      /* Combined GPS and GLONASS GLL data */
    rmc_data_t      *RmcDataGn;                      /* Combined GPS and GLONASS RMC data */
    vtg_data_t      *VtgDataGn;                      /* Combined GPS and GLONASS VTG data */
    gga_data_t      *GgaDataGn;                      /* Combined GPS and GLONASS GGA data */
    gsa_data_t      *GsaDataGn;                      /* Combined GPS and GLONASS GSA data */
    txt_data_t      *TxtDataGn;                      /* Combined GPS and GLONASS GSA data */
    char            error_message[256];              /* buffer for error messages */
    char            sentence[128];                   /* holds copy of complete sentence */
    unsigned int    filters;                         /* bitmask of sentences we will be listening for */
} gps_data_t;


int gps_open(void);
int gps_close(void);
int gps_read(char *);
gps_data_t *gps_get_data_ptr(void);
void gps_get_error(char *);
void gps_set_filters(int);
void gps_clear_data(void);
int gps_is_filtered(int);


int checksum_valid(char *);
int hex2int(char *);
int hexchar2int(char);
int parse_fields(char *, char **, int);

int prefix_valid(char *);
int parse_sentence(char *);
int parse_gsv(char *, int);
int parse_gll(char *);
int parse_rmc(char *);
int parse_vtg(char *);
int parse_gga(char *);
int parse_gsa(char *);
int parse_txt(char *);

void print_gsv(int);
void print_gll(void);
void print_rmc(void);
void print_vtg(void);
void print_gga(void);
void print_gsa(void);
void print_txt(void);
void print_binary(unsigned int);


int get_prn_number(int, int);



