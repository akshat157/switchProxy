#!/bin/sh
# Created by - Akshat Malviya, Feb 23 2019
# This script helps quickly toggle between proxy settings for a local network. I made it for my college's WiFi network.

curr_mode=$(gsettings get org.gnome.system.proxy mode)
curr_proxy=$(gsettings get org.gnome.system.proxy.https host)


if [ $curr_mode = "'manual'" ] && [ $curr_proxy = "'10.8.0.1'" ] 
then
    echo 'Switching proxy to "none".'
    gsettings set org.gnome.system.proxy mode 'none'
    
    notify-send --urgency=critical --expire-time=500 switchProxy "Proxy switched to 'none'."

elif [ $curr_mode = "'manual'" ] && [ $curr_proxy = "''" ] 
then
    echo 'Switching proxy to "none".'
    gsettings set org.gnome.system.proxy mode 'none'
    
    notify-send --urgency=critical --expire-time=500 switchProxy "Proxy switched to 'none'."

elif [ $curr_mode = "'none'" ]
then
    echo 'Switching proxy to "10.7.0.1:8080".'

    gsettings set org.gnome.system.proxy mode 'manual'
    gsettings set org.gnome.system.proxy.https host '10.7.0.1'
    gsettings set org.gnome.system.proxy.https port '8080'
    gsettings set org.gnome.system.proxy.http host '10.7.0.1'
    gsettings set org.gnome.system.proxy.http port '8080'
    gsettings set org.gnome.system.proxy.ftp host '10.7.0.1'
    gsettings set org.gnome.system.proxy.ftp port '8080'    
    
    notify-send --urgency=critical --expire-time=500 switchProxy "Proxy switched to '10.7.0.1:8080'"
    
elif [ $curr_proxy = "'10.7.0.1'" ]
then 
    echo 'Switching proxy to "10.8.0.1:8080".'
    
    gsettings set org.gnome.system.proxy mode 'manual'
    gsettings set org.gnome.system.proxy.https host '10.8.0.1'
    gsettings set org.gnome.system.proxy.https port '8080'
    gsettings set org.gnome.system.proxy.http host '10.8.0.1'
    gsettings set org.gnome.system.proxy.http port '8080'
    gsettings set org.gnome.system.proxy.ftp host '10.8.0.1'
    gsettings set org.gnome.system.proxy.ftp port '8080'
    
    notify-send --urgency=critical --expire-time=500 switchProxy "Proxy switched to '10.8.0.1:8080'."
fi
