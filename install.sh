#!/bin/bash -e

echo "#### Adding PPAs"
while read ppa; do
sudo add-apt-repository $ppa
done < ppas.txt

echo "#### Installing packages"
sudo apt-get update
declare -a packages
readarray packages < packages.txt
sudo apt-get install ${packages[*]}

echo "#### Configure grub to use console mode"
sudo patch /etc/default/grub < grub-config.patch
sudo update-grub

echo "#### Configure imwheel to start with X"
sudo patch /etc/X11/imwheel/startup.conf < imwheel-config-start-with-Xsession.patch

echo "#### Configure default Java"
sudo update-java-alternatives -s java-8-oracle

echo "#### Now, you should run these parts manually:"
cat manual.txt
