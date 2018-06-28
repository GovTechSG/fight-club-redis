FROM redis:5.0-rc3

COPY redis.conf /usr/local/etc/redis/redis.conf

WORKDIR /var/lib/redis/

CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
