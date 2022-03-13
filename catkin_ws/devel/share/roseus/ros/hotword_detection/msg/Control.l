;; Auto-generated. Do not edit!


(when (boundp 'hotword_detection::Control)
  (if (not (find-package "HOTWORD_DETECTION"))
    (make-package "HOTWORD_DETECTION"))
  (shadow 'Control (find-package "HOTWORD_DETECTION")))
(unless (find-package "HOTWORD_DETECTION::CONTROL")
  (make-package "HOTWORD_DETECTION::CONTROL"))

(in-package "ROS")
;;//! \htmlinclude Control.msg.html


(defclass hotword_detection::Control
  :super ros::object
  :slots (_detect_word _send_goal _detect_object _object_position _start_arm _finish_arm _go_back ))

(defmethod hotword_detection::Control
  (:init
   (&key
    ((:detect_word __detect_word) 0)
    ((:send_goal __send_goal) 0)
    ((:detect_object __detect_object) 0)
    ((:object_position __object_position) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:start_arm __start_arm) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:finish_arm __finish_arm) nil)
    ((:go_back __go_back) nil)
    )
   (send-super :init)
   (setq _detect_word (round __detect_word))
   (setq _send_goal (round __send_goal))
   (setq _detect_object (round __detect_object))
   (setq _object_position __object_position)
   (setq _start_arm __start_arm)
   (setq _finish_arm __finish_arm)
   (setq _go_back __go_back)
   self)
  (:detect_word
   (&optional __detect_word)
   (if __detect_word (setq _detect_word __detect_word)) _detect_word)
  (:send_goal
   (&optional __send_goal)
   (if __send_goal (setq _send_goal __send_goal)) _send_goal)
  (:detect_object
   (&optional __detect_object)
   (if __detect_object (setq _detect_object __detect_object)) _detect_object)
  (:object_position
   (&optional __object_position)
   (if __object_position (setq _object_position __object_position)) _object_position)
  (:start_arm
   (&optional __start_arm)
   (if __start_arm (setq _start_arm __start_arm)) _start_arm)
  (:finish_arm
   (&optional __finish_arm)
   (if __finish_arm (setq _finish_arm __finish_arm)) _finish_arm)
  (:go_back
   (&optional __go_back)
   (if __go_back (setq _go_back __go_back)) _go_back)
  (:serialization-length
   ()
   (+
    ;; uint16 _detect_word
    2
    ;; uint16 _send_goal
    2
    ;; uint16 _detect_object
    2
    ;; float32[] _object_position
    (* 4    (length _object_position)) 4
    ;; float32[] _start_arm
    (* 4    (length _start_arm)) 4
    ;; bool _finish_arm
    1
    ;; bool _go_back
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _detect_word
       (write-word _detect_word s)
     ;; uint16 _send_goal
       (write-word _send_goal s)
     ;; uint16 _detect_object
       (write-word _detect_object s)
     ;; float32[] _object_position
     (write-long (length _object_position) s)
     (dotimes (i (length _object_position))
       (sys::poke (elt _object_position i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _start_arm
     (write-long (length _start_arm) s)
     (dotimes (i (length _start_arm))
       (sys::poke (elt _start_arm i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; bool _finish_arm
       (if _finish_arm (write-byte -1 s) (write-byte 0 s))
     ;; bool _go_back
       (if _go_back (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _detect_word
     (setq _detect_word (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _send_goal
     (setq _send_goal (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _detect_object
     (setq _detect_object (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32[] _object_position
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _object_position (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _object_position i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _start_arm
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _start_arm (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _start_arm i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; bool _finish_arm
     (setq _finish_arm (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _go_back
     (setq _go_back (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get hotword_detection::Control :md5sum-) "491a05910e95215173090f79f7126129")
(setf (get hotword_detection::Control :datatype-) "hotword_detection/Control")
(setf (get hotword_detection::Control :definition-)
      "uint16 detect_word
uint16 send_goal
uint16 detect_object
float32[] object_position
float32[] start_arm
bool finish_arm
bool go_back

")



(provide :hotword_detection/Control "491a05910e95215173090f79f7126129")


