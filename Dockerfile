FROM mdnetdesign/apache

RUN yum -y install epel-release
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

RUN yum -y install mod_php71w php71w-common php71w-mysql php71w-pdo
RUN yum -y install php71w-xml php71w-intl php71w-cli php71w-mbstring
RUN yum -y install php71w-xdebug php71w-imap php71w-gd php71w-opcache