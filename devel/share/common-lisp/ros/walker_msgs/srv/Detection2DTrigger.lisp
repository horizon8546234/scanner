; Auto-generated. Do not edit!


(cl:in-package walker_msgs-srv)


;//! \htmlinclude Detection2DTrigger-request.msg.html

(cl:defclass <Detection2DTrigger-request> (roslisp-msg-protocol:ros-message)
  ((image
    :reader image
    :initarg :image
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass Detection2DTrigger-request (<Detection2DTrigger-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Detection2DTrigger-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Detection2DTrigger-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name walker_msgs-srv:<Detection2DTrigger-request> is deprecated: use walker_msgs-srv:Detection2DTrigger-request instead.")))

(cl:ensure-generic-function 'image-val :lambda-list '(m))
(cl:defmethod image-val ((m <Detection2DTrigger-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-srv:image-val is deprecated.  Use walker_msgs-srv:image instead.")
  (image m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Detection2DTrigger-request>) ostream)
  "Serializes a message object of type '<Detection2DTrigger-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'image) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Detection2DTrigger-request>) istream)
  "Deserializes a message object of type '<Detection2DTrigger-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'image) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Detection2DTrigger-request>)))
  "Returns string type for a service object of type '<Detection2DTrigger-request>"
  "walker_msgs/Detection2DTriggerRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Detection2DTrigger-request)))
  "Returns string type for a service object of type 'Detection2DTrigger-request"
  "walker_msgs/Detection2DTriggerRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Detection2DTrigger-request>)))
  "Returns md5sum for a message object of type '<Detection2DTrigger-request>"
  "cf923ddea53902c0e022439a3f0b0a31")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Detection2DTrigger-request)))
  "Returns md5sum for a message object of type 'Detection2DTrigger-request"
  "cf923ddea53902c0e022439a3f0b0a31")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Detection2DTrigger-request>)))
  "Returns full string definition for message of type '<Detection2DTrigger-request>"
  (cl:format cl:nil "sensor_msgs/Image image~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Detection2DTrigger-request)))
  "Returns full string definition for message of type 'Detection2DTrigger-request"
  (cl:format cl:nil "sensor_msgs/Image image~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Detection2DTrigger-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'image))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Detection2DTrigger-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Detection2DTrigger-request
    (cl:cons ':image (image msg))
))
;//! \htmlinclude Detection2DTrigger-response.msg.html

(cl:defclass <Detection2DTrigger-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type walker_msgs-msg:Detection2D
    :initform (cl:make-instance 'walker_msgs-msg:Detection2D)))
)

(cl:defclass Detection2DTrigger-response (<Detection2DTrigger-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Detection2DTrigger-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Detection2DTrigger-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name walker_msgs-srv:<Detection2DTrigger-response> is deprecated: use walker_msgs-srv:Detection2DTrigger-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <Detection2DTrigger-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-srv:result-val is deprecated.  Use walker_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Detection2DTrigger-response>) ostream)
  "Serializes a message object of type '<Detection2DTrigger-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'result) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Detection2DTrigger-response>) istream)
  "Deserializes a message object of type '<Detection2DTrigger-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'result) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Detection2DTrigger-response>)))
  "Returns string type for a service object of type '<Detection2DTrigger-response>"
  "walker_msgs/Detection2DTriggerResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Detection2DTrigger-response)))
  "Returns string type for a service object of type 'Detection2DTrigger-response"
  "walker_msgs/Detection2DTriggerResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Detection2DTrigger-response>)))
  "Returns md5sum for a message object of type '<Detection2DTrigger-response>"
  "cf923ddea53902c0e022439a3f0b0a31")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Detection2DTrigger-response)))
  "Returns md5sum for a message object of type 'Detection2DTrigger-response"
  "cf923ddea53902c0e022439a3f0b0a31")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Detection2DTrigger-response>)))
  "Returns full string definition for message of type '<Detection2DTrigger-response>"
  (cl:format cl:nil "walker_msgs/Detection2D result~%~%~%================================================================================~%MSG: walker_msgs/Detection2D~%std_msgs/Header header~%~%walker_msgs/BBox2D[] boxes~%~%sensor_msgs/Image result_image~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: walker_msgs/BBox2D~%int32 id~%string class_name~%float32 score~%~%geometry_msgs/Pose2D center~%float32 size_x~%float32 size_y~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Detection2DTrigger-response)))
  "Returns full string definition for message of type 'Detection2DTrigger-response"
  (cl:format cl:nil "walker_msgs/Detection2D result~%~%~%================================================================================~%MSG: walker_msgs/Detection2D~%std_msgs/Header header~%~%walker_msgs/BBox2D[] boxes~%~%sensor_msgs/Image result_image~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: walker_msgs/BBox2D~%int32 id~%string class_name~%float32 score~%~%geometry_msgs/Pose2D center~%float32 size_x~%float32 size_y~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Detection2DTrigger-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Detection2DTrigger-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Detection2DTrigger-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Detection2DTrigger)))
  'Detection2DTrigger-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Detection2DTrigger)))
  'Detection2DTrigger-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Detection2DTrigger)))
  "Returns string type for a service object of type '<Detection2DTrigger>"
  "walker_msgs/Detection2DTrigger")