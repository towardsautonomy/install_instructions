#!/bin/bash

#############################################################
## Install NVIDIA Drivers
# Follow the instructions in 'cuda_install_instructions.txt'
#############################################################
## Install ROS Kinetic
# Setup your sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# Set up your keys
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
# Installation
sudo apt-get update
sudo apt-get install ros-kinetic-desktop-full
# Initialize rosdep
sudo rosdep init
rosdep update
# Environment setup
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
# Setup catkin
mkdir -p ~/catkin_ws/src
sudo apt-get install python-catkin-tools
#############################################################
## OPENCV
sudo apt-get install libopencv-dev python3-opencv
#############################################################
## install DBW_MKZ_ROS
# One Line SDK Install (binary)
bash <(wget -q -O - https://bitbucket.org/DataspeedInc/dbw_mkz_ros/raw/default/dbw_mkz/scripts/sdk_install.bash)
#############################################################
## Install Docker CE
# Uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc
# Update the apt package index
sudo apt-get update
# Install packages to allow apt to use a repository over HTTPS
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Verify that you now have the key
sudo apt-key fingerprint 0EBFCD88
# set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
# Install Docker CE
sudo apt-get update
sudo apt-get install docker-ce
