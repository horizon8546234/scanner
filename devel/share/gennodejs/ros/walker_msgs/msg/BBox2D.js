// Auto-generated. Do not edit!

// (in-package walker_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class BBox2D {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.class_name = null;
      this.score = null;
      this.center = null;
      this.size_x = null;
      this.size_y = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('class_name')) {
        this.class_name = initObj.class_name
      }
      else {
        this.class_name = '';
      }
      if (initObj.hasOwnProperty('score')) {
        this.score = initObj.score
      }
      else {
        this.score = 0.0;
      }
      if (initObj.hasOwnProperty('center')) {
        this.center = initObj.center
      }
      else {
        this.center = new geometry_msgs.msg.Pose2D();
      }
      if (initObj.hasOwnProperty('size_x')) {
        this.size_x = initObj.size_x
      }
      else {
        this.size_x = 0.0;
      }
      if (initObj.hasOwnProperty('size_y')) {
        this.size_y = initObj.size_y
      }
      else {
        this.size_y = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BBox2D
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [class_name]
    bufferOffset = _serializer.string(obj.class_name, buffer, bufferOffset);
    // Serialize message field [score]
    bufferOffset = _serializer.float32(obj.score, buffer, bufferOffset);
    // Serialize message field [center]
    bufferOffset = geometry_msgs.msg.Pose2D.serialize(obj.center, buffer, bufferOffset);
    // Serialize message field [size_x]
    bufferOffset = _serializer.float32(obj.size_x, buffer, bufferOffset);
    // Serialize message field [size_y]
    bufferOffset = _serializer.float32(obj.size_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BBox2D
    let len;
    let data = new BBox2D(null);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [class_name]
    data.class_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [score]
    data.score = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [center]
    data.center = geometry_msgs.msg.Pose2D.deserialize(buffer, bufferOffset);
    // Deserialize message field [size_x]
    data.size_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [size_y]
    data.size_y = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.class_name.length;
    return length + 44;
  }

  static datatype() {
    // Returns string type for a message object
    return 'walker_msgs/BBox2D';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0c77df3d2730bffc00b93fb5799a0241';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 id
    string class_name
    float32 score
    
    geometry_msgs/Pose2D center
    float32 size_x
    float32 size_y
    ================================================================================
    MSG: geometry_msgs/Pose2D
    # Deprecated
    # Please use the full 3D pose.
    
    # In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.
    
    # If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.
    
    
    # This expresses a position and orientation on a 2D manifold.
    
    float64 x
    float64 y
    float64 theta
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BBox2D(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.class_name !== undefined) {
      resolved.class_name = msg.class_name;
    }
    else {
      resolved.class_name = ''
    }

    if (msg.score !== undefined) {
      resolved.score = msg.score;
    }
    else {
      resolved.score = 0.0
    }

    if (msg.center !== undefined) {
      resolved.center = geometry_msgs.msg.Pose2D.Resolve(msg.center)
    }
    else {
      resolved.center = new geometry_msgs.msg.Pose2D()
    }

    if (msg.size_x !== undefined) {
      resolved.size_x = msg.size_x;
    }
    else {
      resolved.size_x = 0.0
    }

    if (msg.size_y !== undefined) {
      resolved.size_y = msg.size_y;
    }
    else {
      resolved.size_y = 0.0
    }

    return resolved;
    }
};

module.exports = BBox2D;
