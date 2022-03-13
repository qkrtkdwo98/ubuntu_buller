// Auto-generated. Do not edit!

// (in-package hotword_detection.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Control {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.detect_word = null;
      this.send_goal = null;
      this.detect_object = null;
      this.object_position = null;
      this.start_arm = null;
      this.finish_arm = null;
      this.go_back = null;
    }
    else {
      if (initObj.hasOwnProperty('detect_word')) {
        this.detect_word = initObj.detect_word
      }
      else {
        this.detect_word = 0;
      }
      if (initObj.hasOwnProperty('send_goal')) {
        this.send_goal = initObj.send_goal
      }
      else {
        this.send_goal = 0;
      }
      if (initObj.hasOwnProperty('detect_object')) {
        this.detect_object = initObj.detect_object
      }
      else {
        this.detect_object = 0;
      }
      if (initObj.hasOwnProperty('object_position')) {
        this.object_position = initObj.object_position
      }
      else {
        this.object_position = [];
      }
      if (initObj.hasOwnProperty('start_arm')) {
        this.start_arm = initObj.start_arm
      }
      else {
        this.start_arm = [];
      }
      if (initObj.hasOwnProperty('finish_arm')) {
        this.finish_arm = initObj.finish_arm
      }
      else {
        this.finish_arm = false;
      }
      if (initObj.hasOwnProperty('go_back')) {
        this.go_back = initObj.go_back
      }
      else {
        this.go_back = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Control
    // Serialize message field [detect_word]
    bufferOffset = _serializer.uint16(obj.detect_word, buffer, bufferOffset);
    // Serialize message field [send_goal]
    bufferOffset = _serializer.uint16(obj.send_goal, buffer, bufferOffset);
    // Serialize message field [detect_object]
    bufferOffset = _serializer.uint16(obj.detect_object, buffer, bufferOffset);
    // Serialize message field [object_position]
    bufferOffset = _arraySerializer.float32(obj.object_position, buffer, bufferOffset, null);
    // Serialize message field [start_arm]
    bufferOffset = _arraySerializer.float32(obj.start_arm, buffer, bufferOffset, null);
    // Serialize message field [finish_arm]
    bufferOffset = _serializer.bool(obj.finish_arm, buffer, bufferOffset);
    // Serialize message field [go_back]
    bufferOffset = _serializer.bool(obj.go_back, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Control
    let len;
    let data = new Control(null);
    // Deserialize message field [detect_word]
    data.detect_word = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [send_goal]
    data.send_goal = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [detect_object]
    data.detect_object = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [object_position]
    data.object_position = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [start_arm]
    data.start_arm = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [finish_arm]
    data.finish_arm = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [go_back]
    data.go_back = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.object_position.length;
    length += 4 * object.start_arm.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'hotword_detection/Control';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '491a05910e95215173090f79f7126129';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint16 detect_word
    uint16 send_goal
    uint16 detect_object
    float32[] object_position
    float32[] start_arm
    bool finish_arm
    bool go_back
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Control(null);
    if (msg.detect_word !== undefined) {
      resolved.detect_word = msg.detect_word;
    }
    else {
      resolved.detect_word = 0
    }

    if (msg.send_goal !== undefined) {
      resolved.send_goal = msg.send_goal;
    }
    else {
      resolved.send_goal = 0
    }

    if (msg.detect_object !== undefined) {
      resolved.detect_object = msg.detect_object;
    }
    else {
      resolved.detect_object = 0
    }

    if (msg.object_position !== undefined) {
      resolved.object_position = msg.object_position;
    }
    else {
      resolved.object_position = []
    }

    if (msg.start_arm !== undefined) {
      resolved.start_arm = msg.start_arm;
    }
    else {
      resolved.start_arm = []
    }

    if (msg.finish_arm !== undefined) {
      resolved.finish_arm = msg.finish_arm;
    }
    else {
      resolved.finish_arm = false
    }

    if (msg.go_back !== undefined) {
      resolved.go_back = msg.go_back;
    }
    else {
      resolved.go_back = false
    }

    return resolved;
    }
};

module.exports = Control;
