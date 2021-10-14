;; Auto-generated. Do not edit!


(when (boundp 'basic_motors_and_sensors::WheelCommands)
  (if (not (find-package "BASIC_MOTORS_AND_SENSORS"))
    (make-package "BASIC_MOTORS_AND_SENSORS"))
  (shadow 'WheelCommands (find-package "BASIC_MOTORS_AND_SENSORS")))
(unless (find-package "BASIC_MOTORS_AND_SENSORS::WHEELCOMMANDS")
  (make-package "BASIC_MOTORS_AND_SENSORS::WHEELCOMMANDS"))

(in-package "ROS")
;;//! \htmlinclude WheelCommands.msg.html


(defclass basic_motors_and_sensors::WheelCommands
  :super ros::object
  :slots (_commandL _commandR ))

(defmethod basic_motors_and_sensors::WheelCommands
  (:init
   (&key
    ((:commandL __commandL) 0.0)
    ((:commandR __commandR) 0.0)
    )
   (send-super :init)
   (setq _commandL (float __commandL))
   (setq _commandR (float __commandR))
   self)
  (:commandL
   (&optional __commandL)
   (if __commandL (setq _commandL __commandL)) _commandL)
  (:commandR
   (&optional __commandR)
   (if __commandR (setq _commandR __commandR)) _commandR)
  (:serialization-length
   ()
   (+
    ;; float32 _commandL
    4
    ;; float32 _commandR
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _commandL
       (sys::poke _commandL (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _commandR
       (sys::poke _commandR (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _commandL
     (setq _commandL (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _commandR
     (setq _commandR (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get basic_motors_and_sensors::WheelCommands :md5sum-) "178021d2695cd48d61727e5fa7defa6f")
(setf (get basic_motors_and_sensors::WheelCommands :datatype-) "basic_motors_and_sensors/WheelCommands")
(setf (get basic_motors_and_sensors::WheelCommands :definition-)
      "float32 commandL
float32 commandR

")



(provide :basic_motors_and_sensors/WheelCommands "178021d2695cd48d61727e5fa7defa6f")


