#!/bin/bash

if [ $UID == '0' ]; then

    copy "Copie des fichiers de configuration des shells" "files/.tcshrc files/.vimrc files/.bashrc" "$EPIHOME"

    grab "Google chrome verification key" "https://dl-ssl.google.com/linux" "linux_signing_key.pub"
    apt-key add linux_signing_key.pub

    info "-" "Ajout du depot Debian pour le paquet ubuntu-tweak"
    add-apt-repository ppa:tualatrix/ppa
    apt-get -qq update

    epi-install "libqt4-core libqt4-dbus ubuntu-tweak tree valgrind libncurses5-dev libncursesw5-dev libncurses5-dbg libncursesw5-dbg ncurses-doc alien curl tcsh libssl-dev vlc flashplugin-installer lib32stdc++6 lib32asound2 ia32-libs libc6-i386 lib32gcc1" "Installation des paquets de base..."

    if ask "Voulez-vous installer Google Chrome?"; then
        epi-install "libxss1" "Installation des dependances de Google Chrome..."
        grab "Google chrome stable" "https://dl.google.com/linux/direct" "google-chrome-stable_current_amd64.deb"
        dpkg -i google-chrome-stable_current_amd64.deb
        rm -f google-chrome-stable_current_amd64.deb
    fi
    if ask "Voulez-vous installer Skype?"; then
        grab "Skype" "http://www.skype.com/go" "getskype-linux-beta-ubuntu-64"
        dpkg -i skype-ubuntu_amd64.deb
        rm -r skype-ubuntu_amd64.deb
    fi
    if ask "Voulez-vous installer Teamviewer?"; then
        grab "Teamviewer" "http://www.teamviewer.com/download" "teamviewer_linux.deb"
        dpkg -i teamviewer_linux.deb
        rm -f teamviewer_linux.deb
    fi
    if ask "Voulez-vous installer QNetSoul?"; then
        grab "QNetSoul" "http://dl.dropbox.com/u/13100583" "qnetsoul-latest.tar.gz"
        deco "qnetsoul-latest.tar.gz"
        rm -f qnetsoul-latest.tar.gz
        cp QNetSoul /usr/bin/qnetsoul
        chmod 777 /usr/bin/qnetsoul
        rm -f QNetSoul Updater
    fi
    if ask "Voulez-vous installer Sublime Text?"; then
        grab "Sublime Text" "http://c758482.r82.cf2.rackcdn.com" "Sublime%20Text%202.0.1%20x64.tar.bz2"
        deco "Sublime%20Text%202.0.1%20x64.tar.bz2"
        rm -f "Sublime%20Text%202.0.1%20x64.tar.bz2"
    fi

    epi-install "gcc-multilib libc6-i386" "Installation des paquets multilib"

    info "-" "Configuration des fichiers specifiques."
    deco "files/tuareg.tar.gz"
    cp -r tuareg/* /usr/share/emacs/site-lisp/
    rm -rf tuareg
    cp -r files/usr /
    ln -s /usr/lib/libncurses.so.5 /usr/lib/libtinfo.so.5
    ln -s /usr/lib/libtinfo.so.5 /usr/lib/libtinfo.so
    chmod -R 777 /usr/school
    chmod 777 /usr/bin/dclock
    chmod 777 /usr/bin/zlock
    chmod 777 /usr/libexec/ns_auth
    chmod 777 /usr/libexec/ns_client
    chmod 777 /usr/libexec/ns_connect
    chmod 777 /usr/libexec/ns_xm
    chmod 4755 /sbin/poweroff
    chmod 4755 /sbin/shutdown
    chmod 4755 /sbin/reboot
    chmod 4755 /sbin/halt

    epi-install "libqt4-gui libqt4-network p7zip-full emacs23 gmountiso emesene unrar-free p7zip filezilla subversion make wine git numlockx samba libpam-smbpass ocaml rlwrap xchat libsdl1.2debian libsdl1.2-dev libsdl-image1.2 libsdl-image1.2-dev libsdl-ttf2.0-0 libsdl-ttf2.0-dev libsdl-mixer1.2 libsdl-mixer1.2-dev gimp python-gpgme libgtkmm-2.4-dev libgtkmm-2.4-doc htop libx11-dev libxpm-dev x11proto-xext-dev libxext-dev" "Installation des paquets de base..."
    epi-install "apache2 apache2-doc mysql-server mysql-client php5 libapache2-mod-php5 php5-mysql phpmyadmin zlibc zlib1g zlib1g-dev libmysqlclient-dev mysql-common" "Installation des paquets web..."
    epi-install "module-assistant openafs-modules-source openafs-client openafs-krb5 heimdal-clients openafs-modules-dkms" "Installation des paquets AFS..."

    beg "-" "Configuration de OpenAFS"
        cp files/CellServDB /etc/openafs/
        cp files/ThisCell /etc/openafs/
        cp files/krb5.conf /etc/
        chmod 644 /etc/openafs/CellServDB
        chmod 644 /etc/openafs/ThisCell
        chmod 644 /etc/krb5.conf
    end "-" "Configuration de OpenAFS"

    beg "-" "Demarrage du service OpenAFS"
        /etc/init.d/openafs-client start > /dev/null
    end "-" "Demarrage du service OpenAFS"

    beg "-" "Creation du lien symbolique 'u' vers l'AFS (Cette action peut necessiter plusieures minutes)"
        ln -s /afs/epitech.net/users /u
    end "-" "Creation du lien symbolique 'u' vers l'AFS (Cette action peut necessiter plusieures minutes)"

    info "Si ce n'est deja fait, relancez ce script en tant qu'utilisateur normal: $0 $1"
    info "Il est conseille de redemarrer l'ordinateur afin d'appliquer les changements."

    if ask "Voulez-vous redemarrer l'ordinateur?"; then
        reboot
    fi

else

    beg "gconftool-2" "Positionement a droite des boutons Minimize, Maximize et Close."
        gconftool-2 --set /apps/metacity/general/button_layout --type string ":minimize,maximize,close"
    end "gconftool-2" "Positionement a droite des boutons Minimize, Maximize et Close."

    beg "gconftool-2" "Desactivation de la confirmation de Veille, Redemarrage et Arret."
        gconftool-2 --type bool --set /apps/indicator-session/suppress_logout_restart_shutdown true
    end "gconftool-2" "Desactivation de la confirmation de Veille, Redemarrage et Arret."

    beg "gconftool-2" "Desactivation du changement d'utilisateur en LockScreen."
        gconftool-2 --type bool --set /apps/gnome-screensaver/user_switch_enabled false
    end "gconftool-2" "Desactivation du changement d'utilisateur en LockScreen."

    beg "gconftool-2" "Affichage du nom complet dans le menu Me Ubuntu."
        gconftool-2 --type int --set /system/indicator/me/display 2
    end "gconftool-2" "Affichage du nom complet dans le menu Me Ubuntu."

    beg "gconftool-2" "Activation des icones aux menus et aux boutons."
        gconftool-2 --type bool --set /desktop/gnome/interface/menus_have_icons true
        gconftool-2 --type bool --set /desktop/gnome/interface/buttons_have_icons true
    end "gconftool-2" "Activation des icones aux menus et aux boutons."

    beg "gconftool-2" "Activation des permissions avancees dans Nautilus"
        gconftool-2 --type bool --set /apps/nautilus/preferences/show_advanced_permissions true
    end "gconftool-2" "Activation des permissions avancees dans Nautilus"

    info "Si ce n'est deja fait, relancez ce script en tant que super-utilisateur: sudo $0 $1"
fi
