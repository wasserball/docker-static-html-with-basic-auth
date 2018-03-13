FROM nginx

ADD build /usr/share/nginx/www
ADD nginx.conf /etc/nginx/
ADD .htpasswd /etc/nginx/
ADD .htaccess /usr/share/nginx/www/
ADD docker-entrypoint.sh /usr/src/app/
RUN ["chmod", "+x", "/usr/src/app/docker-entrypoint.sh"]
#ENTRYPOINT ["/usr/src/app/docker-entrypoint.sh"] 
RUN /usr/src/app/docker-entrypoint.sh

