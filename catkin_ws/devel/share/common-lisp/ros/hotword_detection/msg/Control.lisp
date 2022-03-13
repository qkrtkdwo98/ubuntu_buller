; Auto-generated. Do not edit!


(cl:in-package hotword_detection-msg)


;//! \htmlinclude Control.msg.html

(cl:defclass <Control> (roslisp-msg-protocol:ros-message)
  ((detect_word
    :reader detect_word
    :initarg :detect_word
    :type cl:fixnum
    :initform 0)
   (send_goal
    :reader send_goal
    :initarg :send_goal
    :type cl:fixnum
    :initform 0)
   (detect_object
    :reader detect_object
    :initarg :detect_object
    :type cl:fixnum
    :initform 0)
   (object_position
    :reader object_position
    :initarg :object_position
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (start_arm
    :reader start_arm
    :initarg :start_arm
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (finish_arm
    :reader finish_arm
    :initarg :finish_arm
    :type cl:boolean
    :initform cl:nil)
   (go_back
    :reader go_back
    :initarg :go_back
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Control (<Control>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Control>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Control)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hotword_detection-msg:<Control> is deprecated: use hotword_detection-msg:Control instead.")))

(cl:ensure-generic-function 'detect_word-val :lambda-list '(m))
(cl:defmethod detect_word-val ((m <Control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hotword_detection-msg:detect_word-val is deprecated.  Use hotword_detection-msg:detect_word instead.")
  (detect_word m))

(cl:ensure-generic-function 'send_goal-val :lambda-list '(m))
(cl:defmethod send_goal-val ((m <Control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hotword_detection-msg:send_goal-val is deprecated.  Use hotword_detection-msg:send_goal instead.")
  (send_goal m))

(cl:ensure-generic-function 'detect_object-val :lambda-list '(m))
(cl:defmethod detect_object-val ((m <Control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hotword_detection-msg:detect_object-val is deprecated.  Use hotword_detection-msg:detect_object instead.")
  (detect_object m))

(cl:ensure-generic-function 'object_position-val :lambda-list '(m))
(cl:defmethod object_position-val ((m <Control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hotword_detection-msg:object_position-val is deprecated.  Use hotword_detection-msg:object_position instead.")
  (object_position m))

(cl:ensure-generic-function 'start_arm-val :lambda-list '(m))
(cl:defmethod start_arm-val ((m <Control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hotword_detection-msg:start_arm-val is deprecated.  Use hotword_detection-msg:start_arm instead.")
  (start_arm m))

(cl:ensure-generic-function 'finish_arm-val :lambda-list '(m))
(cl:defmethod finish_arm-val ((m <Control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hotword_detection-msg:finish_arm-val is deprecated.  Use hotword_detection-msg:finish_arm instead.")
  (finish_arm m))

(cl:ensure-generic-function 'go_back-val :lambda-list '(m))
(cl:defmethod go_back-val ((m <Control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hotword_detection-msg:go_back-val is deprecated.  Use hotword_detection-msg:go_back instead.")
  (go_back m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Control>) ostream)
  "Serializes a message object of type '<Control>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'detect_word)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'detect_word)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'send_goal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'send_goal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'detect_object)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'detect_object)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'object_position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'object_position))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'start_arm))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'start_arm))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'finish_arm) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'go_back) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Control>) istream)
  "Deserializes a message object of type '<Control>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'detect_word)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'detect_word)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'send_goal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'send_goal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'detect_object)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'detect_object)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'object_position) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'object_position)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'start_arm) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'start_arm)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
    (cl:setf (cl:slot-value msg 'finish_arm) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'go_back) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Control>)))
  "Returns string type for a message object of type '<Control>"
  "hotword_detection/Control")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Control)))
  "Returns string type for a message object of type 'Control"
  "hotword_detection/Control")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Control>)))
  "Returns md5sum for a message object of type '<Control>"
  "491a05910e95215173090f79f7126129")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Control)))
  "Returns md5sum for a message object of type 'Control"
  "491a05910e95215173090f79f7126129")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Control>)))
  "Returns full string definition for message of type '<Control>"
  (cl:format cl:nil "uint16 detect_word~%uint16 send_goal~%uint16 detect_object~%float32[] object_position~%float32[] start_arm~%bool finish_arm~%bool go_back~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Control)))
  "Returns full string definition for message of type 'Control"
  (cl:format cl:nil "uint16 detect_word~%uint16 send_goal~%uint16 detect_object~%float32[] object_position~%float32[] start_arm~%bool finish_arm~%bool go_back~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Control>))
  (cl:+ 0
     2
     2
     2
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'object_position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'start_arm) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Control>))
  "Converts a ROS message object to a list"
  (cl:list 'Control
    (cl:cons ':detect_word (detect_word msg))
    (cl:cons ':send_goal (send_goal msg))
    (cl:cons ':detect_object (detect_object msg))
    (cl:cons ':object_position (object_position msg))
    (cl:cons ':start_arm (start_arm msg))
    (cl:cons ':finish_arm (finish_arm msg))
    (cl:cons ':go_back (go_back msg))
))
