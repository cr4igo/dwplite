#!/bin/sh

echo $(whoami) > /tmp/username

#variables
userName=$2
displayNumber=:$4.0

export HOME=/home/${userName}
export DISPLAY=${displayNumber}
export PATH="/bin:/usr/bin"

echo "username: ${userName}" >> /tmp/sc.log
echo "display: ${DISPLAY}" >> /tmp/sc.log

touch /usr/share/X11/xkb/keymap.dir

echo "touched done.." >> /tmp/sc.log

# setting keyboard layout to german keyboard
setxkbmap -layout de -display ${DISPLAY} -variant nodeadkeys &
setxkbmap -layout de -display :1001 -variant nodeadkeys & true

echo "setxkbmap done.." >> /tmp/sc.log

# setting ownership to all files within homedir
chown ${userName}:${userName} ${HOME} -R &

customScript=/${HOME}/userlogonscript.sh
if [ -f ${customScript} ]; then
    echo "executing customScript" >> /tmp/sc.log
    chmod +x ${customScript}
    sh -c ${customScript} &
fi

# desktop unity!
#echo "$(date) dconf reset.." >> /tmp/sc.log
#mv ~/.cache/compizconfig-1 ~/.cache/compizconfig-backup
#dconf reset -f /org/compiz/
#echo "$(date) ..." >> /tmp/sc.log
#unity --reset-icons --replace &
#echo "$(date) unity reset icons and replace..." >> /tmp/sc.log

exit 0
