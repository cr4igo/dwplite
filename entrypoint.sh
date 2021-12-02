#!/bin/sh
groupadd -r $USER -g 1000 \
    && useradd -u 1000 -r -g $USER -d /home/$USER -s /bin/bash -c "$USER" $USER \
    && adduser $USER sudo \
    && mkdir -p /home/$USER \
    && echo $USER':'$PASSWORD | chpasswd

#    && chown -R $USER:$USER /home/$USER \

service dbus start
service nxserver start
# add guest user
/usr/NX/bin/nxserver --ruleadd --class feature --type enable-guest --value yes
#/etc/NX/nxserver --startup
tail -f /usr/NX/var/log/nxserver.log
