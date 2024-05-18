# Use an official PHP runtime as the base image
FROM php:7.4-apache

# Install MySQL client and server
RUN apt-get update && \
    apt-get install -y mysql-client mysql-server && \
    rm -rf /var/lib/apt/lists/*

# Install mysqli extension
RUN docker-php-ext-install mysqli

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the PHP application files into the container
COPY . /var/www/html
