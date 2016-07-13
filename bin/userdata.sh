#!/bin/bash

##################
## User Updates ##
##################
useradd {{user}} -m -s "/bin/bash" -G cdrom,adm,dialout,plugdev,netdev,lxd,sudo,video,users,games,audio,dip,admin
cp /home/ubuntu/.ssh /home/{{user}}/.ssh -r
chown {{user}}:{{user}} /home/{{user}}/.ssh -R
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

################
## Node Setup ##
################
curl -sL https://deb.nodesource.com/setup_4.x | bash -
apt-get install -y nodejs build-essential

########################
## Package Management ##
########################
add-apt-repository -y ppa:webupd8team/sublime-text-3
apt-get update
apt-get install -y git xorg unzip sublime-text-installer

##########################
## Android Development ##
##########################
#Off until android studio works remotely, currently it is very slow.
#apt-get install -y openjdk-8-jdk lib32z1 lib32ncurses5 lib32stdc++6 g++
#echo "JAVA_HOME=$(update-alternatives --query javac | sed -n -e 's/Best: *\(.*\)\/bin\/javac/\1/p')" >> /etc/environment

####
# echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
# add-apt-repository -y ppa:webupd8team/java
# apt-get update
# apt-get install -y oracle-java8-installer