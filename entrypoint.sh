#!/bin/sh
groupadd -r $USER -g 433 \
    && useradd -u 431 -r -g $USER -d /home/$USER -s /bin/bash -c "$USER" $USER \
    && adduser $USER sudo \
    && mkdir -p /home/$USER \
    && chown -R $USER:$USER /home/$USER \
    && echo $USER':'$PASSWORD | chpasswd
service dbus start
service nxserver start
#/etc/NX/nxserver --startup
tail -f /usr/NX/var/log/nxserver.log
