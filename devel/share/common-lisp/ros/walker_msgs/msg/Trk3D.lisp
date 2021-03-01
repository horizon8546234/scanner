; Auto-generated. Do not edit!


(cl:in-package walker_msgs-msg)


;//! \htmlinclude Trk3D.msg.html

(cl:defclass <Trk3D> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (vx
    :reader vx
    :initarg :vx
    :type cl:float
    :initform 0.0)
   (vy
    :reader vy
    :initarg :vy
    :type cl:float
    :initform 0.0)
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0)
   (radius
    :reader radius
    :initarg :radius
    :type cl:float
    :initform 0.0)
   (confidence
    :reader confidence
    :initarg :confidence
    :type cl:float
    :initform 0.0)
   (class_id
    :reader class_id
    :initarg :class_id
    :type cl:fixnum
    :initform 0)
   (dangerous
    :reader dangerous
    :initarg :dangerous
    :type cl:float
    :initform 0.0))
)

(cl:defclass Trk3D (<Trk3D>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Trk3D>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Trk3D)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name walker_msgs-msg:<Trk3D> is deprecated: use walker_msgs-msg:Trk3D instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <Trk3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-msg:x-val is deprecated.  Use walker_msgs-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <Trk3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-msg:y-val is deprecated.  Use walker_msgs-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'vx-val :lambda-list '(m))
(cl:defmethod vx-val ((m <Trk3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-msg:vx-val is deprecated.  Use walker_msgs-msg:vx instead.")
  (vx m))

(cl:ensure-generic-function 'vy-val :lambda-list '(m))
(cl:defmethod vy-val ((m <Trk3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-msg:vy-val is deprecated.  Use walker_msgs-msg:vy instead.")
  (vy m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <Trk3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-msg:yaw-val is deprecated.  Use walker_msgs-msg:yaw instead.")
  (yaw m))

(cl:ensure-generic-function 'radius-val :lambda-list '(m))
(cl:defmethod radius-val ((m <Trk3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-msg:radius-val is deprecated.  Use walker_msgs-msg:radius instead.")
  (radius m))

(cl:ensure-generic-function 'confidence-val :lambda-list '(m))
(cl:defmethod confidence-val ((m <Trk3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-msg:confidence-val is deprecated.  Use walker_msgs-msg:confidence instead.")
  (confidence m))

(cl:ensure-generic-function 'class_id-val :lambda-list '(m))
(cl:defmethod class_id-val ((m <Trk3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-msg:class_id-val is deprecated.  Use walker_msgs-msg:class_id instead.")
  (class_id m))

(cl:ensure-generic-function 'dangerous-val :lambda-list '(m))
(cl:defmethod dangerous-val ((m <Trk3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader walker_msgs-msg:dangerous-val is deprecated.  Use walker_msgs-msg:dangerous instead.")
  (dangerous m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Trk3D>) ostream)
  "Serializes a message object of type '<Trk3D>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vx))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'radius))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'confidence))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'class_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'dangerous))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Trk3D>) istream)
  "Deserializes a message object of type '<Trk3D>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vx) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vy) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'radius) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'confidence) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'class_id) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dangerous) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Trk3D>)))
  "Returns string type for a message object of type '<Trk3D>"
  "walker_msgs/Trk3D")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Trk3D)))
  "Returns string type for a message object of type 'Trk3D"
  "walker_msgs/Trk3D")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Trk3D>)))
  "Returns md5sum for a message object of type '<Trk3D>"
  "b05fd2d278b92e0899f9fa32977773c2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Trk3D)))
  "Returns md5sum for a message object of type 'Trk3D"
  "b05fd2d278b92e0899f9fa32977773c2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Trk3D>)))
  "Returns full string definition for message of type '<Trk3D>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 vx~%float32 vy~%float32 yaw~%float32 radius~%float32 confidence~%int8 class_id~%float32 dangerous~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Trk3D)))
  "Returns full string definition for message of type 'Trk3D"
  (cl:format cl:nil "float32 x~%float32 y~%float32 vx~%float32 vy~%float32 yaw~%float32 radius~%float32 confidence~%int8 class_id~%float32 dangerous~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Trk3D>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Trk3D>))
  "Converts a ROS message object to a list"
  (cl:list 'Trk3D
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':vx (vx msg))
    (cl:cons ':vy (vy msg))
    (cl:cons ':yaw (yaw msg))
    (cl:cons ':radius (radius msg))
    (cl:cons ':confidence (confidence msg))
    (cl:cons ':class_id (class_id msg))
    (cl:cons ':dangerous (dangerous msg))
))
