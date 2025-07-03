#!/bin/bash

set -eu

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/UTC /etc/localtime

reflector
#sed -i 's|#Server https://ftp.halifax|Server https://ftp.halifax|g' /etc/pacman.d/mirrorlist

sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

systemctl enable pacman-init.service choose-mirror.service

if [ ! -d /root ]; then
  mkdir /root
  chmod 700 root && chown -R root:root /root
fi

echo "root:anzu" | chpasswd

cp -r /etc/skel/. /root/.

pacman -Syyu --noconfirm
pacman-key --init
pacman-key --populate blackarch archlinux
pacman -Fyy
pacman-db-upgrade
updatedb
#pkgfile -u
sync

chsh -s /bin/bash

echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf

## remove special (not needed) scripts
#rm -f /etc/systemd/system/getty@tty1.service.d/autologin.conf
#rm -f /root/{.automated_script.sh,.zlogin}
##rm /etc/mkinitcpio-archiso.conf
#rm -rf /etc/initcpio

## add install.txt file
#echo "Type blackarch-install and follow the instructions." > /root/INSTALL
#rm -rf /root/install.txt

# /etc
#echo 'Anzu' > /etc/arch-release
