ssh-gpg-smartcard-config for yubikey-neo
========================================

Configuring Authentication with GNOME-Shell
-------------------------------------------


Configure GNOME-Shell to use gpg-agent and disable ssh-agent
-------------------------------------------------------

Turn off ssh-agent inside gnome-keyring-daemon::

  if [[ $(gconftool-2 --get /apps/gnome-keyring/daemon-components/ssh) != "false" ]]; then
    gconftool-2 --type bool --set /apps/gnome-keyring/daemon-components/ssh false
  fi

Configure GPG to use its agent (only for smartcard)::
```
  $ echo "use-agent" >> ~/.gnupg/gpg.conf
```
Enable ssh-agent drop in replacement support for gpg-agent::
```
  $ echo "enable-ssh-support" >> ~/.gnupg/gpg-agent.conf
```
Then, comment out the ``use-ssh-agent`` line in ``/etc/X11/XSession.options`` file.

Intercept gnome-keyring-daemon and put gpg-agent in place for ssh authentication (Fedora)
-------------------------------------------------------------------------------------

If running gnome, this problem may be solved by running the following to disable gnome-keyring from autostarting its broken gpg-agent and ssh-agent implementation::

  mv /etc/xdg/autostart/gnome-keyring-gpg.desktop /etc/xdg/autostart/gnome-keyring-gpg.desktop.inactive
  mv /etc/xdg/autostart/gnome-keyring-ssh.desktop /etc/xdg/autostart/gnome-keyring-ssh.desktop.inactive

Next, place the following in ``~/.bashrc`` to ensure gpg-agent starts with ``--enable-ssh-support``

```
    if [ ! -f /tmp/gpg-agent.env ]; then
        killall gpg-agent;
        eval $(gpg-agent --daemon --enable-ssh-support > /tmp/gpg-agent.env);
    fi
    . /tmp/gpg-agent.env
    # ssh authentication component
    source ${HOME}/.gnupg/gpg-agent-wrapper
```
Now go to next step (Reload GNOME-Shell) :)

Otherwise, there is another option:

A rather tricky part of this configuration is to have a simple wrapper script, called `gpg-agent-wrapper <http://blog.flameeyes.eu/2010/08/smart-cards-and-secret-agents>`_. This script is used with thanks from Diego E. Pettenò::
```
  wget -O ~/.gnupg/gpg-agent-wrapper https://raw.githubusercontent.com/zaidsoft/linscripts/master/gpg-agent-wrapper && chmod +x ~/.gnupg/gpg-agent-wrapper 
```
**NOTE:** The above code has been altered to allow the ``.gpg-agent-info`` to run after SSH_AUTH_SOCK. Please see the CREDITS section below for details.

The above **gpg-agent-wrapper** script is invoked using X and bash (or favorite shell). Please create the following files as below.


Reload GNOME-Shell So that the gpg-agent stuff above takes effect. Rebooting the machine works the best.
------------------





Verify SSH key is managed via gpg-agent
---------------------------------------

Assuming everything above is configured correctly, a simple test is performed with the SmartCard inserted::
```
  $ ssh-add -L
  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDL/XmU......BL0luE= cardno:00050000158A
```
FILES
-----

`The github repository <https://github.com/herlo/ssh-gpg-smartcard-config/>`_ contains all the files to make the changes above. Please feel free to read through them.

CREDITS
-------
Important portion of this document is taken/inspired from https://github.com/herlo/ssh-gpg-smartcard-config/blob/master/YubiKey_NEO.rst

A special thanks to the following people and/or links.
