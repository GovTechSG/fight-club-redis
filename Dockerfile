FROM redis:5.0-rc3

COPY redis.conf /usr/local/etc/redis/redis.conf

COPY redis.log /var/log/redis/redis.log

CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
