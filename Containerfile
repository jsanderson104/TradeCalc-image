FROM docker.io/library/nginx:latest

# Expose port 9090
EXPOSE 9090

# Create the /app directory
RUN ln -s /usr/share/nginx/html /app

# Copy the local PHP file into the /app directory
COPY tradecalc.php /app/index.php
