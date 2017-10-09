FROM scr4t/ship-base:13.03.2017

RUN /bin/bash -l -c "\
        rm -rf opt/FairShipRun /opt/FairShip &&\
        git clone -b skygrid https://github.com/olantwin/FairShip.git /opt/FairShip  &&\
        mkdir -p /opt/FairShip/../FairShipRun &&\
        cd /opt/FairShip/../FairShipRun &&\
        cmake /opt/FairShip -DCMAKE_INSTALL_PREFIX=$(pwd) -DCMAKE_CXX_COMPILER=$(/opt/FairSoftInst/bin/fairsoft-config --cxx) -DCMAKE_C_COMPILER=$(/opt/FairSoftInst/bin/fairsoft-config --cc) &&\
        make"


RUN /bin/bash -l -c "yum -y install numpy"
RUN yum -y autoremove
RUN find /usr/share/locale | grep -v en | xargs rm -rf
RUN yum clean all
