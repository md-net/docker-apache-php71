FROM mdnetdesign/apache

RUN yum -y install epel-release
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

RUN yum -y install mod_php71w php71w-common php71w-mysql php71w-pdo
RUN yum -y install php71w-xml php71w-intl php71w-cli php71w-mbstring
RUN yum -y install php71w-pecl-xdebug php71w-imap php71w-gd php71w-opcache
RUN yum -y install php71w-pecl-imagick php71w-pecl-apcu

RUN yum -y install wget
RUN cd /tmp; wget http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
RUN yum -y remove wget
RUN cd /tmp; tar xfz ioncube_loaders_lin_x86-64.tar.gz; rm -rf ioncube_loaders_lin_x86-64.tar.gz
RUN cp /tmp/ioncube/ioncube_loader_lin_7.1.so /usr/lib64/php/modules
RUN cd /tmp; rm -rf ioncube
RUN echo "" >> /etc/php.ini; echo "zend_extension = /usr/lib64/php/modules/ioncube_loader_lin_7.1.so" >> /etc/php.ini

RUN sed -ri "s/max_execution_time\s*=\s*[0-9]+/max_execution_time=300/" /etc/php.ini
RUN sed -ri "s/short_open_tag\s*=\s*[Oo]ff/short_open_tag=On/" /etc/php.ini
RUN sed -ri "s/post_max_size\s*=\s*[0-9]+M/post_max_size=1G/" /etc/php.ini
RUN sed -ri "s/upload_max_filesize\s*=\s*[0-9]+M/upload_max_filesize=200M/" /etc/php.ini
RUN sed -ri "s/memory_limit\s*=\s*[0-9]+M/memory_limit=1G/" /etc/php.ini
