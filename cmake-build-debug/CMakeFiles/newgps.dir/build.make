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
include CMakeFiles/newgps.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/newgps.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/newgps.dir/flags.make

CMakeFiles/newgps.dir/src/newgps.c.o: CMakeFiles/newgps.dir/flags.make
CMakeFiles/newgps.dir/src/newgps.c.o: ../src/newgps.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/matt/mnt/satpi/src/gps/newgps/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/newgps.dir/src/newgps.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/newgps.dir/src/newgps.c.o -c /Users/matt/mnt/satpi/src/gps/newgps/src/newgps.c

CMakeFiles/newgps.dir/src/newgps.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/newgps.dir/src/newgps.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/matt/mnt/satpi/src/gps/newgps/src/newgps.c > CMakeFiles/newgps.dir/src/newgps.c.i

CMakeFiles/newgps.dir/src/newgps.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/newgps.dir/src/newgps.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/matt/mnt/satpi/src/gps/newgps/src/newgps.c -o CMakeFiles/newgps.dir/src/newgps.c.s

CMakeFiles/newgps.dir/src/serial.c.o: CMakeFiles/newgps.dir/flags.make
CMakeFiles/newgps.dir/src/serial.c.o: ../src/serial.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/matt/mnt/satpi/src/gps/newgps/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/newgps.dir/src/serial.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/newgps.dir/src/serial.c.o -c /Users/matt/mnt/satpi/src/gps/newgps/src/serial.c

CMakeFiles/newgps.dir/src/serial.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/newgps.dir/src/serial.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/matt/mnt/satpi/src/gps/newgps/src/serial.c > CMakeFiles/newgps.dir/src/serial.c.i

CMakeFiles/newgps.dir/src/serial.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/newgps.dir/src/serial.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/matt/mnt/satpi/src/gps/newgps/src/serial.c -o CMakeFiles/newgps.dir/src/serial.c.s

# Object files for target newgps
newgps_OBJECTS = \
"CMakeFiles/newgps.dir/src/newgps.c.o" \
"CMakeFiles/newgps.dir/src/serial.c.o"

# External object files for target newgps
newgps_EXTERNAL_OBJECTS =

newgps: CMakeFiles/newgps.dir/src/newgps.c.o
newgps: CMakeFiles/newgps.dir/src/serial.c.o
newgps: CMakeFiles/newgps.dir/build.make
newgps: CMakeFiles/newgps.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/matt/mnt/satpi/src/gps/newgps/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable newgps"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/newgps.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/newgps.dir/build: newgps

.PHONY : CMakeFiles/newgps.dir/build

CMakeFiles/newgps.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/newgps.dir/cmake_clean.cmake
.PHONY : CMakeFiles/newgps.dir/clean

CMakeFiles/newgps.dir/depend:
	cd /Users/matt/mnt/satpi/src/gps/newgps/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/matt/mnt/satpi/src/gps/newgps /Users/matt/mnt/satpi/src/gps/newgps /Users/matt/mnt/satpi/src/gps/newgps/cmake-build-debug /Users/matt/mnt/satpi/src/gps/newgps/cmake-build-debug /Users/matt/mnt/satpi/src/gps/newgps/cmake-build-debug/CMakeFiles/newgps.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/newgps.dir/depend

