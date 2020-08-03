FROM centos:7

RUN set -x && yum -y update \
           && yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
           && yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm \
           && yum -y install git \
           && yum -y install yum-utils \
           && yum-config-manager --enable remi-php74 \
           && yum -y install php \
           && yum -y install php-common \ 
           && yum -y install php-xml \
           && yum -y install php-mbstring \
           && yum -y install php-zip \
           && php -v && php --modules \
           && yum install -y gcc-c++ make && curl -sL https://rpm.nodesource.com/setup_14.x | bash - \
           && yum install -y nodejs \
           && curl -sS https://getcomposer.org/installer | php \
           && mv composer.phar /usr/local/bin/composer \
           && chmod +x /usr/local/bin/composer

# Create and downloads directory for the project 
RUN set -x && mkdir /var/www/html/simplephpapp
WORKDIR /var/www/html/simplephpapp
RUN set -x && git clone https://github.com/Saritasa/simplephpapp.git . \
           && cp .env.example .env
# # Install program
RUN set -x && composer install \
            && php artisan key:generate \
            && npm install \
            && npm run production