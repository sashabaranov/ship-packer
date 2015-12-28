# SHiP Packer template

This repository contains [Packer](https://www.packer.io/) template for SHiP experiment software. This template exports docker and vagrant images.


Docker image is suitable if you want to do some quick experiments or debugging for running MC production in Skygrid. Vagrant is more suitable for long-term analysis usage. Installation instructions are shown below. After installing via docker or vagrant, you should run `source /opt/FairShipRun/config.sh` in order to work with FairShip.



Docker
---
Once you have [Docker](https://www.docker.com/) installed on your computer, you can work with ship environment as:

```
docker pull scr4t/ship
docker run -ti scr4t/ship /bin/bash -l

```




Vagrant
---

Download [Vagrant](https://www.vagrantup.com/) and in terminal do:

```
mkdir ship-workdir; cd ship-workdir
vagrant init sashabaranov/ship; vagrant up --provider virtualbox
```

Second command will take some time to download ~4 Gb virtual machine.
Once finished, you can either export ssh config to future usage by using `vagrant ssh-config` or directly connecting to machine by using `vagrant ssh`.