FROM ubuntu:14.04
ENV DEBIAN-FRONTEND non-interacive 
#3rd party repo for installing other python versions 
#RUN add-apt-repository  ppa:fkrull/deadsnakes

RUN apt-get update 
RUN apt-get install -y python && apt-get  install -y  python-pip && apt-get install -y apache2 && apt-get install -y  libapache2-mod-wsgi

#copy the contents from project repository to virtual directory
COPY / /var/www/blog/
WORKDIR /var/www/blog/

RUN pip install -r requirements.txt
RUN python manage.py makemigrations
RUN python manage.py migrate

#Testing
RUN python manage.py test
#apache config
ADD apache.sh /home
RUN sh  /home/apache.sh


#Apache Environment Variable settings
ENV APACHE_LOCK_DIR /home
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
RUN apache2 -t -D DUMP_MODULES

#run apache2 at foreground
RUN service apache2 restart 
EXPOSE 80
#RUN /usr/sbin/apache2ctl -D FOREGROUND
