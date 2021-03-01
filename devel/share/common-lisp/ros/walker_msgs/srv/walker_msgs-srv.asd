
(cl:in-package :asdf)

(defsystem "walker_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
               :walker_msgs-msg
)
  :components ((:file "_package")
    (:file "Detection2DTrigger" :depends-on ("_package_Detection2DTrigger"))
    (:file "_package_Detection2DTrigger" :depends-on ("_package"))
  ))