#!/bin/sh
# my xinitrc for notion, for convenient symlinking into $HOME

#unclutter -idle 1 &

echo "$PATH" | grep -q ~/bin || export PATH=~/bin:"$PATH"
echo "$PATH" | grep -q /usr/local/bin || export PATH="/usr/local/bin:$PATH"

f=~/.notion/keyboard.sh; test -f $f && source $f;
keychain -q
f=~/.keychain/$(hostname)-sh; test -f $f && source $f;
f=~/.keychain/$(hostname)-sh-gpg; test -f $f && source $f;

#( sleep 5; exec ~/.bin/trayion ) &
nm-applet &

for x in ~/.ssh/id_*; do
    echo "$x" | grep -q '\.pub$' && continue
    ssh-add $x </dev/null
done
#/usr/bin/ssh-add ~/.ssh/id_rsa
#/usr/bin/ssh-add ~/.ssh/id_rsa_foo
#/usr/bin/ssh-add ~/.ssh/id_rsa_old
#/usr/bin/ssh-add ~/.ssh/id_hack
#/usr/bin/ssh-add ~/.ssh/id_ecdsa

#syndaemon -i 1 &
inputplug -c ~/.notion/inputplug.sh
emacs --daemon &
nm-applet &
xfce4-panel &

exec notion
