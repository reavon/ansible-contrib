#!/bin/bash

function get_gdm_config_status() {
    # Echo false for if it needs to be configured, true if it is how
    # you want it
    USERDISABLED=`sudo -u gdm gconftool-2 --get /apps/gdm/simple-greeter/disable_user_list`
    if [ $USERDISABLED != "true" ] ; then
        echo "FALSE"
    else
        echo "TRUE"
    fi
}

function set_gdm_configuration() {
    sudo -u gdm gconftool-2 --type bool --set /apps/gdm/simple-greeter/disable_user_list true
}

case "$1" in   
    status)
        get_gdm_config_status
    ;;
    set_config)
        set_gdm_configuration
    ;;
    *)
        echo "Unconfigured action."
    ;;
esac
