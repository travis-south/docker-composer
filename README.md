# docker-composer
Docker image for my composer setup.

## Introduction

This image is using PHP 7.1.x with Composer.

## Usage

1. `cd` to your project and run `docker run --rm -v $(pwd):/app --env LOCAL_USER_ID=$(id -u) travissouth/composer install`