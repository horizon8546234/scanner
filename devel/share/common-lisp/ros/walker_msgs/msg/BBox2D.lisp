; Auto-generated. Do not edit!


(cl:in-package walker_msgs-msg)


;//! \htmlinclude BBox2D.msg.html

(cl:defclass <BBox2D> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (class_name
    :reader class_name
    :initarg :class_name
    :type cl:string
    :initform "")
   (score
    :reader score
    :initarg :score
    :type cl:float
    :initform 0.0)
   (center
    :reader center
    :initarg :center
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D))
   (size_x
    :reader size_x
    :initarg :size_x
    :type cl:float
    :initform 0.0)
   (size_y
    :reader size_y
    :initarg :size_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass BBox2D (<BBox2D>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BBox2D>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BBox2D)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name walker_msgs-msg:<BBox2D> is deprecated: use walker_msgs-msg:BBox2D instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <BBox2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-msg:id-val is deprecated.  Use walker_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'class_name-val :lambda-list '(m))
(cl:defmethod class_name-val ((m <BBox2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-msg:class_name-val is deprecated.  Use walker_msgs-msg:class_name instead.")
  (class_name m))

(cl:ensure-generic-function 'score-val :lambda-list '(m))
(cl:defmethod score-val ((m <BBox2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-msg:score-val is deprecated.  Use walker_msgs-msg:score instead.")
  (score m))

(cl:ensure-generic-function 'center-val :lambda-list '(m))
(cl:defmethod center-val ((m <BBox2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-msg:center-val is deprecated.  Use walker_msgs-msg:center instead.")
  (center m))

(cl:ensure-generic-function 'size_x-val :lambda-list '(m))
(cl:defmethod size_x-val ((m <BBox2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-msg:size_x-val is deprecated.  Use walker_msgs-msg:size_x instead.")
  (size_x m))

(cl:ensure-generic-function 'size_y-val :lambda-list '(m))
(cl:defmethod size_y-val ((m <BBox2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-msg:size_y-val is deprecated.  Use walker_msgs-msg:size_y instead.")
  (size_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BBox2D>) ostream)
  "Serializes a message object of type '<BBox2D>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'class_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'class_name))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'score))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'center) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'size_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'size_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BBox2D>) istream)
  "Deserializes a message object of type '<BBox2D>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'class_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'class_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'score) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'center) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'size_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'size_y) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BBox2D>)))
  "Returns string type for a message object of type '<BBox2D>"
  "walker_msgs/BBox2D")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BBox2D)))
  "Returns string type for a message object of type 'BBox2D"
  "walker_msgs/BBox2D")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BBox2D>)))
  "Returns md5sum for a message object of type '<BBox2D>"
  "0c77df3d2730bffc00b93fb5799a0241")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BBox2D)))
  "Returns md5sum for a message object of type 'BBox2D"
  "0c77df3d2730bffc00b93fb5799a0241")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BBox2D>)))
  "Returns full string definition for message of type '<BBox2D>"
  (cl:format cl:nil "int32 id~%string class_name~%float32 score~%~%geometry_msgs/Pose2D center~%float32 size_x~%float32 size_y~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BBox2D)))
  "Returns full string definition for message of type 'BBox2D"
  (cl:format cl:nil "int32 id~%string class_name~%float32 score~%~%geometry_msgs/Pose2D center~%float32 size_x~%float32 size_y~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BBox2D>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'class_name))
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'center))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BBox2D>))
  "Converts a ROS message object to a list"
  (cl:list 'BBox2D
    (cl:cons ':id (id msg))
    (cl:cons ':class_name (class_name msg))
    (cl:cons ':score (score msg))
    (cl:cons ':center (center msg))
    (cl:cons ':size_x (size_x msg))
    (cl:cons ':size_y (size_y msg))
))
