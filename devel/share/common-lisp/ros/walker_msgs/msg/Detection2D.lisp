; Auto-generated. Do not edit!


(cl:in-package walker_msgs-msg)


;//! \htmlinclude Detection2D.msg.html

(cl:defclass <Detection2D> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (boxes
    :reader boxes
    :initarg :boxes
    :type (cl:vector walker_msgs-msg:BBox2D)
   :initform (cl:make-array 0 :element-type 'walker_msgs-msg:BBox2D :initial-element (cl:make-instance 'walker_msgs-msg:BBox2D)))
   (result_image
    :reader result_image
    :initarg :result_image
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass Detection2D (<Detection2D>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Detection2D>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Detection2D)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name walker_msgs-msg:<Detection2D> is deprecated: use walker_msgs-msg:Detection2D instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Detection2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-msg:header-val is deprecated.  Use walker_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'boxes-val :lambda-list '(m))
(cl:defmethod boxes-val ((m <Detection2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-msg:boxes-val is deprecated.  Use walker_msgs-msg:boxes instead.")
  (boxes m))

(cl:ensure-generic-function 'result_image-val :lambda-list '(m))
(cl:defmethod result_image-val ((m <Detection2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-msg:result_image-val is deprecated.  Use walker_msgs-msg:result_image instead.")
  (result_image m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Detection2D>) ostream)
  "Serializes a message object of type '<Detection2D>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'boxes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'boxes))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'result_image) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Detection2D>) istream)
  "Deserializes a message object of type '<Detection2D>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'boxes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'boxes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'walker_msgs-msg:BBox2D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'result_image) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Detection2D>)))
  "Returns string type for a message object of type '<Detection2D>"
  "walker_msgs/Detection2D")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Detection2D)))
  "Returns string type for a message object of type 'Detection2D"
  "walker_msgs/Detection2D")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Detection2D>)))
  "Returns md5sum for a message object of type '<Detection2D>"
  "dd8b9135a56521d4afeeec8a6c509df0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Detection2D)))
  "Returns md5sum for a message object of type 'Detection2D"
  "dd8b9135a56521d4afeeec8a6c509df0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Detection2D>)))
  "Returns full string definition for message of type '<Detection2D>"
  (cl:format cl:nil "std_msgs/Header header~%~%walker_msgs/BBox2D[] boxes~%~%sensor_msgs/Image result_image~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: walker_msgs/BBox2D~%int32 id~%string class_name~%float32 score~%~%geometry_msgs/Pose2D center~%float32 size_x~%float32 size_y~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Detection2D)))
  "Returns full string definition for message of type 'Detection2D"
  (cl:format cl:nil "std_msgs/Header header~%~%walker_msgs/BBox2D[] boxes~%~%sensor_msgs/Image result_image~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: walker_msgs/BBox2D~%int32 id~%string class_name~%float32 score~%~%geometry_msgs/Pose2D center~%float32 size_x~%float32 size_y~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Detection2D>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'boxes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'result_image))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Detection2D>))
  "Converts a ROS message object to a list"
  (cl:list 'Detection2D
    (cl:cons ':header (header msg))
    (cl:cons ':boxes (boxes msg))
    (cl:cons ':result_image (result_image msg))
))
