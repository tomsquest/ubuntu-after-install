#!/bin/bash -e

echo "#### Adding PPAs"
while read ppa; do
sudo add-apt-repository --yes $ppa
done < ppas.txt

echo "#### Installing packages"
sudo apt-get update
declare -a packages
readarray packages < packages.txt
sudo apt-get install --yes ${packages[*]}

echo "#### Now, you should run these parts manually:"
cat manual.txt
