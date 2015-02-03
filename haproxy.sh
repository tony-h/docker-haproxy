#! /bin/bash

# Expands environment variables
eval echo -n \""`sed -e 's/"/\\\\\\\"/g' /root/haproxy.cfg`"\" > /etc/haproxy/haproxy.cfg

if [ "$SSL_CERT" == "" ]; then
  echo "Missing required environment variable: SSL_CERT"
  exit 1
fi

cat <<EOF > /etc/haproxy/haproxy.pem
$SSL_CERT
EOF
perl -pi -e 's/%/\n/g' /etc/haproxy/haproxy.pem

cat /etc/haproxy/haproxy.pem
exec /usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg
