# Apache 2.4 with Python 2.7 [![Build Status](https://travis-ci.org/3d-pro/apache2-python.svg?branch=master)](https://travis-ci.org/3d-pro/apache2-python)

## Required Docker Images
- apache2

## Build
```
  docker build -t apache2-python:latest .
```
## Run
```
  docker run -d -p 8080:80 -p 4433:443 -h apache2-python --name apache2-python apache2-python:latest
```
