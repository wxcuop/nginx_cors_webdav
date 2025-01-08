# Use the official NGINX base image
FROM nginx:1.26

# Copy the custom nginx.conf to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Create directories for webdav or logs if needed
RUN mkdir -p /webdav /var/log/nginx

# Optional: Set permissions for webdav directory
RUN chown -R www-data:www-data /webdav

# Expose the HTTP port
EXPOSE 80

# Command to start NGINX
CMD ["nginx", "-g", "daemon off;"]
