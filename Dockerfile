# Use an official PHP runtime as the base image
FROM php:7.4-apache

# Set the working directory in the container
WORKDIR /var/www/html

# Install mysqli extension
RUN docker-php-ext-install mysqli

# Copy the PHP application files into the container
COPY . /var/www/html
