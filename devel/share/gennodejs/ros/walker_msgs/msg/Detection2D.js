// Auto-generated. Do not edit!

// (in-package walker_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let BBox2D = require('./BBox2D.js');
let std_msgs = _finder('std_msgs');
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class Detection2D {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.boxes = null;
      this.result_image = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('boxes')) {
        this.boxes = initObj.boxes
      }
      else {
        this.boxes = [];
      }
      if (initObj.hasOwnProperty('result_image')) {
        this.result_image = initObj.result_image
      }
      else {
        this.result_image = new sensor_msgs.msg.Image();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Detection2D
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [boxes]
    // Serialize the length for message field [boxes]
    bufferOffset = _serializer.uint32(obj.boxes.length, buffer, bufferOffset);
    obj.boxes.forEach((val) => {
      bufferOffset = BBox2D.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [result_image]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.result_image, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Detection2D
    let len;
    let data = new Detection2D(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [boxes]
    // Deserialize array length for message field [boxes]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.boxes = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.boxes[i] = BBox2D.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [result_image]
    data.result_image = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.boxes.forEach((val) => {
      length += BBox2D.getMessageSize(val);
    });
    length += sensor_msgs.msg.Image.getMessageSize(object.result_image);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'walker_msgs/Detection2D';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'dd8b9135a56521d4afeeec8a6c509df0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    
    walker_msgs/BBox2D[] boxes
    
    sensor_msgs/Image result_image
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: walker_msgs/BBox2D
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
    
    ================================================================================
    MSG: sensor_msgs/Image
    # This message contains an uncompressed image
    # (0, 0) is at top-left corner of image
    #
    
    Header header        # Header timestamp should be acquisition time of image
                         # Header frame_id should be optical frame of camera
                         # origin of frame should be optical center of camera
                         # +x should point to the right in the image
                         # +y should point down in the image
                         # +z should point into to plane of the image
                         # If the frame_id here and the frame_id of the CameraInfo
                         # message associated with the image conflict
                         # the behavior is undefined
    
    uint32 height         # image height, that is, number of rows
    uint32 width          # image width, that is, number of columns
    
    # The legal values for encoding are in file src/image_encodings.cpp
    # If you want to standardize a new string format, join
    # ros-users@lists.sourceforge.net and send an email proposing a new encoding.
    
    string encoding       # Encoding of pixels -- channel meaning, ordering, size
                          # taken from the list of strings in include/sensor_msgs/image_encodings.h
    
    uint8 is_bigendian    # is this data bigendian?
    uint32 step           # Full row length in bytes
    uint8[] data          # actual matrix data, size is (step * rows)
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Detection2D(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.boxes !== undefined) {
      resolved.boxes = new Array(msg.boxes.length);
      for (let i = 0; i < resolved.boxes.length; ++i) {
        resolved.boxes[i] = BBox2D.Resolve(msg.boxes[i]);
      }
    }
    else {
      resolved.boxes = []
    }

    if (msg.result_image !== undefined) {
      resolved.result_image = sensor_msgs.msg.Image.Resolve(msg.result_image)
    }
    else {
      resolved.result_image = new sensor_msgs.msg.Image()
    }

    return resolved;
    }
};

module.exports = Detection2D;
