
(cl:in-package :asdf)

(defsystem "rover5_ros-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "rover5_node_msg" :depends-on ("_package_rover5_node_msg"))
    (:file "_package_rover5_node_msg" :depends-on ("_package"))
  ))