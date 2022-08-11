# Clear any old environment that may conflict.
for key in $( set | awk '{FS="="}  /^OS_/ {print $1}' ); do unset $key ; done
export OS_PROJECT_DOMAIN_NAME=Default
export OS_USER_DOMAIN_NAME=Default
export OS_PROJECT_NAME=service
export OS_USERNAME=octavia
export OS_PASSWORD=octavia-admin
export OS_AUTH_URL=http://20.20.1.100:35357/v3
export OS_INTERFACE=internal
export OS_ENDPOINT_TYPE=internalURL
