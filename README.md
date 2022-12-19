# yandex-disk
Docker image for Yandex.Disk with docker-compose support


## Setup mode
```shell
docker run --rm -it \
  -v ~/yandex-disk/config:/root/.config/yandex-disk \
  ipglotov/yandex-disk \
  token
```
OAuth-token file `~/yandex-disk/config/passwd` is generated.

## Daemon mode
### Edit docker-compose.yml
Environment variables:
 - EXCLUDE - folders to be excluded from synchronization

### Run daemon
```shell
docker-compose up -d yandex-disk
```
All data will be in `~/yandex-disk/data` folder outside the container.
### Status check
```shell
docker exec -it yandex-disk sh -c "yandex-disk status --dir=/y --auth=/root/.config/yandex-disk/passwd"
```

### Stop daemon
```shell
docker-compose stop yandex-disk
```

### Delete daemon and data
```shell
docker stop yandex-disk && \
docker rm yandex-disk && \
sudo rm -r ~/yandex-disk/data/.sync/ && \
sudo rm -r ~/yandex-disk/data/*
```

## Build Docker image and push to DockerHub
```shell
docker build -t ipglotov/yandex-disk ~/yandex-disk

docker login --username=myuser
docker push ipglotov/yandex-disk
```

## References
 - Based on images from [ruslanys](https://github.com/ruslanys/docker-yandex.disk) and [WorldException](https://github.com/WorldException/docker-yandex-disk).
 - [Yandex documentation](https://yandex.ru/support/disk/cli-clients.html#cli-daemon).
 - DockerHub [image link](https://hub.docker.com/repository/docker/ipglotov/yandex-disk) for the source code.