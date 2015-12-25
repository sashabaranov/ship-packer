#!/bin/sh

date > /etc/vagrant_box_build_time

mkdir -pm 700 /home/vagrant/.ssh
curl -L https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -o /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh



echo "export SHIPSOFT=/opt" >> /home/vagrant/.bash_profile
echo "export FAIRROOTPATH=\$SHIPSOFT/FairRootInst" >> /home/vagrant/.bash_profile
echo "export SIMPATH=\$SHIPSOFT/FairSoftInst" >> /home/vagrant/.bash_profile
echo "export FAIRSHIP=\$SHIPSOFT/FairShip" >> /home/vagrant/.bash_profile
echo "export PYTHONPATH=\$FAIRSHIP/python:\$SIMPATH/lib:\$SIMPATH/lib/Geant4:\$PYTHONPATH" >> /home/vagrant/.bash_profile
