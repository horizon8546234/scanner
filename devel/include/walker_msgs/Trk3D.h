// Generated by gencpp from file walker_msgs/Trk3D.msg
// DO NOT EDIT!


#ifndef WALKER_MSGS_MESSAGE_TRK3D_H
#define WALKER_MSGS_MESSAGE_TRK3D_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace walker_msgs
{
template <class ContainerAllocator>
struct Trk3D_
{
  typedef Trk3D_<ContainerAllocator> Type;

  Trk3D_()
    : x(0.0)
    , y(0.0)
    , vx(0.0)
    , vy(0.0)
    , yaw(0.0)
    , radius(0.0)
    , confidence(0.0)
    , class_id(0)
    , dangerous(0.0)  {
    }
  Trk3D_(const ContainerAllocator& _alloc)
    : x(0.0)
    , y(0.0)
    , vx(0.0)
    , vy(0.0)
    , yaw(0.0)
    , radius(0.0)
    , confidence(0.0)
    , class_id(0)
    , dangerous(0.0)  {
  (void)_alloc;
    }



   typedef float _x_type;
  _x_type x;

   typedef float _y_type;
  _y_type y;

   typedef float _vx_type;
  _vx_type vx;

   typedef float _vy_type;
  _vy_type vy;

   typedef float _yaw_type;
  _yaw_type yaw;

   typedef float _radius_type;
  _radius_type radius;

   typedef float _confidence_type;
  _confidence_type confidence;

   typedef int8_t _class_id_type;
  _class_id_type class_id;

   typedef float _dangerous_type;
  _dangerous_type dangerous;





  typedef boost::shared_ptr< ::walker_msgs::Trk3D_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::walker_msgs::Trk3D_<ContainerAllocator> const> ConstPtr;

}; // struct Trk3D_

typedef ::walker_msgs::Trk3D_<std::allocator<void> > Trk3D;

typedef boost::shared_ptr< ::walker_msgs::Trk3D > Trk3DPtr;
typedef boost::shared_ptr< ::walker_msgs::Trk3D const> Trk3DConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::walker_msgs::Trk3D_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::walker_msgs::Trk3D_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::walker_msgs::Trk3D_<ContainerAllocator1> & lhs, const ::walker_msgs::Trk3D_<ContainerAllocator2> & rhs)
{
  return lhs.x == rhs.x &&
    lhs.y == rhs.y &&
    lhs.vx == rhs.vx &&
    lhs.vy == rhs.vy &&
    lhs.yaw == rhs.yaw &&
    lhs.radius == rhs.radius &&
    lhs.confidence == rhs.confidence &&
    lhs.class_id == rhs.class_id &&
    lhs.dangerous == rhs.dangerous;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::walker_msgs::Trk3D_<ContainerAllocator1> & lhs, const ::walker_msgs::Trk3D_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace walker_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::walker_msgs::Trk3D_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::walker_msgs::Trk3D_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::walker_msgs::Trk3D_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::walker_msgs::Trk3D_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::walker_msgs::Trk3D_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::walker_msgs::Trk3D_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::walker_msgs::Trk3D_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b05fd2d278b92e0899f9fa32977773c2";
  }

  static const char* value(const ::walker_msgs::Trk3D_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb05fd2d278b92e08ULL;
  static const uint64_t static_value2 = 0x99f9fa32977773c2ULL;
};

template<class ContainerAllocator>
struct DataType< ::walker_msgs::Trk3D_<ContainerAllocator> >
{
  static const char* value()
  {
    return "walker_msgs/Trk3D";
  }

  static const char* value(const ::walker_msgs::Trk3D_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::walker_msgs::Trk3D_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 x\n"
"float32 y\n"
"float32 vx\n"
"float32 vy\n"
"float32 yaw\n"
"float32 radius\n"
"float32 confidence\n"
"int8 class_id\n"
"float32 dangerous\n"
;
  }

  static const char* value(const ::walker_msgs::Trk3D_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::walker_msgs::Trk3D_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.vx);
      stream.next(m.vy);
      stream.next(m.yaw);
      stream.next(m.radius);
      stream.next(m.confidence);
      stream.next(m.class_id);
      stream.next(m.dangerous);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Trk3D_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::walker_msgs::Trk3D_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::walker_msgs::Trk3D_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<float>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<float>::stream(s, indent + "  ", v.y);
    s << indent << "vx: ";
    Printer<float>::stream(s, indent + "  ", v.vx);
    s << indent << "vy: ";
    Printer<float>::stream(s, indent + "  ", v.vy);
    s << indent << "yaw: ";
    Printer<float>::stream(s, indent + "  ", v.yaw);
    s << indent << "radius: ";
    Printer<float>::stream(s, indent + "  ", v.radius);
    s << indent << "confidence: ";
    Printer<float>::stream(s, indent + "  ", v.confidence);
    s << indent << "class_id: ";
    Printer<int8_t>::stream(s, indent + "  ", v.class_id);
    s << indent << "dangerous: ";
    Printer<float>::stream(s, indent + "  ", v.dangerous);
  }
};

} // namespace message_operations
} // namespace ros

#endif // WALKER_MSGS_MESSAGE_TRK3D_H
