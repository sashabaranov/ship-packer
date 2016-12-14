set -e
yum -y update
yum -y groupinstall  "X Window System"
yum -y install mesa-libGL mesa-libGL-devel
yum -y install tigervnc-server vnc
yum -y install krb5-workstation krb5-libs
yum -y install tkinter
yum -y install mesa-libglapi

yum -y install which file bc bash-completion man
yum -y install unzip tar patch
yum -y install cmake
yum -y install gcc-c++
yum -y install gcc-gfortran
# yum -y install compat-gcc-34-g77
yum -y install git subversion
yum -y install xorg-x11-xauth libX11-devel libXpm-devel libXmu-devel libXft-devel libXext-devel
yum -y install mesa-libGL-devel mesa-libGLU-devel
yum -y install expat-devel
yum -y install python-mtTkinter python-devel
yum -y install libxml2-devel
yum -y install vim redhat-lsb-core

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
