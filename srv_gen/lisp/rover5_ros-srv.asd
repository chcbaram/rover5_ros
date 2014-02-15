
(cl:in-package :asdf)

(defsystem "rover5_ros-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "rover5_node_cmd_pwm" :depends-on ("_package_rover5_node_cmd_pwm"))
    (:file "_package_rover5_node_cmd_pwm" :depends-on ("_package"))
  ))