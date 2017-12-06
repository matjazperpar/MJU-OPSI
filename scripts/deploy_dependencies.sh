#!/bin/sh

# Install git
yum -y install git

# Clone GIT Repo to /etc/puppet
git clone https://gitlab.xlab.si/MJU-POPS/opsi-puppet-deploy.git /etc/puppet

# Change current directory to /etc/puppet
cd /etc/puppet/

# Change to dev branch
git checkout development

#change deployment script to silent mode
cat install_puppet_dependancies.sh | sed '/#set hostname/,+12 d' > install_dep_silently.sh 

#add exec permissions on file
chmod +x install_dep_silently.sh

#execute deployment
./install_dep_silently.sh
