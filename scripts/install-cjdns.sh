cd /opt
git clone https://github.com/cjdelisle/cjdns.git cjdns
cd cjdns
./do
./cjdroute --genconf > /etc/cjdroute.conf

/vagrant/scripts/configure-cjdns.py

chmod 600 /etc/cjdroute.conf

chown vagrant:vagrant /home/vagrant/.cjdnsadmin

cp /vagrant/scripts/cjdns.conf /etc/init/
chmod +x /etc/init/cjdns.conf
start cjdns

cp -r /opt/cjdns/contrib/python/cjdnsadmin /usr/lib/python2.7/
ln -sf /usr/lib/python2.7/cjdnsadmin/cli.py /usr/bin/cexec
chmod +x /usr/bin/cexec
cp /opt/cjdns/contrib/python/cjdnslog /opt/cjdns/contrib/python/dumptable /opt/cjdns/contrib/python/findnodes /usr/bin/
cp /opt/cjdns/contrib/python/peerStats /opt/cjdns/contrib/python/sessionStats /usr/bin/
