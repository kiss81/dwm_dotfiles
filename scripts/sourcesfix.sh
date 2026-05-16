#!/bin/bash

# For Mozilla sources file
sudo sed -i '/^Signed-By:/d; $a Signed-By: /etc/apt/trusted.gpg.d/mozilla-archive-keyring.gpg' /etc/apt/sources.list.d/mozillateam.sources

# For Ubuntusway Dev sources file
sudo sed -i '/^Signed-By:/d; $a Signed-By: /etc/apt/trusted.gpg.d/ubuntusway-dev-keyring.gpg' /etc/apt/sources.list.d/ubuntusway.sources

sudo mkdir -p /etc/apt/keyrings

sudo rm /etc/apt/trusted.gpg.d/ubuntusway-dev-keyring.gpg
sudo gpg --homedir /tmp --no-default-keyring --keyring /etc/apt/keyrings/ubuntusway-dev-stable.gpg --keyserver keyserver.ubuntu.com --recv-keys 7619AC61A255D84A   

# Remove the ASCII key
sudo rm /etc/apt/trusted.gpg.d/mozilla-archive-keyring.gpg

# Re-add in binary format
sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/mozilla-archive-keyring.gpg
wget -qO- https://packages.mozilla.org/apt/repo-signing-key.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/mozilla-archive-keyring.gpg

# For Ubuntusway Dev key (replace with correct key ID if needed)
sudo rm /etc/apt/trusted.gpg.d/ubuntusway-dev-keyring.gpg
sudo gpg --keyserver keyserver.ubuntu.com --recv-keys 7619AC61A255D84A
sudo gpg --export 7619AC61A255D84A | sudo tee /etc/apt/trusted.gpg.d/ubuntusway-dev-keyring.gpg > /dev/null   

