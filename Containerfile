FROM docker.io/library/nginx:latest

# Expose port 9090
EXPOSE 9090

# Create the /app directory and make shortcuts to the files for ease.
RUN ln -s /usr/share/nginx/html /app
RUN apt update -y && apt install -y php-fpm net-tools vim

# Copy the local PHP file into the /app directory
COPY tradecalc.php /app/index.php

# Custom nginx config file that enables handling of PHP
COPY nginx-default.conf /etc/nginx/conf.d/default.conf
