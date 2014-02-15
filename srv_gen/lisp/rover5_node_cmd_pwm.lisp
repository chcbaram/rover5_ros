; Auto-generated. Do not edit!


(cl:in-package rover5_ros-srv)


;//! \htmlinclude rover5_node_cmd_pwm-request.msg.html

(cl:defclass <rover5_node_cmd_pwm-request> (roslisp-msg-protocol:ros-message)
  ((pwm_left
    :reader pwm_left
    :initarg :pwm_left
    :type cl:integer
    :initform 0)
   (pwm_right
    :reader pwm_right
    :initarg :pwm_right
    :type cl:integer
    :initform 0))
)

(cl:defclass rover5_node_cmd_pwm-request (<rover5_node_cmd_pwm-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rover5_node_cmd_pwm-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rover5_node_cmd_pwm-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rover5_ros-srv:<rover5_node_cmd_pwm-request> is deprecated: use rover5_ros-srv:rover5_node_cmd_pwm-request instead.")))

(cl:ensure-generic-function 'pwm_left-val :lambda-list '(m))
(cl:defmethod pwm_left-val ((m <rover5_node_cmd_pwm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rover5_ros-srv:pwm_left-val is deprecated.  Use rover5_ros-srv:pwm_left instead.")
  (pwm_left m))

(cl:ensure-generic-function 'pwm_right-val :lambda-list '(m))
(cl:defmethod pwm_right-val ((m <rover5_node_cmd_pwm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rover5_ros-srv:pwm_right-val is deprecated.  Use rover5_ros-srv:pwm_right instead.")
  (pwm_right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rover5_node_cmd_pwm-request>) ostream)
  "Serializes a message object of type '<rover5_node_cmd_pwm-request>"
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rover5_node_cmd_pwm-request>) istream)
  "Deserializes a message object of type '<rover5_node_cmd_pwm-request>"
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rover5_node_cmd_pwm-request>)))
  "Returns string type for a service object of type '<rover5_node_cmd_pwm-request>"
  "rover5_ros/rover5_node_cmd_pwmRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rover5_node_cmd_pwm-request)))
  "Returns string type for a service object of type 'rover5_node_cmd_pwm-request"
  "rover5_ros/rover5_node_cmd_pwmRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rover5_node_cmd_pwm-request>)))
  "Returns md5sum for a message object of type '<rover5_node_cmd_pwm-request>"
  "c5ab5daf069941f8e4c889717b1678ff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rover5_node_cmd_pwm-request)))
  "Returns md5sum for a message object of type 'rover5_node_cmd_pwm-request"
  "c5ab5daf069941f8e4c889717b1678ff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rover5_node_cmd_pwm-request>)))
  "Returns full string definition for message of type '<rover5_node_cmd_pwm-request>"
  (cl:format cl:nil "int32 pwm_left~%int32 pwm_right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rover5_node_cmd_pwm-request)))
  "Returns full string definition for message of type 'rover5_node_cmd_pwm-request"
  (cl:format cl:nil "int32 pwm_left~%int32 pwm_right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rover5_node_cmd_pwm-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rover5_node_cmd_pwm-request>))
  "Converts a ROS message object to a list"
  (cl:list 'rover5_node_cmd_pwm-request
    (cl:cons ':pwm_left (pwm_left msg))
    (cl:cons ':pwm_right (pwm_right msg))
))
;//! \htmlinclude rover5_node_cmd_pwm-response.msg.html

(cl:defclass <rover5_node_cmd_pwm-response> (roslisp-msg-protocol:ros-message)
  ((ret
    :reader ret
    :initarg :ret
    :type cl:integer
    :initform 0))
)

(cl:defclass rover5_node_cmd_pwm-response (<rover5_node_cmd_pwm-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rover5_node_cmd_pwm-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rover5_node_cmd_pwm-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rover5_ros-srv:<rover5_node_cmd_pwm-response> is deprecated: use rover5_ros-srv:rover5_node_cmd_pwm-response instead.")))

(cl:ensure-generic-function 'ret-val :lambda-list '(m))
(cl:defmethod ret-val ((m <rover5_node_cmd_pwm-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rover5_ros-srv:ret-val is deprecated.  Use rover5_ros-srv:ret instead.")
  (ret m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rover5_node_cmd_pwm-response>) ostream)
  "Serializes a message object of type '<rover5_node_cmd_pwm-response>"
  (cl:let* ((signed (cl:slot-value msg 'ret)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rover5_node_cmd_pwm-response>) istream)
  "Deserializes a message object of type '<rover5_node_cmd_pwm-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ret) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rover5_node_cmd_pwm-response>)))
  "Returns string type for a service object of type '<rover5_node_cmd_pwm-response>"
  "rover5_ros/rover5_node_cmd_pwmResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rover5_node_cmd_pwm-response)))
  "Returns string type for a service object of type 'rover5_node_cmd_pwm-response"
  "rover5_ros/rover5_node_cmd_pwmResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rover5_node_cmd_pwm-response>)))
  "Returns md5sum for a message object of type '<rover5_node_cmd_pwm-response>"
  "c5ab5daf069941f8e4c889717b1678ff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rover5_node_cmd_pwm-response)))
  "Returns md5sum for a message object of type 'rover5_node_cmd_pwm-response"
  "c5ab5daf069941f8e4c889717b1678ff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rover5_node_cmd_pwm-response>)))
  "Returns full string definition for message of type '<rover5_node_cmd_pwm-response>"
  (cl:format cl:nil "int32 ret~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rover5_node_cmd_pwm-response)))
  "Returns full string definition for message of type 'rover5_node_cmd_pwm-response"
  (cl:format cl:nil "int32 ret~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rover5_node_cmd_pwm-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rover5_node_cmd_pwm-response>))
  "Converts a ROS message object to a list"
  (cl:list 'rover5_node_cmd_pwm-response
    (cl:cons ':ret (ret msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'rover5_node_cmd_pwm)))
  'rover5_node_cmd_pwm-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'rover5_node_cmd_pwm)))
  'rover5_node_cmd_pwm-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rover5_node_cmd_pwm)))
  "Returns string type for a service object of type '<rover5_node_cmd_pwm>"
  "rover5_ros/rover5_node_cmd_pwm")