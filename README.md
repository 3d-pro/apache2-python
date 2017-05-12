## Required Docker Images
- openssh

## Build
```
  docker build -t apache2:latest .
```
## Run
```
  docker run -d -p 8080:80 -p 4433:443 -h apache2 --name apache2 apache2:latest
```
