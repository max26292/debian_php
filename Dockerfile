FROM debian:stretch

ENV LC_ALL=C.UTF-8
RUN \
    apt-get -y update && \
    apt-get install -y apt-utils gnupg gnupg1 gnupg2 && \
    apt-get install -y nano && \
    apt-get install -y wget curl&& \
    apt-get install -y ca-certificates apt-transport-https && \
    apt-get install -y software-properties-common && \
    wget -q https://packages.sury.org/php/apt.gpg -O- |  apt-key add - && \
    echo "deb https://packages.sury.org/php/ stretch main" | tee /etc/apt/sources.list.d/php.list   && \
    apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install -y apache2 libapache2-mod-php7.2 && \
    apt-get install -y php7.2 php7.2-cli php7.2-common php7.2-curl php7.2-gd php7.2-json php7.2-mbstring php7.2-mysql php7.2-opcache php7.2-readline php7.2-xml && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer  && \
    apt-get -y update
WORKDIR /var/www/html
COPY ./init.sh /
COPY ./php.ini /etc/php/7.2/cli/
COPY ./apache2.conf /etc/apache2/
COPY ./boot.sh /
RUN chmod 755 /init.sh && \
    chmod +x /init.sh && \
    chmod 777 /boot.sh &&\
    chmod +x /boot.sh && \
    /init.sh
ENTRYPOINT [ "/bin/bash" , "/boot.sh" ]
EXPOSE 80 9000
# CMD [ "/bin/bash" , "/boot.sh" ]
