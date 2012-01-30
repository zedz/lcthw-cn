set -e

# go somewhere safe
cd /tmp

# get the source to base APR 1.4.5
curl -L -O http://download.nextag.com/apache//apr/apr-1.4.5.tar.gz

# extract it and go into the source
tar -xzvf apr-1.4.5.tar.gz
cd apr-1.4.5

# configure, make, make install
./configure
make
sudo make install

# reset and cleanup
cd /tmp
rm -rf apr-1.4.5 apr-1.4.5.tar.gz

# do the same with apr-util
curl -L -O http://download.nextag.com/apache//apr/apr-util-1.3.12.tar.gz

# extract
tar -xzvf apr-util-1.3.12.tar.gz
cd apr-util-1.3.12

# configure, make, make install
./configure --with-apr=/usr/local/apr
# you need that extra parameter to configure because
# apr-util can't really find it because...who knows.

make
sudo make install

#cleanup
cd /tmp
rm -rf apr-util-1.3.12* apr-1.4.5*

