;; Auto-generated. Do not edit!


(when (boundp 'walker_msgs::Trk3D)
  (if (not (find-package "WALKER_MSGS"))
    (make-package "WALKER_MSGS"))
  (shadow 'Trk3D (find-package "WALKER_MSGS")))
(unless (find-package "WALKER_MSGS::TRK3D")
  (make-package "WALKER_MSGS::TRK3D"))

(in-package "ROS")
;;//! \htmlinclude Trk3D.msg.html


(defclass walker_msgs::Trk3D
  :super ros::object
  :slots (_x _y _vx _vy _yaw _radius _confidence _class_id _dangerous ))

(defmethod walker_msgs::Trk3D
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:vx __vx) 0.0)
    ((:vy __vy) 0.0)
    ((:yaw __yaw) 0.0)
    ((:radius __radius) 0.0)
    ((:confidence __confidence) 0.0)
    ((:class_id __class_id) 0)
    ((:dangerous __dangerous) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _vx (float __vx))
   (setq _vy (float __vy))
   (setq _yaw (float __yaw))
   (setq _radius (float __radius))
   (setq _confidence (float __confidence))
   (setq _class_id (round __class_id))
   (setq _dangerous (float __dangerous))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:vx
   (&optional __vx)
   (if __vx (setq _vx __vx)) _vx)
  (:vy
   (&optional __vy)
   (if __vy (setq _vy __vy)) _vy)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:radius
   (&optional __radius)
   (if __radius (setq _radius __radius)) _radius)
  (:confidence
   (&optional __confidence)
   (if __confidence (setq _confidence __confidence)) _confidence)
  (:class_id
   (&optional __class_id)
   (if __class_id (setq _class_id __class_id)) _class_id)
  (:dangerous
   (&optional __dangerous)
   (if __dangerous (setq _dangerous __dangerous)) _dangerous)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _vx
    4
    ;; float32 _vy
    4
    ;; float32 _yaw
    4
    ;; float32 _radius
    4
    ;; float32 _confidence
    4
    ;; int8 _class_id
    1
    ;; float32 _dangerous
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vx
       (sys::poke _vx (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vy
       (sys::poke _vy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _radius
       (sys::poke _radius (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _confidence
       (sys::poke _confidence (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int8 _class_id
       (write-byte _class_id s)
     ;; float32 _dangerous
       (sys::poke _dangerous (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vx
     (setq _vx (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vy
     (setq _vy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _radius
     (setq _radius (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _confidence
     (setq _confidence (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int8 _class_id
     (setq _class_id (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _class_id 127) (setq _class_id (- _class_id 256)))
   ;; float32 _dangerous
     (setq _dangerous (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get walker_msgs::Trk3D :md5sum-) "b05fd2d278b92e0899f9fa32977773c2")
(setf (get walker_msgs::Trk3D :datatype-) "walker_msgs/Trk3D")
(setf (get walker_msgs::Trk3D :definition-)
      "float32 x
float32 y
float32 vx
float32 vy
float32 yaw
float32 radius
float32 confidence
int8 class_id
float32 dangerous

")



(provide :walker_msgs/Trk3D "b05fd2d278b92e0899f9fa32977773c2")


