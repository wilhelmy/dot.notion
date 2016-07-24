#!/bin/sh
# my xinitrc for notion, for convenient symlinking into $HOME

#unclutter -idle 1 &

source ~/.notion/keyboard.sh
keychain -q
source ~/.keychain/$(hostname)-sh
source ~/.keychain/$(hostname)-sh-gpg

( sleep 5; exec ~/.bin/trayion ) &
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

exec notion
