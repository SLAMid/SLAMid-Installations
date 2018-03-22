# Pre-reqs
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git
sudo apt-get install cmake
cd ~

# Installing ROS Indigo
read -p "ROS Indigo ... Press enter to continue"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get install ros-indigo-desktop-full
sudo apt-get install ros-indigo-desktop
sudo rosdep init
rosdep update
echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt-get install python-rosinstall
cd ~

#Setting up a Catkin workspace
source /opt/ros/indigo/setup.bash
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin_make
source devel/setup.bash
cd ~

# Installing OpenCV 3.2.x
read -p "Installing OpenCV 3.2.x ... Press enter to continue"
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install python3.5-dev python3-numpy libtbb2 libtbb-dev
sudo apt-get install libjpeg-dev libpng-dev libtiff5-dev libjasper-dev libdc1394-22-dev libeigen3-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev sphinx-common libtbb-dev yasm libfaac-dev libopencore-amrnb-dev libopencore-amrwb-dev libopenexr-dev libgstreamer-plugins-base1.0-dev libavutil-dev libavfilter-dev libavresample-dev
cd /opt/
git clone https://github.com/Itseez/opencv.git
git clone https://github.com/Itseez/opencv_contrib.git
cd opencv
mkdir release
cd release
sudo cmake -D BUILD_TIFF=ON -D WITH_CUDA=OFF -D ENABLE_AVX=OFF -D WITH_OPENGL=OFF -D WITH_OPENCL=OFF -D WITH_IPP=OFF -D WITH_TBB=ON -D BUILD_TBB=ON -D WITH_EIGEN=OFF -D WITH_V4L=OFF -D WITH_VTK=OFF -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=/opt/opencv_contrib/modules /opt/opencv/
sudo make -j4
sudo make install
sudo ldconfig
cd ~

# Prepping for RTAB-Map install
read -p "Prepping Install ... Press enter to continue"
sudo apt-get install ros-indigo-rtabmap
sudo apt-get remove ros-indigo-rtabmap

# Installing RTAB-Map ROS from source
source /opt/ros/indigo/setup.bash
source ~/catkin_ws/devel/setup.bash

## Installing QT
read -p "Installing QT ... Press enter to continue"
wget http://download.qt.io/official_releases/qt/5.7/5.7.0/qt-opensource-linux-x64-5.7.0.run
cd ~
chmod +x qt-opensource-linux-x64-5.7.0.run
./qt-opensource-linux-x64-5.7.0.run
sudo apt-get install build-essential
sudo apt-get install libfontconfig1
sudo apt-get install mesa-common-dev
sudo apt-get install libglu1-mesa-dev -y

## Installing PCL 1.8
read -p "Installing PCL 1.8 ... Press enter to continue"
sudo apt-get update  
sudo apt-get install git  

cd ~/Documents    
git clone https://github.com/PointCloudLibrary/pcl.git pcl-trunk    
ln -s pcl-trunk pcl 

sudo apt-get install g++ 
sudo apt-get install cmake cmake-gui 
sudo apt-get install doxygen   
sudo apt-get install mpi-default-dev openmpi-bin openmpi-common   
sudo apt-get install libflann1.8 libflann-dev 
sudo apt-get install libeigen3-dev 
sudo apt-get install libboost-all-dev 
sudo apt-get install libvtk5.8-qt4 libvtk5.8 libvtk5-dev 
sudo apt-get install libqhull* 
sudo apt-get install libusb-dev 
sudo apt-get install libgtest-dev 
sudo apt-get install git-core freeglut3-dev pkg-config 
sudo apt-get install build-essential libxmu-dev libxi-dev  
sudo apt-get install libusb-1-0-dev graphviz mono-complete 
sudo apt-get install qt-sdk openjdk-7-jdk openjdk-7-jre 
sudo apt-get install phonon-backend-gstreamer 
sudo apt-get install phonon-backend-vlc

cd ~/Documents/pcl 
mkdir release 
cd release 
cmake -DCMAKE_BUILD_TYPE=Release -DPCL_QT_VERSION=4 -DBUILD_GPU=ON -DBUILD_apps=ON -DBUILD_examples=ON .. 
make
sudo make install
cd ~

## Installing VTK 6.1.0
read -p "Installing VTK 6.1.0 ... Press enter to continue"
wget http://www.vtk.org/files/release/6.1/VTK-6.1.0.tar.gz
wget http://www.vtk.org/files/release/6.1/VTKData-6.1.0.tar.gz
wget http://www.vtk.org/files/release/6.1/VTKLargeData-6.1.0.tar.gz
tar zxvf VTK-6.1.0.tar.gz
tar zxvf VTKData-6.1.0.tar.gz
tar zxvf VTKLargeData-6.1.0.tar.gz
mkdir VTK-6.1.0-build
cd VTK-6.1.0-build
cmake ../VTK-6.1.0 \
-DBUILD_DOCUMENTATION:BOOL=ON \
-DBUILD_EXAMPLES:BOOL=ON \
-DBUILD_SHARED_LIBS:BOOL=ON \
-DBUILD_TESTING:BOOL=ON \
-DVTK_Group_Imaging:BOOL=ON \
-DVTK_Group_MPI:BOOL=ON \
-DVTK_Group_Qt:BOOL=ON \
-DVTK_Group_Rendering:BOOL=ON \
-DVTK_Group_StandAlone:BOOL=ON \
-DVTK_Group_Tk:BOOL=ON \
-DVTK_Group_Views:BOOL=ON \
-DVTK_Group_Web:BOOL=ON \
-DVTK_USE_LARGE_DATA:BOOL=ON \
-DVTK_USE_TK:BOOL=ON \
-DVTK_WRAP_PYTHON:BOOL=ON \
-DVTK_WRAP_TCL:BOOL=ON
make -j2
sudo make install
cd ~

sudo apt-get install ros-indigo-costmap-2d
sudo apt-get install ros-indigo-pcl-ros
sudo apt-get install ros-indigo-navigation
sudo apt-get install ros-indigo-octomap
sudo apt-get install ros-indigo-octomap ros-indigo-octomap-mapping ros-indigo-octomap-msgs ros-indigo-octomap-ros ros-indigo-octomap-rviz-plugins ros-indigo-octomap-server

git clone https://github.com/introlab/rtabmap.git rtabmap
cd rtabmap/build
cmake ..
make -j4
sudo make install
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/ros/indigo/lib/x86_64-linux-gnu
sudo ldconfig

sudo chown -R $USER ./ 

cd ~/catkin_ws
git clone https://github.com/introlab/rtabmap_ros.git src/rtabmap_ros
catkin_make -j1
