// Auto-generated. Do not edit!

// (in-package basic_motors_and_sensors.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class WheelCommands {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.commandL = null;
      this.commandR = null;
    }
    else {
      if (initObj.hasOwnProperty('commandL')) {
        this.commandL = initObj.commandL
      }
      else {
        this.commandL = 0.0;
      }
      if (initObj.hasOwnProperty('commandR')) {
        this.commandR = initObj.commandR
      }
      else {
        this.commandR = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WheelCommands
    // Serialize message field [commandL]
    bufferOffset = _serializer.float32(obj.commandL, buffer, bufferOffset);
    // Serialize message field [commandR]
    bufferOffset = _serializer.float32(obj.commandR, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WheelCommands
    let len;
    let data = new WheelCommands(null);
    // Deserialize message field [commandL]
    data.commandL = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [commandR]
    data.commandR = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'basic_motors_and_sensors/WheelCommands';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '178021d2695cd48d61727e5fa7defa6f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 commandL
    float32 commandR
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new WheelCommands(null);
    if (msg.commandL !== undefined) {
      resolved.commandL = msg.commandL;
    }
    else {
      resolved.commandL = 0.0
    }

    if (msg.commandR !== undefined) {
      resolved.commandR = msg.commandR;
    }
    else {
      resolved.commandR = 0.0
    }

    return resolved;
    }
};

module.exports = WheelCommands;
