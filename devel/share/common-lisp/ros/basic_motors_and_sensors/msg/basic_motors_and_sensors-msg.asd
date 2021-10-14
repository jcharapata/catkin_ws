
(cl:in-package :asdf)

(defsystem "basic_motors_and_sensors-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "WheelCommands" :depends-on ("_package_WheelCommands"))
    (:file "_package_WheelCommands" :depends-on ("_package"))
  ))