#! /bin/bash
if [[ -z "${HTPASSWD}" ]]; then
	echo "use default"
else
  	# echo password to file
	echo "${HTPASSWD}" > '/etc/nginx/.htpasswd'
	# reload nginx with new password
	# sudo systemctl restart nginx
	# sudo service nginx restart
	# sudo /etc/init.d/nginx restart
	service nginx reload
fi