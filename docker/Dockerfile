FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get -y upgrade

#Apache installieren
RUN apt-get -y install apache2 
RUN apt-get install ufw -y


#proxy aktivieren
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_balancer
RUN a2enmod lbmethod_byrequests

CMD systemctl restart apache2

# Konfiguration Apache
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN mkdir -p /var/lock/apache2 /var/run/apache2

RUN groupadd -r docker_grp && useradd -r -g docker_grp dockertest

EXPOSE 80

VOLUME /var/www/html

CMD /usr/sbin/apache2ctl -D FOREGROUND

#default html ersetzen
ADD  /shift /var/www/html

#Firewall konfig ausführen
ADD firewall.sh . 
RUN chmod +x ./firewall.sh