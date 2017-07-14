cmake_minimum_required(VERSION 2.8)
project(JuegoGC)

find_package(qibuild)

option(CJUEGO_IS_REMOTE
  "module is compiled as a remote module (ON or OFF)"
  ON)

set(_srcs
  main.cpp
  CJuego.h
  CJuego.cpp
  RoboCupGameControlData.h
  SPLCoachMessage.h
  Goalkeeper.cpp
  Goalkeeper.h
)


qi_create_lib(Goalkeeper SHARED ${_srcs} SUBFOLDER naoqi)

qi_use_lib(Goalkeeper ALCOMMON BOOST)

if(CJUEGO_IS_REMOTE)
  add_definitions(" -DCJUEGO_IS_REMOTE ")
  qi_create_bin(juegoGC ${_srcs})
else()
  qi_create_lib(juegoGC SHARED ${_srcs} SUBFOLDER naoqi)
endif()

qi_use_lib(juegoGC ALCOMMON ALVISION OPENCV2_CORE OPENCV2_IMGPROC)
qi_use_lib(Goalkeeper ALCOMMON ALVISION OPENCV2_CORE OPENCV2_IMGPROC)
