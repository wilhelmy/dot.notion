#!/usr/bin/env ksh93
# my xinitrc for notion, for convenient symlinking into $HOME
# Uses ksh because I can't be bothered to read the bash manpage to figure out
# arrays, and I guess ksh is just a nicer scripting shell in general.

echo "$PATH" | grep -q ~/bin || export PATH=~/bin:"$PATH"
echo "$PATH" | grep -q /usr/local/bin || export PATH="/usr/local/bin:$PATH"

f=~/.notion/keyboard.sh; test -f $f && source $f;
keychain -q
f=~/.keychain/$(hostname)-sh; test -f $f && source $f;
f=~/.keychain/$(hostname)-sh-gpg; test -f $f && source $f;

#( sleep 5; exec ~/.bin/trayion ) &
nm-applet &

# I probably should also be using gpg-agent

for x in ~/.ssh/id_*; do
    echo "$x" | grep -q '\.pub$' && continue
    ssh-add $x </dev/null
done
#/usr/bin/ssh-add ~/.ssh/id_rsa
#/usr/bin/ssh-add ~/.ssh/id_rsa_foo
#/usr/bin/ssh-add ~/.ssh/id_rsa_old
#/usr/bin/ssh-add ~/.ssh/id_hack
#/usr/bin/ssh-add ~/.ssh/id_ecdsa

# Autostart section

#syndaemon -i 1 &
inputplug -c ~/.notion/inputplug.sh
emacs --daemon &
nm-applet &
xfce4-panel &

# start a bunch of software as part of session bringup, cfg_kludges.lua takes
# care of moving it to the appropriate frames
purpose=(mosh root log)
cmd=(	"mosh infs"
       	"sudo -i"
       	"sudo -i journalctl -xf"
)

for ((i=0; i<${#purpose[@]}; i++)); do
	urxvt -name "urxvt-for-${purpose[$i]}" -e ${cmd[$i]} &
done

signal &
dino &
wire &
www-browser & # symlinked to firefox in ~/bin

# Create special-purpose emacs windows
emacsen=(mail)
eval=(mu4e)
for ((i=0; i<${#emacsen[@]}; i++)); do
	emacsclient --create-frame --no-wait --frame-parameters $"((name . \"${emacsen[$i]}\"))" --eval "(${eval[$i]})" &
done

# Finally
exec notion
