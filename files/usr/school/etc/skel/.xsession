## BOCAL STAFF 2010-2011
## FEDORA DUMP

WM="startfluxbox"
NM="nm-applet"
TERM="xterm"
END="dclock"

xhost -

if [ -f ${HOME}/.Xdefaults ]
then
    xrdb ${HOME}/.Xdefaults
fi

if [ ! -f ${HOME}/.fluxbox/menu ]
then
    if [ ! -d ${HOME}/.fluxbox ]
    then
	mkdir ${HOME}/.fluxbox
	chmod 700 ${HOME}/.fluxbox
    fi
    fluxbox-generate_menu -b google-chrome -m IIT -t xterm -w google.com
    sed -e '145a [exec] (Shutdown) {poweroff }\n[exec] (Reboot) {reboot }' -i ${HOME}/.fluxbox/menu
fi

exec ${WM} &
exec ${NM} &
exec ${TERM} &
exec ${END}
# EOF
