FROM redis:5.0-rc3

ENV HOME=/var/lib/redis/
ENV ROOT_UID=0
ENV ROOT_GID=0
ENV APP_UID=1001

COPY redis.conf /usr/local/etc/redis/redis.conf

WORKDIR ${HOME}

RUN chown -Rf ${APP_UID}:${ROOT_GID} /var/lib/redis

RUN chmod -Rf g+rwx ${HOME}

# Make tmp folder globally accessible
RUN chmod -Rf 0777 /tmp

# Find and fix permissions to allow group read/write of regular files and execute of directories.
RUN find /usr /etc /home $@ -user ${APP_UID} -exec chgrp --quiet ${ROOT_GID} {} \;
RUN find /usr /etc /home $@ -user ${APP_UID} -o -group ${ROOT_GID} -exec chmod g+rw {} \;
RUN find /usr /etc /home $@ -user ${APP_UID} -o -group ${ROOT_GID} -type d -exec chmod g+x {} +

EXPOSE 6379

CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
