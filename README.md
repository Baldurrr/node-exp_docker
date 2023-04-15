# node-exp_docker
Custom image of node exporter (compatible with pterodactyl)

## Ptero config
You can import the egg in your pterodactyl with the egg json file
The egg uses this image: baldurr/node-exp_docker:ptero


## Basic config
Use this tag for basic use:
image: baldurr/node-exp_docker:latest

## Docker-compose file for basic use
```
version: '3.3'
services:
  node-exporter:
    ports:
      - '9100:9100'
    container_name: node-exporter
    restart: always
    image: baldurr/node-exp_docker:latest
```
