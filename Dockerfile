FROM ubuntu:22.04

MAINTAINER Artem Glotov <github@ipglotov.ru>

ENV EXCLUDE="" \
    TOKEN="/root/.config/yandex-disk/passwd"

COPY entrypoint.sh /

RUN apt-get update \
    # Upgrade
    && apt-get upgrade -y \
    && apt-get dist-upgrade -y \
    # Install dependencies
    && apt-get install wget -y \
    # Download & Install Yandex.Disk
    && wget https://repo.yandex.ru/yandex-disk/yandex-disk_latest_amd64.deb \
    && dpkg -i yandex-disk_latest_amd64.deb \
    && apt-get install -f -y \
    # Cleanup
    && rm *.deb \
    && apt-get purge -y \
    && apt-get autoremove -y \
    && apt-get autoclean -y \
    # Create folders and files
    && mkdir /y && chmod 777 /y \
    && chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "start" ]