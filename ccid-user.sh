#!/bin/bash

cd ~

rm -rf ~/.gnupg

cat <<EOT >> ~/.bashrc
if [ ! -f /tmp/gpg-agent.env ]; then
    killall gpg-agent;
    eval $(gpg-agent --daemon --enable-ssh-support > /tmp/gpg-agent.env);
fi
. /tmp/gpg-agent.env

# ssh authentication component
source ${HOME}/.gnupg/gpg-agent-wrapper
EOT

HST=https://github.com/szquadri/linotes

rm -f gpg-1v2.pub
wget -c $HST/raw/master/gpg-1v2.pub

gpg2 --import gpg-1v2.pub

echo "use-agent" >> ~/.gnupg/gpg.conf
echo "enable-ssh-support" >> ~/.gnupg/gpg-agent.conf
wget -O ~/.gnupg/gpg-agent-wrapper $HST/raw/master/gpg-agent-wrapper && chmod +x ~/.gnupg/gpg-agent-wrapper

echo "ccid 2fa setup is done. re-login to make it effective"

