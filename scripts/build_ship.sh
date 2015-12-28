yum -y groupinstall X11

yum -y install \
	which file bc bash-completion man \
	unzip tar patch \
	cmake \
	gcc-c++ \
	gcc-gfortran \
	compat-gcc-34-g77 \
	git subversion \
	xorg-x11-xauth \
	libX11-devel libXpm-devel libXmu-devel libXft-devel libXext-devel \
	mesa-libGL-devel mesa-libGLU-devel \
	expat-devel \
	python-devel \
	libxml2-devel \
	python-mtTkinter \
	vim redhat-lsb-core


yum -y install x11vnc libpng xterm twm
yum -y install openssl openssl-devel openssl-CERN-CA-certs
yum -y install curl libcurl libcurl-openssl automake autoconf aclocal libcurl-devel libtool cmake bzip2 bzip2-devel

export SHIPSOFT=/opt
export FAIRROOTPATH=$SHIPSOFT/FairRootInst
export SIMPATH=$SHIPSOFT/FairSoftInst
export FAIRSHIP=$SHIPSOFT/FairShip
export PYTHONPATH=$FAIRSHIP/python:$SIMPATH/lib:$SIMPATH/lib/Geant4:$PYTHONPATH



mkdir -p $SHIPSOFT

git clone -b dev https://github.com/ShipSoft/FairSoft.git $SHIPSOFT/FairSoft
cd $SHIPSOFT/FairSoft
echo 1 | ./configure.sh


#ls -lah $SIMPATH/bin/
#export PATH=$SIMPATH/bin:$PATH
#source $SIMPATH/bin/thisroot.sh

git clone -b dev https://github.com/ShipSoft/FairRoot.git $SHIPSOFT/FairRoot
cd $SHIPSOFT/FairRoot
export PATH=$SIMPATH/bin:$PATH
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$FAIRROOTPATH -DUSE_DIFFERENT_COMPILER=TRUE
make
make install
# ./configure.sh


git clone https://github.com/ShipSoft/FairShip.git $FAIRSHIP
mkdir -p $FAIRSHIP/../FairShipRun
cd $FAIRSHIP/../FairShipRun
cmake $FAIRSHIP -DCMAKE_INSTALL_PREFIX=$(pwd) -DCMAKE_CXX_COMPILER=$($SIMPATH/bin/fairsoft-config --cxx) -DCMAKE_C_COMPILER=$($SIMPATH/bin/fairsoft-config --cc)
make

# cleanup
rm -rf $SHIPSOFT/FairSoft
rm -rf $SHIPSOFT/FairRoot
