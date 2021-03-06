#
# Licence: GPL
# Created: Tue, 12 Jan 2016 14:37:39 +0100
# Main authors:
#     - hoel <hvasseur@openwide.fr>
#


#set Cmake minimum required version
cmake_minimum_required(VERSION 2.8)

#projet name and version
project($PROJECT_DIR)
# The version number.
set (Tutorial_VERSION_MAJOR 0)
set (Tutorial_VERSION_MINOR 1)

#add directories of project
include_directories(
  $PROJECT_DIR/src
  $PROJECT_DIR/bin
  $PROJECT_DIR/include
)

#add source and header 
file(GLOB_RECURSE ${PROJECT_DIR}_SRC src/*)
file(GLOB_RECURSE ${PROJECT_DIR}_HEADER include/*)
add_executable($PROJECT_DIR \${${PROJECT_DIR}_SRC} \${${PROJECT_DIR}_HEADER} )


#Link specific libraries to target: here net-snmp, obtain with `net-snmp-confif --libs`
set(Build_libs "")
target_link_libraries(${PROJECT_DIR} ${Build_libs})

#set debug as default configuration, to buld release run "cmake -DCMAKE_BUILD_TYPE=Release" or simply the alias cmakerelease
if( NOT CMAKE_BUILD_TYPE )
	set( CMAKE_BUILD_TYPE DEBUG CACHE STRING
		"Build type set default as not specified."
		FORCE )
endif()

#Compilation flags
set(CMAKE_C_FLAGS "\${CMAKE_C_FLAGS} -Wall -I. \${CFLAGS}") #always
set(CMAKE_CXX_FLAGS_DEBUG "\${CMAKE_CXX_FLAGS_DEBUG} -g -00") #for debugging
set(CMAKE_CXX_FLAGS_RELEASE "\${CMAKE_CXX_FLAGS_RELEASE} -Wall")#for release

#set ouput directory based on build type
if( CMAKE_BUILD_TYPE STREQUAL DEBUG)
	SET(EXECUTABLE_OUTPUT_PATH \${PROJECT_BINARY_DIR}/bin/Debug) #debug VERSION
elseif ( CMAKE_BUILD_TYPE STREQUAL RELEASE)
	SET( EXECUTABLE_OUTPUT_PATH \${PROJECT_BINARY_DIR}/bin/Release)#release version
else()
	SET( EXECUTABLE_OUTPUT_PATH \${PROJECT_BINARY_DIR}/bin)#default version
endif()


#display info to user
message(STATUS "CMAKE_GENERATOR      : \${CMAKE_GENERATOR}")
message(STATUS "PRJ 		        : \${PROJECT_NAME}")
message(STATUS "BINARY_DIR           : \${EXECUTABLE_OUTPUT_PATH}")
message(STATUS "SRC_DIR 		: \${PROJECT_SOURCE_DIR}/src")
message(STATUS "SYSTEM_NAME 		: \${CMAKE_SYSTEM_NAME}")
message(STATUS "BUILD_TYPE  		: \${CMAKE_BUILD_TYPE}")
