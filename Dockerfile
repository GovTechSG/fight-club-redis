FROM redis:5.0-rc3

COPY redis.conf /usr/local/etc/redis/redis.conf

COPY redis.log /var/log/redis/redis.log
RUN chgrp -R 0 /var/log/redis
RUN chmod -R g+rwx /var/log/redis

CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
