# We can't change permisions for files on volumes so have to do the following
cp -rf /monit-cfg /etc/monit
chmod -R 600 /etc/monit

monit -Ic /etc/monit/monitrc