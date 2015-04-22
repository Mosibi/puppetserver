#!/bin/bash

MODULEDIR='/home/richard/modules'

if [ ! -d "${MODULEDIR}/puppetserver" ]; then
	echo "Please create ${MODULEDIR} and put the module puppetserver in that dir"
	exit 1
fi

wget http://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb -O /tmp/puppetlabs-release-pc1-trusty.deb
dpkg -i /tmp/puppetlabs-release-pc1-trusty.deb
apt-get update
apt-get -y install puppet-agent
apt-get --purge -y remove puppetlabs-release-pc1
apt-get update

# Install puppetserver module dependencies
/opt/puppetlabs/bin/puppet module install puppetlabs-apt --target-dir "${MODULEDIR}"

echo -e "Everything should be prepared now, please execute the following command:\n"
echo -e "\t\t/opt/puppetlabs/bin/puppet apply --modulepath=${MODULEDIR} -e \"include puppetserver\""


# Na install gedaan
# puppet module install zack-r10k
