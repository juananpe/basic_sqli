# Use an official PHP image with Apache
FROM php:7.4-apache

# Install mysqli extension (required for MySQL interaction)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy website files to the default Apache directory
COPY ./www/ /var/www/html/

# Expose port 80
EXPOSE 80

