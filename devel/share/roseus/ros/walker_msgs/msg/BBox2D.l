;; Auto-generated. Do not edit!


(when (boundp 'walker_msgs::BBox2D)
  (if (not (find-package "WALKER_MSGS"))
    (make-package "WALKER_MSGS"))
  (shadow 'BBox2D (find-package "WALKER_MSGS")))
(unless (find-package "WALKER_MSGS::BBOX2D")
  (make-package "WALKER_MSGS::BBOX2D"))

(in-package "ROS")
;;//! \htmlinclude BBox2D.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass walker_msgs::BBox2D
  :super ros::object
  :slots (_id _class_name _score _center _size_x _size_y ))

(defmethod walker_msgs::BBox2D
  (:init
   (&key
    ((:id __id) 0)
    ((:class_name __class_name) "")
    ((:score __score) 0.0)
    ((:center __center) (instance geometry_msgs::Pose2D :init))
    ((:size_x __size_x) 0.0)
    ((:size_y __size_y) 0.0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _class_name (string __class_name))
   (setq _score (float __score))
   (setq _center __center)
   (setq _size_x (float __size_x))
   (setq _size_y (float __size_y))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:class_name
   (&optional __class_name)
   (if __class_name (setq _class_name __class_name)) _class_name)
  (:score
   (&optional __score)
   (if __score (setq _score __score)) _score)
  (:center
   (&rest __center)
   (if (keywordp (car __center))
       (send* _center __center)
     (progn
       (if __center (setq _center (car __center)))
       _center)))
  (:size_x
   (&optional __size_x)
   (if __size_x (setq _size_x __size_x)) _size_x)
  (:size_y
   (&optional __size_y)
   (if __size_y (setq _size_y __size_y)) _size_y)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; string _class_name
    4 (length _class_name)
    ;; float32 _score
    4
    ;; geometry_msgs/Pose2D _center
    (send _center :serialization-length)
    ;; float32 _size_x
    4
    ;; float32 _size_y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; string _class_name
       (write-long (length _class_name) s) (princ _class_name s)
     ;; float32 _score
       (sys::poke _score (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; geometry_msgs/Pose2D _center
       (send _center :serialize s)
     ;; float32 _size_x
       (sys::poke _size_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _size_y
       (sys::poke _size_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _class_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _class_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _score
     (setq _score (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; geometry_msgs/Pose2D _center
     (send _center :deserialize buf ptr-) (incf ptr- (send _center :serialization-length))
   ;; float32 _size_x
     (setq _size_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _size_y
     (setq _size_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get walker_msgs::BBox2D :md5sum-) "0c77df3d2730bffc00b93fb5799a0241")
(setf (get walker_msgs::BBox2D :datatype-) "walker_msgs/BBox2D")
(setf (get walker_msgs::BBox2D :definition-)
      "int32 id
string class_name
float32 score

geometry_msgs/Pose2D center
float32 size_x
float32 size_y
================================================================================
MSG: geometry_msgs/Pose2D
# Deprecated
# Please use the full 3D pose.

# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.

# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.


# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta

")



(provide :walker_msgs/BBox2D "0c77df3d2730bffc00b93fb5799a0241")


