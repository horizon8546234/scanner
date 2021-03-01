// Generated by gencpp from file walker_msgs/Detection2DTrigger.msg
// DO NOT EDIT!


#ifndef WALKER_MSGS_MESSAGE_DETECTION2DTRIGGER_H
#define WALKER_MSGS_MESSAGE_DETECTION2DTRIGGER_H

#include <ros/service_traits.h>


#include <walker_msgs/Detection2DTriggerRequest.h>
#include <walker_msgs/Detection2DTriggerResponse.h>


namespace walker_msgs
{

struct Detection2DTrigger
{

typedef Detection2DTriggerRequest Request;
typedef Detection2DTriggerResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct Detection2DTrigger
} // namespace walker_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::walker_msgs::Detection2DTrigger > {
  static const char* value()
  {
    return "cf923ddea53902c0e022439a3f0b0a31";
  }

  static const char* value(const ::walker_msgs::Detection2DTrigger&) { return value(); }
};

template<>
struct DataType< ::walker_msgs::Detection2DTrigger > {
  static const char* value()
  {
    return "walker_msgs/Detection2DTrigger";
  }

  static const char* value(const ::walker_msgs::Detection2DTrigger&) { return value(); }
};


// service_traits::MD5Sum< ::walker_msgs::Detection2DTriggerRequest> should match
// service_traits::MD5Sum< ::walker_msgs::Detection2DTrigger >
template<>
struct MD5Sum< ::walker_msgs::Detection2DTriggerRequest>
{
  static const char* value()
  {
    return MD5Sum< ::walker_msgs::Detection2DTrigger >::value();
  }
  static const char* value(const ::walker_msgs::Detection2DTriggerRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::walker_msgs::Detection2DTriggerRequest> should match
// service_traits::DataType< ::walker_msgs::Detection2DTrigger >
template<>
struct DataType< ::walker_msgs::Detection2DTriggerRequest>
{
  static const char* value()
  {
    return DataType< ::walker_msgs::Detection2DTrigger >::value();
  }
  static const char* value(const ::walker_msgs::Detection2DTriggerRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::walker_msgs::Detection2DTriggerResponse> should match
// service_traits::MD5Sum< ::walker_msgs::Detection2DTrigger >
template<>
struct MD5Sum< ::walker_msgs::Detection2DTriggerResponse>
{
  static const char* value()
  {
    return MD5Sum< ::walker_msgs::Detection2DTrigger >::value();
  }
  static const char* value(const ::walker_msgs::Detection2DTriggerResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::walker_msgs::Detection2DTriggerResponse> should match
// service_traits::DataType< ::walker_msgs::Detection2DTrigger >
template<>
struct DataType< ::walker_msgs::Detection2DTriggerResponse>
{
  static const char* value()
  {
    return DataType< ::walker_msgs::Detection2DTrigger >::value();
  }
  static const char* value(const ::walker_msgs::Detection2DTriggerResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // WALKER_MSGS_MESSAGE_DETECTION2DTRIGGER_H
