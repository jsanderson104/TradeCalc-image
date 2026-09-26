FROM docker.io/library/nginx:latest

# Expose port 9090
EXPOSE 9090

RUN rm -f /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh

# Temporarily put logs back in to the shim filesystem. I know this sounds dumb but I think I'm missing some important log info so I want to see the entire log from start to end
RUN unlink /var/log/nginx/error.log && touch /var/log/nginx/error.log
RUN unlink /var/log/nginx/access.log && touch /var/log/nginx/access.log

RUN apt update -y && apt install -y php-fpm net-tools vim

# Custom nginx config file that enables handling of PHP
COPY nginx-default.conf /etc/nginx/conf.d/default.conf

# Copy the local PHP file into the /app directory
COPY index.html /usr/share/nginx/html
RUN chmod 644 /usr/share/nginx/html/index.html
RUN echo hello >/hello.txt




