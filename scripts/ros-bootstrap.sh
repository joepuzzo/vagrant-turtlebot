#!/usr/bin/env bash

# This script will install ros-kinetic-desktop-full

#Configure Ubuntu Repositories
add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ xenial restricted universe multiverse"

#Configure ROS.org repository
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

#Setup Keys
apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

#Update the indexes
apt-get update

#Install C/C++ Compilers
apt-get -y install build-essential

#Install ROS with full Desktop features: ROS, rqt, rviz, robot-generic libraries, 2D/3D simulators, navigation and 2D/3D perception
apt-get -y install ros-kinetic-desktop-full

#initialize RosDep
rosdep init
rosdep update

#Install RosInstall
apt-get -y install python-rosinstall

#Install Catkin tools
apt-get -y install ros-kinetic-catkin

#Install librealsense because turtlebot needs it i guess...
sudo apt-get install -y ros-kinetic-librealsense

#Install turtlebot 
apt-get install ros-kinetic-turtlebot ros-kinetic-turtlebot-apps ros-kinetic-turtlebot-interactions ros-kinetic-turtlebot-simulator ros-kinetic-kobuki-ftdi ros-kinetic-ar-track-alvar-msgs -y


#Setup ROS environment variables
echo "source /opt/ros/kinetic/setup.bash" >> /home/vagrant/.bashrc
