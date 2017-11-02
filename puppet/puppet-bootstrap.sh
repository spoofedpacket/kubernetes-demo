#!/usr/bin/env bash
echo "Adding puppet repo"
sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
echo "Installing puppet"
sudo yum install puppet -y
