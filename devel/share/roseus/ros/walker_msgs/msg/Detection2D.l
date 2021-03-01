;; Auto-generated. Do not edit!


(when (boundp 'walker_msgs::Detection2D)
  (if (not (find-package "WALKER_MSGS"))
    (make-package "WALKER_MSGS"))
  (shadow 'Detection2D (find-package "WALKER_MSGS")))
(unless (find-package "WALKER_MSGS::DETECTION2D")
  (make-package "WALKER_MSGS::DETECTION2D"))

(in-package "ROS")
;;//! \htmlinclude Detection2D.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass walker_msgs::Detection2D
  :super ros::object
  :slots (_header _boxes _result_image ))

(defmethod walker_msgs::Detection2D
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:boxes __boxes) (let (r) (dotimes (i 0) (push (instance walker_msgs::BBox2D :init) r)) r))
    ((:result_image __result_image) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _boxes __boxes)
   (setq _result_image __result_image)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:boxes
   (&rest __boxes)
   (if (keywordp (car __boxes))
       (send* _boxes __boxes)
     (progn
       (if __boxes (setq _boxes (car __boxes)))
       _boxes)))
  (:result_image
   (&rest __result_image)
   (if (keywordp (car __result_image))
       (send* _result_image __result_image)
     (progn
       (if __result_image (setq _result_image (car __result_image)))
       _result_image)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; walker_msgs/BBox2D[] _boxes
    (apply #'+ (send-all _boxes :serialization-length)) 4
    ;; sensor_msgs/Image _result_image
    (send _result_image :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; walker_msgs/BBox2D[] _boxes
     (write-long (length _boxes) s)
     (dolist (elem _boxes)
       (send elem :serialize s)
       )
     ;; sensor_msgs/Image _result_image
       (send _result_image :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; walker_msgs/BBox2D[] _boxes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _boxes (let (r) (dotimes (i n) (push (instance walker_msgs::BBox2D :init) r)) r))
     (dolist (elem- _boxes)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; sensor_msgs/Image _result_image
     (send _result_image :deserialize buf ptr-) (incf ptr- (send _result_image :serialization-length))
   ;;
   self)
  )

(setf (get walker_msgs::Detection2D :md5sum-) "dd8b9135a56521d4afeeec8a6c509df0")
(setf (get walker_msgs::Detection2D :datatype-) "walker_msgs/Detection2D")
(setf (get walker_msgs::Detection2D :definition-)
      "std_msgs/Header header

walker_msgs/BBox2D[] boxes

sensor_msgs/Image result_image

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: walker_msgs/BBox2D
int32 id
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

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

")



(provide :walker_msgs/Detection2D "dd8b9135a56521d4afeeec8a6c509df0")


