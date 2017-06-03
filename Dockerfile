FROM 3dpro/apache2

ADD build-files /build-files
RUN echo 'Acquire::http::Proxy "http://172.17.0.1:3142";' > /etc/apt/apt.conf.d/11proxy && \
    apt-get update && \
    apt-get -y dist-upgrade && \
    apt-get -y install python-pip libapache2-mod-wsgi libmariadbclient-dev && \
    pip install web.py && \
    useradd -s /bin/bash -d /home/web -m web && \
    mv /build-files/main.py /home/web/ && \
    sudo -u web -H mkdir -p /home/web/static && \
    mv /build-files/start.sh /start.sh && \
    mv /build-files/envvars /etc/apache2/envvars && \
    mv /build-files/000-default.conf /etc/apache2/sites-available/000-default.conf && \
    chown web:web -R /home/web/ && \
    chown root:root /root/.ssh && \
    chmod 700 /root/.ssh && \
    chmod 600 /root/.ssh/authorized_keys && \
    chown root:root /start.sh && \
    chmod 755 /start.sh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /build-files /etc/apt/apt.conf.d/11proxy

ENV ALLOW_OVERRIDE **False**

EXPOSE 80 443
WORKDIR /home/web
CMD ["/start.sh"]
