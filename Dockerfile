# Use Alpine as the base image
FROM nginx:stable-alpine

# Add the Zscaler certificate
# COPY ZscalerRootCA1.crt /usr/local/share/ca-certificates/my-cert.crt
# RUN cat /usr/local/share/ca-certificates/my-cert.crt >> /etc/ssl/certs/ca-certificates.crt

# Install runtime dependencies
RUN apk --no-cache add apache2-utils openssl

# Define a volume for WebDAV data
VOLUME /webdav

# Copy global NGINX configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the index.html to the /var/www/html directory
COPY index.html /var/www/html/index.html

# Copy the entrypoint script and make it executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint script as the default command
CMD ["/entrypoint.sh"]
