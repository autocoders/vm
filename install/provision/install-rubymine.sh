#!/usr/bin/env bash

wget --no-cookies --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com" "http://download.oracle.com/otn-pub/java/jdk/7u45-b18/jdk-7u45-linux-x64.tar.gz"
sudo mv jdk-7u45-linux-x64.tar.gz /opt; sudo tar xfz jdk-7u45-linux-x64.tar.gz
echo 'export JAVA_HOME=/opt/jdk1.7.0_45' >> /home/vagrant/.bash_profile
echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /home/vagrant/.bash_profile
wget download.jetbrains.com/ruby/RubyMine-6.0.2.tar.gz
sudo mv RubyMine-6.0.2.tar.gz /opt; tar xfz RubyMine-6.0.2.tar.gz
echo 'export PATH=$PATH:/opt/RubyMine-6.0.2/bin' >> /home/vagrant/.bash_profile
source .bash_profile