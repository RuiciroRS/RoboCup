# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_SOURCE_DIR = /home/ruiciro/JuegoGC

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ruiciro/JuegoGC/build-cross-atom

# Include any dependencies generated for this target.
include CMakeFiles/goalkeeper.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/goalkeeper.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/goalkeeper.dir/flags.make

CMakeFiles/goalkeeper.dir/main.cpp.o: CMakeFiles/goalkeeper.dir/flags.make
CMakeFiles/goalkeeper.dir/main.cpp.o: ../main.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ruiciro/JuegoGC/build-cross-atom/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/goalkeeper.dir/main.cpp.o"
	/home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/cross/bin/i686-aldebaran-linux-gnu-g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/goalkeeper.dir/main.cpp.o -c /home/ruiciro/JuegoGC/main.cpp

CMakeFiles/goalkeeper.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/goalkeeper.dir/main.cpp.i"
	/home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/cross/bin/i686-aldebaran-linux-gnu-g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/ruiciro/JuegoGC/main.cpp > CMakeFiles/goalkeeper.dir/main.cpp.i

CMakeFiles/goalkeeper.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/goalkeeper.dir/main.cpp.s"
	/home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/cross/bin/i686-aldebaran-linux-gnu-g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/ruiciro/JuegoGC/main.cpp -o CMakeFiles/goalkeeper.dir/main.cpp.s

CMakeFiles/goalkeeper.dir/main.cpp.o.requires:
.PHONY : CMakeFiles/goalkeeper.dir/main.cpp.o.requires

CMakeFiles/goalkeeper.dir/main.cpp.o.provides: CMakeFiles/goalkeeper.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/goalkeeper.dir/build.make CMakeFiles/goalkeeper.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/goalkeeper.dir/main.cpp.o.provides

CMakeFiles/goalkeeper.dir/main.cpp.o.provides.build: CMakeFiles/goalkeeper.dir/main.cpp.o

CMakeFiles/goalkeeper.dir/CJuego.cpp.o: CMakeFiles/goalkeeper.dir/flags.make
CMakeFiles/goalkeeper.dir/CJuego.cpp.o: ../CJuego.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ruiciro/JuegoGC/build-cross-atom/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/goalkeeper.dir/CJuego.cpp.o"
	/home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/cross/bin/i686-aldebaran-linux-gnu-g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/goalkeeper.dir/CJuego.cpp.o -c /home/ruiciro/JuegoGC/CJuego.cpp

CMakeFiles/goalkeeper.dir/CJuego.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/goalkeeper.dir/CJuego.cpp.i"
	/home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/cross/bin/i686-aldebaran-linux-gnu-g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/ruiciro/JuegoGC/CJuego.cpp > CMakeFiles/goalkeeper.dir/CJuego.cpp.i

CMakeFiles/goalkeeper.dir/CJuego.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/goalkeeper.dir/CJuego.cpp.s"
	/home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/cross/bin/i686-aldebaran-linux-gnu-g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/ruiciro/JuegoGC/CJuego.cpp -o CMakeFiles/goalkeeper.dir/CJuego.cpp.s

CMakeFiles/goalkeeper.dir/CJuego.cpp.o.requires:
.PHONY : CMakeFiles/goalkeeper.dir/CJuego.cpp.o.requires

CMakeFiles/goalkeeper.dir/CJuego.cpp.o.provides: CMakeFiles/goalkeeper.dir/CJuego.cpp.o.requires
	$(MAKE) -f CMakeFiles/goalkeeper.dir/build.make CMakeFiles/goalkeeper.dir/CJuego.cpp.o.provides.build
.PHONY : CMakeFiles/goalkeeper.dir/CJuego.cpp.o.provides

CMakeFiles/goalkeeper.dir/CJuego.cpp.o.provides.build: CMakeFiles/goalkeeper.dir/CJuego.cpp.o

CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.o: CMakeFiles/goalkeeper.dir/flags.make
CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.o: ../Goalkeeper.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ruiciro/JuegoGC/build-cross-atom/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.o"
	/home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/cross/bin/i686-aldebaran-linux-gnu-g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.o -c /home/ruiciro/JuegoGC/Goalkeeper.cpp

CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.i"
	/home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/cross/bin/i686-aldebaran-linux-gnu-g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/ruiciro/JuegoGC/Goalkeeper.cpp > CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.i

CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.s"
	/home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/cross/bin/i686-aldebaran-linux-gnu-g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/ruiciro/JuegoGC/Goalkeeper.cpp -o CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.s

CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.o.requires:
.PHONY : CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.o.requires

CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.o.provides: CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.o.requires
	$(MAKE) -f CMakeFiles/goalkeeper.dir/build.make CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.o.provides.build
.PHONY : CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.o.provides

CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.o.provides.build: CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.o

# Object files for target goalkeeper
goalkeeper_OBJECTS = \
"CMakeFiles/goalkeeper.dir/main.cpp.o" \
"CMakeFiles/goalkeeper.dir/CJuego.cpp.o" \
"CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.o"

# External object files for target goalkeeper
goalkeeper_EXTERNAL_OBJECTS =

sdk/lib/naoqi/libgoalkeeper.so: CMakeFiles/goalkeeper.dir/main.cpp.o
sdk/lib/naoqi/libgoalkeeper.so: CMakeFiles/goalkeeper.dir/CJuego.cpp.o
sdk/lib/naoqi/libgoalkeeper.so: CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.o
sdk/lib/naoqi/libgoalkeeper.so: CMakeFiles/goalkeeper.dir/build.make
sdk/lib/naoqi/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libalproxies.so
sdk/lib/naoqi/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libalsoap.so
sdk/lib/naoqi/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/librttools.so
sdk/lib/naoqi/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libalthread.so
sdk/lib/naoqi/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libboost_signals-mt.so
sdk/lib/naoqi/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libboost_program_options-mt.so
sdk/lib/naoqi/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libalvalue.so
sdk/lib/naoqi/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libtinyxml.so
sdk/lib/naoqi/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/librt.so
sdk/lib/naoqi/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libqi.so
sdk/lib/naoqi/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libalerror.so
sdk/lib/naoqi/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libboost_filesystem-mt.so
sdk/lib/naoqi/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libboost_thread-mt.so
sdk/lib/naoqi/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libpthread.so
sdk/lib/naoqi/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libboost_system-mt.so
sdk/lib/naoqi/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libdl.so
sdk/lib/naoqi/libgoalkeeper.so: CMakeFiles/goalkeeper.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library sdk/lib/naoqi/libgoalkeeper.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/goalkeeper.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/goalkeeper.dir/build: sdk/lib/naoqi/libgoalkeeper.so
.PHONY : CMakeFiles/goalkeeper.dir/build

# Object files for target goalkeeper
goalkeeper_OBJECTS = \
"CMakeFiles/goalkeeper.dir/main.cpp.o" \
"CMakeFiles/goalkeeper.dir/CJuego.cpp.o" \
"CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.o"

# External object files for target goalkeeper
goalkeeper_EXTERNAL_OBJECTS =

CMakeFiles/CMakeRelink.dir/libgoalkeeper.so: CMakeFiles/goalkeeper.dir/main.cpp.o
CMakeFiles/CMakeRelink.dir/libgoalkeeper.so: CMakeFiles/goalkeeper.dir/CJuego.cpp.o
CMakeFiles/CMakeRelink.dir/libgoalkeeper.so: CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.o
CMakeFiles/CMakeRelink.dir/libgoalkeeper.so: CMakeFiles/goalkeeper.dir/build.make
CMakeFiles/CMakeRelink.dir/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libalproxies.so
CMakeFiles/CMakeRelink.dir/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libalsoap.so
CMakeFiles/CMakeRelink.dir/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/librttools.so
CMakeFiles/CMakeRelink.dir/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libalthread.so
CMakeFiles/CMakeRelink.dir/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libboost_signals-mt.so
CMakeFiles/CMakeRelink.dir/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libboost_program_options-mt.so
CMakeFiles/CMakeRelink.dir/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libalvalue.so
CMakeFiles/CMakeRelink.dir/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libtinyxml.so
CMakeFiles/CMakeRelink.dir/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/librt.so
CMakeFiles/CMakeRelink.dir/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libqi.so
CMakeFiles/CMakeRelink.dir/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libalerror.so
CMakeFiles/CMakeRelink.dir/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libboost_filesystem-mt.so
CMakeFiles/CMakeRelink.dir/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libboost_thread-mt.so
CMakeFiles/CMakeRelink.dir/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libpthread.so
CMakeFiles/CMakeRelink.dir/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libboost_system-mt.so
CMakeFiles/CMakeRelink.dir/libgoalkeeper.so: /home/ruiciro/SPL/linux64-nao-atom-cross-toolchain-1.14.5/sysroot/usr/lib/libdl.so
CMakeFiles/CMakeRelink.dir/libgoalkeeper.so: CMakeFiles/goalkeeper.dir/relink.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library CMakeFiles/CMakeRelink.dir/libgoalkeeper.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/goalkeeper.dir/relink.txt --verbose=$(VERBOSE)

# Rule to relink during preinstall.
CMakeFiles/goalkeeper.dir/preinstall: CMakeFiles/CMakeRelink.dir/libgoalkeeper.so
.PHONY : CMakeFiles/goalkeeper.dir/preinstall

CMakeFiles/goalkeeper.dir/requires: CMakeFiles/goalkeeper.dir/main.cpp.o.requires
CMakeFiles/goalkeeper.dir/requires: CMakeFiles/goalkeeper.dir/CJuego.cpp.o.requires
CMakeFiles/goalkeeper.dir/requires: CMakeFiles/goalkeeper.dir/Goalkeeper.cpp.o.requires
.PHONY : CMakeFiles/goalkeeper.dir/requires

CMakeFiles/goalkeeper.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/goalkeeper.dir/cmake_clean.cmake
.PHONY : CMakeFiles/goalkeeper.dir/clean

CMakeFiles/goalkeeper.dir/depend:
	cd /home/ruiciro/JuegoGC/build-cross-atom && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ruiciro/JuegoGC /home/ruiciro/JuegoGC /home/ruiciro/JuegoGC/build-cross-atom /home/ruiciro/JuegoGC/build-cross-atom /home/ruiciro/JuegoGC/build-cross-atom/CMakeFiles/goalkeeper.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/goalkeeper.dir/depend
