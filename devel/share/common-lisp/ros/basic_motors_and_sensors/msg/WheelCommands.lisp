; Auto-generated. Do not edit!


(cl:in-package basic_motors_and_sensors-msg)


;//! \htmlinclude WheelCommands.msg.html

(cl:defclass <WheelCommands> (roslisp-msg-protocol:ros-message)
  ((commandL
    :reader commandL
    :initarg :commandL
    :type cl:float
    :initform 0.0)
   (commandR
    :reader commandR
    :initarg :commandR
    :type cl:float
    :initform 0.0))
)

(cl:defclass WheelCommands (<WheelCommands>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WheelCommands>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WheelCommands)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name basic_motors_and_sensors-msg:<WheelCommands> is deprecated: use basic_motors_and_sensors-msg:WheelCommands instead.")))

(cl:ensure-generic-function 'commandL-val :lambda-list '(m))
(cl:defmethod commandL-val ((m <WheelCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader basic_motors_and_sensors-msg:commandL-val is deprecated.  Use basic_motors_and_sensors-msg:commandL instead.")
  (commandL m))

(cl:ensure-generic-function 'commandR-val :lambda-list '(m))
(cl:defmethod commandR-val ((m <WheelCommands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader basic_motors_and_sensors-msg:commandR-val is deprecated.  Use basic_motors_and_sensors-msg:commandR instead.")
  (commandR m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WheelCommands>) ostream)
  "Serializes a message object of type '<WheelCommands>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'commandL))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'commandR))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WheelCommands>) istream)
  "Deserializes a message object of type '<WheelCommands>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'commandL) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'commandR) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WheelCommands>)))
  "Returns string type for a message object of type '<WheelCommands>"
  "basic_motors_and_sensors/WheelCommands")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WheelCommands)))
  "Returns string type for a message object of type 'WheelCommands"
  "basic_motors_and_sensors/WheelCommands")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WheelCommands>)))
  "Returns md5sum for a message object of type '<WheelCommands>"
  "178021d2695cd48d61727e5fa7defa6f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WheelCommands)))
  "Returns md5sum for a message object of type 'WheelCommands"
  "178021d2695cd48d61727e5fa7defa6f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WheelCommands>)))
  "Returns full string definition for message of type '<WheelCommands>"
  (cl:format cl:nil "float32 commandL~%float32 commandR~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WheelCommands)))
  "Returns full string definition for message of type 'WheelCommands"
  (cl:format cl:nil "float32 commandL~%float32 commandR~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WheelCommands>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WheelCommands>))
  "Converts a ROS message object to a list"
  (cl:list 'WheelCommands
    (cl:cons ':commandL (commandL msg))
    (cl:cons ':commandR (commandR msg))
))
