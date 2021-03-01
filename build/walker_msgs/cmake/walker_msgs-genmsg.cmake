# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "walker_msgs: 6 messages, 1 services")

set(MSG_I_FLAGS "-Iwalker_msgs:/home/hou/scanner/src/walker_msgs/msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Inav_msgs:/opt/ros/melodic/share/nav_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Ivisualization_msgs:/opt/ros/melodic/share/visualization_msgs/cmake/../msg;-Iwalker_msgs:/home/hou/scanner/src/walker_msgs/msg;-Iactionlib_msgs:/opt/ros/melodic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(walker_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/BBox2D.msg" NAME_WE)
add_custom_target(_walker_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "walker_msgs" "/home/hou/scanner/src/walker_msgs/msg/BBox2D.msg" "geometry_msgs/Pose2D"
)

get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Detection2D.msg" NAME_WE)
add_custom_target(_walker_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "walker_msgs" "/home/hou/scanner/src/walker_msgs/msg/Detection2D.msg" "std_msgs/Header:walker_msgs/BBox2D:geometry_msgs/Pose2D:sensor_msgs/Image"
)

get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Det3D.msg" NAME_WE)
add_custom_target(_walker_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "walker_msgs" "/home/hou/scanner/src/walker_msgs/msg/Det3D.msg" ""
)

get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Det3DArray.msg" NAME_WE)
add_custom_target(_walker_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "walker_msgs" "/home/hou/scanner/src/walker_msgs/msg/Det3DArray.msg" "walker_msgs/Det3D:sensor_msgs/PointCloud2:sensor_msgs/PointField:std_msgs/Header:sensor_msgs/LaserScan"
)

get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Trk3D.msg" NAME_WE)
add_custom_target(_walker_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "walker_msgs" "/home/hou/scanner/src/walker_msgs/msg/Trk3D.msg" ""
)

get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Trk3DArray.msg" NAME_WE)
add_custom_target(_walker_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "walker_msgs" "/home/hou/scanner/src/walker_msgs/msg/Trk3DArray.msg" "sensor_msgs/PointCloud2:sensor_msgs/PointField:sensor_msgs/LaserScan:std_msgs/Header:walker_msgs/Trk3D"
)

get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/srv/Detection2DTrigger.srv" NAME_WE)
add_custom_target(_walker_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "walker_msgs" "/home/hou/scanner/src/walker_msgs/srv/Detection2DTrigger.srv" "walker_msgs/Detection2D:std_msgs/Header:sensor_msgs/Image:walker_msgs/BBox2D:geometry_msgs/Pose2D"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/BBox2D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/walker_msgs
)
_generate_msg_cpp(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Detection2D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/hou/scanner/src/walker_msgs/msg/BBox2D.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/walker_msgs
)
_generate_msg_cpp(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Det3D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/walker_msgs
)
_generate_msg_cpp(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Det3DArray.msg"
  "${MSG_I_FLAGS}"
  "/home/hou/scanner/src/walker_msgs/msg/Det3D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/LaserScan.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/walker_msgs
)
_generate_msg_cpp(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Trk3D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/walker_msgs
)
_generate_msg_cpp(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Trk3DArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/LaserScan.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/hou/scanner/src/walker_msgs/msg/Trk3D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/walker_msgs
)

### Generating Services
_generate_srv_cpp(walker_msgs
  "/home/hou/scanner/src/walker_msgs/srv/Detection2DTrigger.srv"
  "${MSG_I_FLAGS}"
  "/home/hou/scanner/src/walker_msgs/msg/Detection2D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/hou/scanner/src/walker_msgs/msg/BBox2D.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/walker_msgs
)

### Generating Module File
_generate_module_cpp(walker_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/walker_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(walker_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(walker_msgs_generate_messages walker_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/BBox2D.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_cpp _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Detection2D.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_cpp _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Det3D.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_cpp _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Det3DArray.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_cpp _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Trk3D.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_cpp _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Trk3DArray.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_cpp _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/srv/Detection2DTrigger.srv" NAME_WE)
add_dependencies(walker_msgs_generate_messages_cpp _walker_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(walker_msgs_gencpp)
add_dependencies(walker_msgs_gencpp walker_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS walker_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/BBox2D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/walker_msgs
)
_generate_msg_eus(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Detection2D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/hou/scanner/src/walker_msgs/msg/BBox2D.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/walker_msgs
)
_generate_msg_eus(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Det3D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/walker_msgs
)
_generate_msg_eus(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Det3DArray.msg"
  "${MSG_I_FLAGS}"
  "/home/hou/scanner/src/walker_msgs/msg/Det3D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/LaserScan.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/walker_msgs
)
_generate_msg_eus(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Trk3D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/walker_msgs
)
_generate_msg_eus(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Trk3DArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/LaserScan.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/hou/scanner/src/walker_msgs/msg/Trk3D.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/walker_msgs
)

### Generating Services
_generate_srv_eus(walker_msgs
  "/home/hou/scanner/src/walker_msgs/srv/Detection2DTrigger.srv"
  "${MSG_I_FLAGS}"
  "/home/hou/scanner/src/walker_msgs/msg/Detection2D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/hou/scanner/src/walker_msgs/msg/BBox2D.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/walker_msgs
)

### Generating Module File
_generate_module_eus(walker_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/walker_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(walker_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(walker_msgs_generate_messages walker_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/BBox2D.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_eus _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Detection2D.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_eus _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Det3D.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_eus _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Det3DArray.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_eus _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Trk3D.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_eus _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Trk3DArray.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_eus _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/srv/Detection2DTrigger.srv" NAME_WE)
add_dependencies(walker_msgs_generate_messages_eus _walker_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(walker_msgs_geneus)
add_dependencies(walker_msgs_geneus walker_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS walker_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/BBox2D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/walker_msgs
)
_generate_msg_lisp(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Detection2D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/hou/scanner/src/walker_msgs/msg/BBox2D.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/walker_msgs
)
_generate_msg_lisp(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Det3D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/walker_msgs
)
_generate_msg_lisp(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Det3DArray.msg"
  "${MSG_I_FLAGS}"
  "/home/hou/scanner/src/walker_msgs/msg/Det3D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/LaserScan.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/walker_msgs
)
_generate_msg_lisp(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Trk3D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/walker_msgs
)
_generate_msg_lisp(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Trk3DArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/LaserScan.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/hou/scanner/src/walker_msgs/msg/Trk3D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/walker_msgs
)

### Generating Services
_generate_srv_lisp(walker_msgs
  "/home/hou/scanner/src/walker_msgs/srv/Detection2DTrigger.srv"
  "${MSG_I_FLAGS}"
  "/home/hou/scanner/src/walker_msgs/msg/Detection2D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/hou/scanner/src/walker_msgs/msg/BBox2D.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/walker_msgs
)

### Generating Module File
_generate_module_lisp(walker_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/walker_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(walker_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(walker_msgs_generate_messages walker_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/BBox2D.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_lisp _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Detection2D.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_lisp _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Det3D.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_lisp _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Det3DArray.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_lisp _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Trk3D.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_lisp _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Trk3DArray.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_lisp _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/srv/Detection2DTrigger.srv" NAME_WE)
add_dependencies(walker_msgs_generate_messages_lisp _walker_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(walker_msgs_genlisp)
add_dependencies(walker_msgs_genlisp walker_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS walker_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/BBox2D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/walker_msgs
)
_generate_msg_nodejs(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Detection2D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/hou/scanner/src/walker_msgs/msg/BBox2D.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/walker_msgs
)
_generate_msg_nodejs(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Det3D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/walker_msgs
)
_generate_msg_nodejs(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Det3DArray.msg"
  "${MSG_I_FLAGS}"
  "/home/hou/scanner/src/walker_msgs/msg/Det3D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/LaserScan.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/walker_msgs
)
_generate_msg_nodejs(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Trk3D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/walker_msgs
)
_generate_msg_nodejs(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Trk3DArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/LaserScan.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/hou/scanner/src/walker_msgs/msg/Trk3D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/walker_msgs
)

### Generating Services
_generate_srv_nodejs(walker_msgs
  "/home/hou/scanner/src/walker_msgs/srv/Detection2DTrigger.srv"
  "${MSG_I_FLAGS}"
  "/home/hou/scanner/src/walker_msgs/msg/Detection2D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/hou/scanner/src/walker_msgs/msg/BBox2D.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/walker_msgs
)

### Generating Module File
_generate_module_nodejs(walker_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/walker_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(walker_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(walker_msgs_generate_messages walker_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/BBox2D.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_nodejs _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Detection2D.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_nodejs _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Det3D.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_nodejs _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Det3DArray.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_nodejs _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Trk3D.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_nodejs _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Trk3DArray.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_nodejs _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/srv/Detection2DTrigger.srv" NAME_WE)
add_dependencies(walker_msgs_generate_messages_nodejs _walker_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(walker_msgs_gennodejs)
add_dependencies(walker_msgs_gennodejs walker_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS walker_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/BBox2D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/walker_msgs
)
_generate_msg_py(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Detection2D.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/hou/scanner/src/walker_msgs/msg/BBox2D.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/walker_msgs
)
_generate_msg_py(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Det3D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/walker_msgs
)
_generate_msg_py(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Det3DArray.msg"
  "${MSG_I_FLAGS}"
  "/home/hou/scanner/src/walker_msgs/msg/Det3D.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/LaserScan.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/walker_msgs
)
_generate_msg_py(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Trk3D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/walker_msgs
)
_generate_msg_py(walker_msgs
  "/home/hou/scanner/src/walker_msgs/msg/Trk3DArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/LaserScan.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/hou/scanner/src/walker_msgs/msg/Trk3D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/walker_msgs
)

### Generating Services
_generate_srv_py(walker_msgs
  "/home/hou/scanner/src/walker_msgs/srv/Detection2DTrigger.srv"
  "${MSG_I_FLAGS}"
  "/home/hou/scanner/src/walker_msgs/msg/Detection2D.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/Image.msg;/home/hou/scanner/src/walker_msgs/msg/BBox2D.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/walker_msgs
)

### Generating Module File
_generate_module_py(walker_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/walker_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(walker_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(walker_msgs_generate_messages walker_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/BBox2D.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_py _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Detection2D.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_py _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Det3D.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_py _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Det3DArray.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_py _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Trk3D.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_py _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/msg/Trk3DArray.msg" NAME_WE)
add_dependencies(walker_msgs_generate_messages_py _walker_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hou/scanner/src/walker_msgs/srv/Detection2DTrigger.srv" NAME_WE)
add_dependencies(walker_msgs_generate_messages_py _walker_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(walker_msgs_genpy)
add_dependencies(walker_msgs_genpy walker_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS walker_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/walker_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/walker_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(walker_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(walker_msgs_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(walker_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(walker_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET visualization_msgs_generate_messages_cpp)
  add_dependencies(walker_msgs_generate_messages_cpp visualization_msgs_generate_messages_cpp)
endif()
if(TARGET walker_msgs_generate_messages_cpp)
  add_dependencies(walker_msgs_generate_messages_cpp walker_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/walker_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/walker_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(walker_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(walker_msgs_generate_messages_eus nav_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(walker_msgs_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(walker_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET visualization_msgs_generate_messages_eus)
  add_dependencies(walker_msgs_generate_messages_eus visualization_msgs_generate_messages_eus)
endif()
if(TARGET walker_msgs_generate_messages_eus)
  add_dependencies(walker_msgs_generate_messages_eus walker_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/walker_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/walker_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(walker_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(walker_msgs_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(walker_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(walker_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET visualization_msgs_generate_messages_lisp)
  add_dependencies(walker_msgs_generate_messages_lisp visualization_msgs_generate_messages_lisp)
endif()
if(TARGET walker_msgs_generate_messages_lisp)
  add_dependencies(walker_msgs_generate_messages_lisp walker_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/walker_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/walker_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(walker_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(walker_msgs_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(walker_msgs_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(walker_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET visualization_msgs_generate_messages_nodejs)
  add_dependencies(walker_msgs_generate_messages_nodejs visualization_msgs_generate_messages_nodejs)
endif()
if(TARGET walker_msgs_generate_messages_nodejs)
  add_dependencies(walker_msgs_generate_messages_nodejs walker_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/walker_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/walker_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/walker_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(walker_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(walker_msgs_generate_messages_py nav_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(walker_msgs_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(walker_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET visualization_msgs_generate_messages_py)
  add_dependencies(walker_msgs_generate_messages_py visualization_msgs_generate_messages_py)
endif()
if(TARGET walker_msgs_generate_messages_py)
  add_dependencies(walker_msgs_generate_messages_py walker_msgs_generate_messages_py)
endif()
