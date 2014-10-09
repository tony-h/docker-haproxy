#! /bin/bash

eval echo -n \""`sed -e 's/"/\\\\\\\"/g' /root/haproxy.cfg`"\" > /etc/haproxy/haproxy.cfg
cat /etc/haproxy/haproxy.cfg
exec /usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg
