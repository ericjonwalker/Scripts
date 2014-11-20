#!/bin/bash
#####################################################
#
# Purpose:		For re-enabling SSLv2 in Kali Linux
# Written By:	Eric J. Walker 
# Date:			19 Nov, 2014
# 
#####################################################

# Get devscripts and quilt if not installed
apt-get -y install devscripts quilt
# Get source code
apt-get source openssl
cd openssl*

# remove patches 
quilt pop -a 

# debian/patches/series
# delete ssltest_no_sslv2.patch
sed -i '/ssltest_no_sslv2.patch/d' debian/patces/series

# debian/rules
# delete no-ssl2
sed -i 's/no-ssl2//g' debian/rules

# repatch 
quilt push -a 

# change description for changelog
dch –n 'Allow SSLv2'
# commit any changes 
dpkg-source -–commit
# rebuild OpenSSL with customizations
debuild -uc -us

cd..
# Install updated ssl package
dpkg -i *ssl*.deb

######################
##Rebuiling SSLSCAN ##
######################
#apt-get source sslscan
#cd sslscan-*
#debuild -uc –us
#cd..
#dpkg -i *sslscan*.deb
