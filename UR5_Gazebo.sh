# This is a guide to get the universal robot arm UR5 to run with Gazebo and ROS
#Assuming catikin workspace in ~/catkin_ws

cd ~/catkin_ws/src
git clone -b kinetic-devel https://github.com/ros-industrial/universal_robot.git
cd ..
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro kinetic -y
catkin_make
# if it fails try with 
#catking_make_isolated