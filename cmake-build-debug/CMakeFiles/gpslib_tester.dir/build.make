# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/matt/mnt/satpi/src/gps/newgps

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/matt/mnt/satpi/src/gps/newgps/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/gpslib_tester.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/gpslib_tester.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/gpslib_tester.dir/flags.make

CMakeFiles/gpslib_tester.dir/src/serial.c.o: CMakeFiles/gpslib_tester.dir/flags.make
CMakeFiles/gpslib_tester.dir/src/serial.c.o: ../src/serial.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/matt/mnt/satpi/src/gps/newgps/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/gpslib_tester.dir/src/serial.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/gpslib_tester.dir/src/serial.c.o -c /Users/matt/mnt/satpi/src/gps/newgps/src/serial.c

CMakeFiles/gpslib_tester.dir/src/serial.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gpslib_tester.dir/src/serial.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/matt/mnt/satpi/src/gps/newgps/src/serial.c > CMakeFiles/gpslib_tester.dir/src/serial.c.i

CMakeFiles/gpslib_tester.dir/src/serial.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gpslib_tester.dir/src/serial.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/matt/mnt/satpi/src/gps/newgps/src/serial.c -o CMakeFiles/gpslib_tester.dir/src/serial.c.s

CMakeFiles/gpslib_tester.dir/src/gpslib.c.o: CMakeFiles/gpslib_tester.dir/flags.make
CMakeFiles/gpslib_tester.dir/src/gpslib.c.o: ../src/gpslib.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/matt/mnt/satpi/src/gps/newgps/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/gpslib_tester.dir/src/gpslib.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/gpslib_tester.dir/src/gpslib.c.o -c /Users/matt/mnt/satpi/src/gps/newgps/src/gpslib.c

CMakeFiles/gpslib_tester.dir/src/gpslib.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gpslib_tester.dir/src/gpslib.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/matt/mnt/satpi/src/gps/newgps/src/gpslib.c > CMakeFiles/gpslib_tester.dir/src/gpslib.c.i

CMakeFiles/gpslib_tester.dir/src/gpslib.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gpslib_tester.dir/src/gpslib.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/matt/mnt/satpi/src/gps/newgps/src/gpslib.c -o CMakeFiles/gpslib_tester.dir/src/gpslib.c.s

CMakeFiles/gpslib_tester.dir/src/gpslib_tester.c.o: CMakeFiles/gpslib_tester.dir/flags.make
CMakeFiles/gpslib_tester.dir/src/gpslib_tester.c.o: ../src/gpslib_tester.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/matt/mnt/satpi/src/gps/newgps/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/gpslib_tester.dir/src/gpslib_tester.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/gpslib_tester.dir/src/gpslib_tester.c.o -c /Users/matt/mnt/satpi/src/gps/newgps/src/gpslib_tester.c

CMakeFiles/gpslib_tester.dir/src/gpslib_tester.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gpslib_tester.dir/src/gpslib_tester.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/matt/mnt/satpi/src/gps/newgps/src/gpslib_tester.c > CMakeFiles/gpslib_tester.dir/src/gpslib_tester.c.i

CMakeFiles/gpslib_tester.dir/src/gpslib_tester.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gpslib_tester.dir/src/gpslib_tester.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/matt/mnt/satpi/src/gps/newgps/src/gpslib_tester.c -o CMakeFiles/gpslib_tester.dir/src/gpslib_tester.c.s

# Object files for target gpslib_tester
gpslib_tester_OBJECTS = \
"CMakeFiles/gpslib_tester.dir/src/serial.c.o" \
"CMakeFiles/gpslib_tester.dir/src/gpslib.c.o" \
"CMakeFiles/gpslib_tester.dir/src/gpslib_tester.c.o"

# External object files for target gpslib_tester
gpslib_tester_EXTERNAL_OBJECTS =

gpslib_tester: CMakeFiles/gpslib_tester.dir/src/serial.c.o
gpslib_tester: CMakeFiles/gpslib_tester.dir/src/gpslib.c.o
gpslib_tester: CMakeFiles/gpslib_tester.dir/src/gpslib_tester.c.o
gpslib_tester: CMakeFiles/gpslib_tester.dir/build.make
gpslib_tester: CMakeFiles/gpslib_tester.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/matt/mnt/satpi/src/gps/newgps/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable gpslib_tester"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gpslib_tester.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/gpslib_tester.dir/build: gpslib_tester

.PHONY : CMakeFiles/gpslib_tester.dir/build

CMakeFiles/gpslib_tester.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/gpslib_tester.dir/cmake_clean.cmake
.PHONY : CMakeFiles/gpslib_tester.dir/clean

CMakeFiles/gpslib_tester.dir/depend:
	cd /Users/matt/mnt/satpi/src/gps/newgps/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/matt/mnt/satpi/src/gps/newgps /Users/matt/mnt/satpi/src/gps/newgps /Users/matt/mnt/satpi/src/gps/newgps/cmake-build-debug /Users/matt/mnt/satpi/src/gps/newgps/cmake-build-debug /Users/matt/mnt/satpi/src/gps/newgps/cmake-build-debug/CMakeFiles/gpslib_tester.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/gpslib_tester.dir/depend
