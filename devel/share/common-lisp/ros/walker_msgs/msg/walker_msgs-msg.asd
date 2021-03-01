
(cl:in-package :asdf)

(defsystem "walker_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "BBox2D" :depends-on ("_package_BBox2D"))
    (:file "_package_BBox2D" :depends-on ("_package"))
    (:file "BBox2D" :depends-on ("_package_BBox2D"))
    (:file "_package_BBox2D" :depends-on ("_package"))
    (:file "Det3D" :depends-on ("_package_Det3D"))
    (:file "_package_Det3D" :depends-on ("_package"))
    (:file "Det3D" :depends-on ("_package_Det3D"))
    (:file "_package_Det3D" :depends-on ("_package"))
    (:file "Det3DArray" :depends-on ("_package_Det3DArray"))
    (:file "_package_Det3DArray" :depends-on ("_package"))
    (:file "Det3DArray" :depends-on ("_package_Det3DArray"))
    (:file "_package_Det3DArray" :depends-on ("_package"))
    (:file "Detection2D" :depends-on ("_package_Detection2D"))
    (:file "_package_Detection2D" :depends-on ("_package"))
    (:file "Detection2D" :depends-on ("_package_Detection2D"))
    (:file "_package_Detection2D" :depends-on ("_package"))
    (:file "Trk3D" :depends-on ("_package_Trk3D"))
    (:file "_package_Trk3D" :depends-on ("_package"))
    (:file "Trk3D" :depends-on ("_package_Trk3D"))
    (:file "_package_Trk3D" :depends-on ("_package"))
    (:file "Trk3DArray" :depends-on ("_package_Trk3DArray"))
    (:file "_package_Trk3DArray" :depends-on ("_package"))
    (:file "Trk3DArray" :depends-on ("_package_Trk3DArray"))
    (:file "_package_Trk3DArray" :depends-on ("_package"))
  ))