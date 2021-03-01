#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/hou/scanner/src/sensors/vision_opencv/cv_bridge"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/hou/scanner/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/hou/scanner/install/lib/python3/dist-packages:/home/hou/scanner/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/hou/scanner/build" \
    "/usr/bin/python3" \
    "/home/hou/scanner/src/sensors/vision_opencv/cv_bridge/setup.py" \
     \
    build --build-base "/home/hou/scanner/build/sensors/vision_opencv/cv_bridge" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/hou/scanner/install" --install-scripts="/home/hou/scanner/install/bin"
