FROM cern/cc7-base

RUN echo "export SHIPSOFT=/opt" >> /root/.bash_profile
RUN echo "export FAIRROOTPATH=\$SHIPSOFT/FairRootInst" >> /root/.bash_profile
RUN echo "export SIMPATH=\$SHIPSOFT/FairSoftInst" >> /root/.bash_profile
RUN echo "export FAIRSHIP=\$SHIPSOFT/FairShip" >> /root/.bash_profile
RUN echo "export PYTHONPATH=\$FAIRSHIP/python:\$SIMPATH/lib:\$SIMPATH/lib/Geant4:\$PYTHONPATH" >> /root/.bash_profile


COPY build_ship.sh /tmp/build_ship.sh
RUN source /tmp/build_ship.sh


RUN yum -y autoremove
RUN find /usr/share/locale | grep -v en | xargs rm -rf
RUN yum clean all