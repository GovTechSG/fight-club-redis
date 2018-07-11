FROM redis:5.0-rc3

COPY redis.conf /usr/local/etc/redis/redis.conf

WORKDIR /var/lib/redis/

RUN chown -Rf 1001:0 /var/lib/redis

RUN chmod -Rf g+rwx /var/lib/redis

# Make tmp folder globally accessible
chmod -Rf 0777 /tmp

# Find and fix permissions to allow group read/write of regular files and execute of directories.
find /usr /etc /home $@ -user ${APP_UID} -exec chgrp --quiet ${ROOT_GID} {} \;
find /usr /etc /home $@ -user ${APP_UID} -o -group ${ROOT_GID} -exec chmod g+rw {} \;
find /usr /etc /home $@ -user ${APP_UID} -o -group ${ROOT_GID} -type d -exec chmod g+x {} +

EXPOSE 6379

CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
