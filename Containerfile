FROM docker.io/library/nginx:latest

# Expose port 9090
EXPOSE 9090

RUN apt update -y && apt install -y php-fpm net-tools vim

# Custom nginx config file that enables handling of PHP
COPY nginx-default.conf /etc/nginx/conf.d/default.conf

# Copy the local PHP file into the /app directory
COPY tradecalc.php /usr/share/nginx/html/index.php
RUN chmod 644 /usr/share/nginx/html/index.php
RUN /etc/init.d/php8.4-fpm start



