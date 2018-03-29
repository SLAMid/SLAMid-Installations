# Clone OpenCV somewhere
# I'll put it into $HOME/code/opencv
OPENCV_DIR="$HOME/Desktop/opencv"
OPENCV_VER="3.1.0"
#git clone https://github.com/opencv/opencv "$OPENCV_DIR"
# This'll take a while...

# Now lets checkout the specific version we want
cd "$OPENCV_DIR"
git checkout "$OPENCV_VER"

# First OpenCV will generate the files needed to do the actual build.
# We'll put them in an output directory, in this case "release"
mkdir release
cd release

# Note: This is where you'd add build options, like TBB support or custom Python versions. See above sections.
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_GTK=ON -D WITH_OPENGL=ON ..

# At this point, take a look at the console output.
# OpenCV will print a report of modules and features that it can and can't support based on your system and installed libraries.
# The key here is to make sure it's not missing anything you'll need!
# If something's missing, then you'll need to install those dependencies and rerun the cmake command.

# OK, lets actually build this thing!
# Note: You can use the "make -jN" command, which will run N parallel jobs to speed up your build. Set N to whatever your machine can handle (usually <= the number of concurrent threads your CPU can run).
make -j4
# This will also take a while...

# Now install the binaries!
sudo make install
