FROM centos:7
MAINTAINER aniketkulaye618@gmail.com
RUN yum -y update && yum clean all
RUN yum install -y httpd
RUN yum install -y zip
RUN yum install -y unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page281/eoc.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip eoc.zip
RUN cp -rvf eoc-html/* .
RUN rm -rf eoc-html eoc.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
