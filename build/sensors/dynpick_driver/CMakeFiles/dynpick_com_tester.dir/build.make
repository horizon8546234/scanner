# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/hou/scanner/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hou/scanner/build

# Include any dependencies generated for this target.
include sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/depend.make

# Include the progress variables for this target.
include sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/progress.make

# Include the compile flags for this target's objects.
include sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/flags.make

sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/src/test-com.c.o: sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/flags.make
sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/src/test-com.c.o: /home/hou/scanner/src/sensors/dynpick_driver/src/test-com.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hou/scanner/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/src/test-com.c.o"
	cd /home/hou/scanner/build/sensors/dynpick_driver && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/dynpick_com_tester.dir/src/test-com.c.o   -c /home/hou/scanner/src/sensors/dynpick_driver/src/test-com.c

sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/src/test-com.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/dynpick_com_tester.dir/src/test-com.c.i"
	cd /home/hou/scanner/build/sensors/dynpick_driver && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hou/scanner/src/sensors/dynpick_driver/src/test-com.c > CMakeFiles/dynpick_com_tester.dir/src/test-com.c.i

sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/src/test-com.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/dynpick_com_tester.dir/src/test-com.c.s"
	cd /home/hou/scanner/build/sensors/dynpick_driver && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hou/scanner/src/sensors/dynpick_driver/src/test-com.c -o CMakeFiles/dynpick_com_tester.dir/src/test-com.c.s

sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/src/test-com.c.o.requires:

.PHONY : sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/src/test-com.c.o.requires

sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/src/test-com.c.o.provides: sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/src/test-com.c.o.requires
	$(MAKE) -f sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/build.make sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/src/test-com.c.o.provides.build
.PHONY : sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/src/test-com.c.o.provides

sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/src/test-com.c.o.provides.build: sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/src/test-com.c.o


# Object files for target dynpick_com_tester
dynpick_com_tester_OBJECTS = \
"CMakeFiles/dynpick_com_tester.dir/src/test-com.c.o"

# External object files for target dynpick_com_tester
dynpick_com_tester_EXTERNAL_OBJECTS =

/home/hou/scanner/devel/lib/dynpick_driver/dynpick_com_tester: sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/src/test-com.c.o
/home/hou/scanner/devel/lib/dynpick_driver/dynpick_com_tester: sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/build.make
/home/hou/scanner/devel/lib/dynpick_driver/dynpick_com_tester: sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/hou/scanner/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable /home/hou/scanner/devel/lib/dynpick_driver/dynpick_com_tester"
	cd /home/hou/scanner/build/sensors/dynpick_driver && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dynpick_com_tester.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/build: /home/hou/scanner/devel/lib/dynpick_driver/dynpick_com_tester

.PHONY : sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/build

sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/requires: sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/src/test-com.c.o.requires

.PHONY : sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/requires

sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/clean:
	cd /home/hou/scanner/build/sensors/dynpick_driver && $(CMAKE_COMMAND) -P CMakeFiles/dynpick_com_tester.dir/cmake_clean.cmake
.PHONY : sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/clean

sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/depend:
	cd /home/hou/scanner/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hou/scanner/src /home/hou/scanner/src/sensors/dynpick_driver /home/hou/scanner/build /home/hou/scanner/build/sensors/dynpick_driver /home/hou/scanner/build/sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : sensors/dynpick_driver/CMakeFiles/dynpick_com_tester.dir/depend

