FROM docker.io/library/nginx:latest

# Expose port 9090
EXPOSE 9090

# Custom nginx config file that enables handling of PHP
COPY nginx-default.conf /etc/nginx/conf.d/default.conf

# Copy the local PHP file into the /app directory
COPY tradecalc.php /app/index.php


# Create the /app directory and make shortcuts to the files for ease.
RUN ln -s /usr/share/nginx/html /app
RUN apt update -y && apt install -y php-fpm net-tools vim
RUN /etc/init.d/php8.4-fpm start



