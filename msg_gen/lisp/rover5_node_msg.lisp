; Auto-generated. Do not edit!


(cl:in-package rover5_ros-msg)


;//! \htmlinclude rover5_node_msg.msg.html

(cl:defclass <rover5_node_msg> (roslisp-msg-protocol:ros-message)
  ((pwm_left
    :reader pwm_left
    :initarg :pwm_left
    :type cl:integer
    :initform 0)
   (pwm_right
    :reader pwm_right
    :initarg :pwm_right
    :type cl:integer
    :initform 0)
   (sonic_distance_left
    :reader sonic_distance_left
    :initarg :sonic_distance_left
    :type cl:integer
    :initform 0)
   (sonic_distance_right
    :reader sonic_distance_right
    :initarg :sonic_distance_right
    :type cl:integer
    :initform 0))
)

(cl:defclass rover5_node_msg (<rover5_node_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rover5_node_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rover5_node_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rover5_ros-msg:<rover5_node_msg> is deprecated: use rover5_ros-msg:rover5_node_msg instead.")))

(cl:ensure-generic-function 'pwm_left-val :lambda-list '(m))
(cl:defmethod pwm_left-val ((m <rover5_node_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rover5_ros-msg:pwm_left-val is deprecated.  Use rover5_ros-msg:pwm_left instead.")
  (pwm_left m))

(cl:ensure-generic-function 'pwm_right-val :lambda-list '(m))
(cl:defmethod pwm_right-val ((m <rover5_node_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rover5_ros-msg:pwm_right-val is deprecated.  Use rover5_ros-msg:pwm_right instead.")
  (pwm_right m))

(cl:ensure-generic-function 'sonic_distance_left-val :lambda-list '(m))
(cl:defmethod sonic_distance_left-val ((m <rover5_node_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rover5_ros-msg:sonic_distance_left-val is deprecated.  Use rover5_ros-msg:sonic_distance_left instead.")
  (sonic_distance_left m))

(cl:ensure-generic-function 'sonic_distance_right-val :lambda-list '(m))
(cl:defmethod sonic_distance_right-val ((m <rover5_node_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rover5_ros-msg:sonic_distance_right-val is deprecated.  Use rover5_ros-msg:sonic_distance_right instead.")
  (sonic_distance_right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rover5_node_msg>) ostream)
  "Serializes a message object of type '<rover5_node_msg>"
  (cl:let* ((signed (cl:slot-value msg 'pwm_left)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'pwm_right)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'sonic_distance_left)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'sonic_distance_right)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rover5_node_msg>) istream)
  "Deserializes a message object of type '<rover5_node_msg>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pwm_left) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pwm_right) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sonic_distance_left) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sonic_distance_right) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rover5_node_msg>)))
  "Returns string type for a message object of type '<rover5_node_msg>"
  "rover5_ros/rover5_node_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rover5_node_msg)))
  "Returns string type for a message object of type 'rover5_node_msg"
  "rover5_ros/rover5_node_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rover5_node_msg>)))
  "Returns md5sum for a message object of type '<rover5_node_msg>"
  "ad83e5b852ff7eb503e240cbde5519e0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rover5_node_msg)))
  "Returns md5sum for a message object of type 'rover5_node_msg"
  "ad83e5b852ff7eb503e240cbde5519e0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rover5_node_msg>)))
  "Returns full string definition for message of type '<rover5_node_msg>"
  (cl:format cl:nil "int32 pwm_left~%int32 pwm_right~%int32 sonic_distance_left~%int32 sonic_distance_right~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rover5_node_msg)))
  "Returns full string definition for message of type 'rover5_node_msg"
  (cl:format cl:nil "int32 pwm_left~%int32 pwm_right~%int32 sonic_distance_left~%int32 sonic_distance_right~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rover5_node_msg>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rover5_node_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'rover5_node_msg
    (cl:cons ':pwm_left (pwm_left msg))
    (cl:cons ':pwm_right (pwm_right msg))
    (cl:cons ':sonic_distance_left (sonic_distance_left msg))
    (cl:cons ':sonic_distance_right (sonic_distance_right msg))
))
