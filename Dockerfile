FROM mdnetdesign/apache

RUN yum -y install epel-release
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

RUN yum -y install mod_php71w php71w-common php71w-mysql php71w-pdo
RUN yum -y install php71w-xml php71w-intl php71w-cli php71w-mbstring
RUN yum -y install php71w-pecl-xdebug php71w-imap php71w-gd php71w-opcache php71w-pecl-apcu

RUN sed -ri "s/max_execution_time\s*=\s*[0-9]+/max_execution_time=300/" /etc/php.ini
RUN sed -ri "s/short_open_tag\s*=\s*[Oo]ff/short_open_tag=On/" /etc/php.ini
RUN sed -ri "s/post_max_size\s*=\s*[0-9]+M/post_max_size=1G/" /etc/php.ini
RUN sed -ri "s/upload_max_filesize\s*=\s*[0-9]+M/upload_max_filesize=200M/" /etc/php.ini
