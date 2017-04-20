# Installation instructions for the "Industrial extrinsic cal" ROS library
# Following the guide from http://wiki.ros.org/industrial_extrinsic_cal

# Assuming we are in the catkin_ws directory
# Initially installing the dependencies
# Install gflags
cd ~
wget https://github.com/gflags/gflags/archive/v2.1.2.zip
unzip v2.1.2.zip && rm v2.1.2.zip
cd gflags-2.1.2 && mkdir build && cd build
cmake .. -DBUILD_SHARED_LIBS=ON
make
sudo make install


# Install glog
cd ~
wget https://github.com/google/glog/archive/v0.3.4.zip
unzip v0.3.4.zip && rm v0.3.4.zip
cd glog-0.3.4/
./configure --with-gflags=/usr/local/
make
sudo make install


#Install Ceres
cd ~
wget https://github.com/ceres-solver/ceres-solver/archive/1.11.0.zip
unzip 1.11.0.zip && rm 1.11.0.zip
cd ceres-solver-1.11.0
mkdir build && cd build
cmake ..
make
sudo make install

# https://github.com/ros-industrial/industrial_calibration/tree/kinetic
cd ~/catkin_ws/src
git clone -b kinetic https://github.com/ros-industrial/industrial_calibration.git
sudo apt-get install -y python-wstool
wstool init ~/catkin_ws/src
# in case there is an error in the next step do (http://answers.ros.org/question/208963/installing-package-from-source-in-indigo/)
# cd ..
# rosdep update
# rosdep install --from-paths src --ignore-src --rosdistro kinetic
# cd src
wstool merge industrial_calibration/industrial_calibration.rosinstall
wstool update
cd ..
catkin_make

# Now the package should be accessible 