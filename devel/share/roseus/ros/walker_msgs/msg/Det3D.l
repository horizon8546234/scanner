;; Auto-generated. Do not edit!


(when (boundp 'walker_msgs::Det3D)
  (if (not (find-package "WALKER_MSGS"))
    (make-package "WALKER_MSGS"))
  (shadow 'Det3D (find-package "WALKER_MSGS")))
(unless (find-package "WALKER_MSGS::DET3D")
  (make-package "WALKER_MSGS::DET3D"))

(in-package "ROS")
;;//! \htmlinclude Det3D.msg.html


(defclass walker_msgs::Det3D
  :super ros::object
  :slots (_x _y _z _yaw _radius _confidence _class_name _class_id _h _w _l ))

(defmethod walker_msgs::Det3D
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:yaw __yaw) 0.0)
    ((:radius __radius) 0.0)
    ((:confidence __confidence) 0.0)
    ((:class_name __class_name) "")
    ((:class_id __class_id) 0)
    ((:h __h) 0.0)
    ((:w __w) 0.0)
    ((:l __l) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _yaw (float __yaw))
   (setq _radius (float __radius))
   (setq _confidence (float __confidence))
   (setq _class_name (string __class_name))
   (setq _class_id (round __class_id))
   (setq _h (float __h))
   (setq _w (float __w))
   (setq _l (float __l))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:radius
   (&optional __radius)
   (if __radius (setq _radius __radius)) _radius)
  (:confidence
   (&optional __confidence)
   (if __confidence (setq _confidence __confidence)) _confidence)
  (:class_name
   (&optional __class_name)
   (if __class_name (setq _class_name __class_name)) _class_name)
  (:class_id
   (&optional __class_id)
   (if __class_id (setq _class_id __class_id)) _class_id)
  (:h
   (&optional __h)
   (if __h (setq _h __h)) _h)
  (:w
   (&optional __w)
   (if __w (setq _w __w)) _w)
  (:l
   (&optional __l)
   (if __l (setq _l __l)) _l)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _z
    4
    ;; float32 _yaw
    4
    ;; float32 _radius
    4
    ;; float32 _confidence
    4
    ;; string _class_name
    4 (length _class_name)
    ;; int8 _class_id
    1
    ;; float32 _h
    4
    ;; float32 _w
    4
    ;; float32 _l
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
     ;; float32 _z
       (sys::poke _z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _radius
       (sys::poke _radius (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _confidence
       (sys::poke _confidence (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _class_name
       (write-long (length _class_name) s) (princ _class_name s)
     ;; int8 _class_id
       (write-byte _class_id s)
     ;; float32 _h
       (sys::poke _h (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _w
       (sys::poke _w (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _l
       (sys::poke _l (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _z
     (setq _z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _radius
     (setq _radius (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _confidence
     (setq _confidence (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _class_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _class_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int8 _class_id
     (setq _class_id (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _class_id 127) (setq _class_id (- _class_id 256)))
   ;; float32 _h
     (setq _h (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _w
     (setq _w (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _l
     (setq _l (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get walker_msgs::Det3D :md5sum-) "7da55de3f441fc2374979407d5fddda3")
(setf (get walker_msgs::Det3D :datatype-) "walker_msgs/Det3D")
(setf (get walker_msgs::Det3D :definition-)
      "float32 x
float32 y
float32 z
float32 yaw
float32 radius
float32 confidence
string class_name
int8 class_id

float32 h
float32 w
float32 l

")



(provide :walker_msgs/Det3D "7da55de3f441fc2374979407d5fddda3")


