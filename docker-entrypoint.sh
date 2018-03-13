#!/bin/bash

if [[ -z "${HTPASSWD}" ]]; then
	echo "use default"
else
  	# echo password to file
  	echo "echo password to file"
	echo "${HTPASSWD}" > '/etc/nginx/.htpasswd'
	# reload nginx with new password
	# service nginx restart
	#    /etc/init.d/nginx restart
	#	service nginx reload
	# service nginx restart
fi

# Run nginx
exec /usr/sbin/nginx