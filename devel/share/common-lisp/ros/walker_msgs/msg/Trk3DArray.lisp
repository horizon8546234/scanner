; Auto-generated. Do not edit!


(cl:in-package walker_msgs-msg)


;//! \htmlinclude Trk3DArray.msg.html

(cl:defclass <Trk3DArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (trks_list
    :reader trks_list
    :initarg :trks_list
    :type (cl:vector walker_msgs-msg:Trk3D)
   :initform (cl:make-array 0 :element-type 'walker_msgs-msg:Trk3D :initial-element (cl:make-instance 'walker_msgs-msg:Trk3D)))
   (pointcloud
    :reader pointcloud
    :initarg :pointcloud
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2))
   (scan
    :reader scan
    :initarg :scan
    :type sensor_msgs-msg:LaserScan
    :initform (cl:make-instance 'sensor_msgs-msg:LaserScan)))
)

(cl:defclass Trk3DArray (<Trk3DArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Trk3DArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Trk3DArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name walker_msgs-msg:<Trk3DArray> is deprecated: use walker_msgs-msg:Trk3DArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Trk3DArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-msg:header-val is deprecated.  Use walker_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'trks_list-val :lambda-list '(m))
(cl:defmethod trks_list-val ((m <Trk3DArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-msg:trks_list-val is deprecated.  Use walker_msgs-msg:trks_list instead.")
  (trks_list m))

(cl:ensure-generic-function 'pointcloud-val :lambda-list '(m))
(cl:defmethod pointcloud-val ((m <Trk3DArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-msg:pointcloud-val is deprecated.  Use walker_msgs-msg:pointcloud instead.")
  (pointcloud m))

(cl:ensure-generic-function 'scan-val :lambda-list '(m))
(cl:defmethod scan-val ((m <Trk3DArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-msg:scan-val is deprecated.  Use walker_msgs-msg:scan instead.")
  (scan m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Trk3DArray>) ostream)
  "Serializes a message object of type '<Trk3DArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'trks_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'trks_list))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pointcloud) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'scan) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Trk3DArray>) istream)
  "Deserializes a message object of type '<Trk3DArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'trks_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'trks_list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'walker_msgs-msg:Trk3D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pointcloud) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'scan) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Trk3DArray>)))
  "Returns string type for a message object of type '<Trk3DArray>"
  "walker_msgs/Trk3DArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Trk3DArray)))
  "Returns string type for a message object of type 'Trk3DArray"
  "walker_msgs/Trk3DArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Trk3DArray>)))
  "Returns md5sum for a message object of type '<Trk3DArray>"
  "418628728267a097595ff80736ff85e7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Trk3DArray)))
  "Returns md5sum for a message object of type 'Trk3DArray"
  "418628728267a097595ff80736ff85e7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Trk3DArray>)))
  "Returns full string definition for message of type '<Trk3DArray>"
  (cl:format cl:nil "std_msgs/Header header~%~%walker_msgs/Trk3D[] trks_list~%~%sensor_msgs/PointCloud2 pointcloud~%~%sensor_msgs/LaserScan scan~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: walker_msgs/Trk3D~%float32 x~%float32 y~%float32 vx~%float32 vy~%float32 yaw~%float32 radius~%float32 confidence~%int8 class_id~%float32 dangerous~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%================================================================================~%MSG: sensor_msgs/LaserScan~%# Single scan from a planar laser range-finder~%#~%# If you have another ranging device with different behavior (e.g. a sonar~%# array), please find or create a different message, since applications~%# will make fairly laser-specific assumptions about this data~%~%Header header            # timestamp in the header is the acquisition time of ~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around ~%                         # the positive Z axis (counterclockwise, if Z is up)~%                         # with zero angle being forward along the x axis~%                         ~%float32 angle_min        # start angle of the scan [rad]~%float32 angle_max        # end angle of the scan [rad]~%float32 angle_increment  # angular distance between measurements [rad]~%~%float32 time_increment   # time between measurements [seconds] - if your scanner~%                         # is moving, this will be used in interpolating position~%                         # of 3d points~%float32 scan_time        # time between scans [seconds]~%~%float32 range_min        # minimum range value [m]~%float32 range_max        # maximum range value [m]~%~%float32[] ranges         # range data [m] (Note: values < range_min or > range_max should be discarded)~%float32[] intensities    # intensity data [device-specific units].  If your~%                         # device does not provide intensities, please leave~%                         # the array empty.~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Trk3DArray)))
  "Returns full string definition for message of type 'Trk3DArray"
  (cl:format cl:nil "std_msgs/Header header~%~%walker_msgs/Trk3D[] trks_list~%~%sensor_msgs/PointCloud2 pointcloud~%~%sensor_msgs/LaserScan scan~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: walker_msgs/Trk3D~%float32 x~%float32 y~%float32 vx~%float32 vy~%float32 yaw~%float32 radius~%float32 confidence~%int8 class_id~%float32 dangerous~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%================================================================================~%MSG: sensor_msgs/LaserScan~%# Single scan from a planar laser range-finder~%#~%# If you have another ranging device with different behavior (e.g. a sonar~%# array), please find or create a different message, since applications~%# will make fairly laser-specific assumptions about this data~%~%Header header            # timestamp in the header is the acquisition time of ~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around ~%                         # the positive Z axis (counterclockwise, if Z is up)~%                         # with zero angle being forward along the x axis~%                         ~%float32 angle_min        # start angle of the scan [rad]~%float32 angle_max        # end angle of the scan [rad]~%float32 angle_increment  # angular distance between measurements [rad]~%~%float32 time_increment   # time between measurements [seconds] - if your scanner~%                         # is moving, this will be used in interpolating position~%                         # of 3d points~%float32 scan_time        # time between scans [seconds]~%~%float32 range_min        # minimum range value [m]~%float32 range_max        # maximum range value [m]~%~%float32[] ranges         # range data [m] (Note: values < range_min or > range_max should be discarded)~%float32[] intensities    # intensity data [device-specific units].  If your~%                         # device does not provide intensities, please leave~%                         # the array empty.~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Trk3DArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'trks_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pointcloud))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'scan))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Trk3DArray>))
  "Converts a ROS message object to a list"
  (cl:list 'Trk3DArray
    (cl:cons ':header (header msg))
    (cl:cons ':trks_list (trks_list msg))
    (cl:cons ':pointcloud (pointcloud msg))
    (cl:cons ':scan (scan msg))
))
