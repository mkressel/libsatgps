#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>

#include <termios.h>
#include <time.h>
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

#define GLGSV_MESSAGE       0x00    /* $GLGSV */
#define GPGSV_MESSAGE       0x01    /* $GPGSV */
#define GNGLL_MESSAGE       0x02    /* $GNGLL */
#define GNRMC_MESSAGE       0x03    /* $GNRMC */
#define GNVTG_MESSAGE       0x04    /* $GNVTG */
#define GNGGA_MESSAGE       0x05    /* $GNGGA */
#define GNGSA_MESSAGE       0x06    /* $GNGGA */
#define GNTXT_MESSAGE       0x07    /* $GNGGA */

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


int checksum_valid(char *);
int hex2int(char *);
int hexchar2int(char);
int parse_fields(char *, char **, int);

int parse_sentence(char *);
int parse_gsv(char *, gsv_data_t *, int);
int parse_gll(char *, gll_data_t *, int);
int parse_rmc(char *, rmc_data_t *, int);
int parse_vtg(char *, vtg_data_t *, int);
int parse_gga(char *, gga_data_t *, int);
int parse_gsa(char *, gsa_data_t *, int);
int parse_txt(char *, txt_data_t *, int);

void print_gsv(gsv_data_t);
void print_gll(gll_data_t);
void print_rmc(rmc_data_t);
void print_vtg(vtg_data_t);
void print_gga(gga_data_t);
void print_gsa(gsa_data_t);
void print_txt(txt_data_t);


int get_prn_number(int, int);


