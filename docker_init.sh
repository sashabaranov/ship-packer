yum -y install sudo

echo "export SHIPSOFT=/opt" >> /root/.bash_profile
echo "export FAIRROOTPATH=\$SHIPSOFT/FairRootInst" >> /root/.bash_profile
echo "export SIMPATH=\$SHIPSOFT/FairSoftInst" >> /root/.bash_profile
echo "export FAIRSHIP=\$SHIPSOFT/FairShip" >> /root/.bash_profile
echo "export PYTHONPATH=\$FAIRSHIP/python:\$SIMPATH/lib:\$SIMPATH/lib/Geant4:\$PYTHONPATH" >> /root/.bash_profile