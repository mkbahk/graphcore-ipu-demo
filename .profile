# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Graphcore Poplar Library Enable by Moon-Kee Bahk
export TF_POPLAR_FLAGS=--executable_cache_path=/home/$USER/tmp/
export TMPDIR=/home/$USER/tmp/
#source /home/$USER/poplar_sdk-ubuntu_18_04-1.3.0+272-e24ae395db/gc_kernel-module-ubuntu_18_04-1.0.45+3775-58265f3c37/pkg/driver_load.sh
source /home/$USER/poplar_sdk-ubuntu_18_04-1.3.0+272-e24ae395db/poplar-ubuntu_18_04-1.3.36+42067-d79747d7ca/enable.sh
source /home/$USER/poplar_sdk-ubuntu_18_04-1.3.0+272-e24ae395db/popart-ubuntu_18_04-1.3.35+1943-3fa17782be/enable.sh
