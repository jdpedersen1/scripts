#!/bin/bash

############################# !!! IMPORTANT NOTE !!! ###################################
#                                                                                      #
#  must run script one time from terminal using ./<path/to/script> to generate the     #
#  sysinfo.txt file for terminal to display, also if you use the list_updates portion  #
#  of the script, or create any other function that displays any sort of data that     #
#  changes, you will want to set the script to run as a cronjob to verify the correct  #
#  and current information is displayed.                                               #
#                                                                                      #
########################################################################################


### CHECKS WHICH DISTRO YOU ARE RUNNING
distro() {
    awk -F '"' '/PRETTY_NAME/ { print $2 }' /etc/os-release
}


### CHECKS FOR INIT SYSTEM
### ADD YOUR OWN LINE IF YOU USE OTHER INIT SYSTEM
find_init() { 
    if pidof -q systemd;
    then
        printf "SystemD"
    elif [ -f "/sbin/openrc" ];
    then
        printf "OpenRC"
    else 
        cut -d ' ' -f 1 /proc/1/comm
    fi
}


### COUNTS NUMBER OF INSTALLED PACKAGES FOR APT PACMAN AND XBPS
### ADD YOUR OWN LINE IF YOUR MANAGER IS NOT LISTED
pkg_count() {
    pkg_managers=("xbps-install
        apt
        pacman")
        for pkg_mgr in ${pkg_managers[@]}; do
            if command -v $pkg_mgr &> /dev/null; 
            then
                case "$pkg_mgr" in
                    xbps-install)
                        xbps-query -l | wc -l
                        ;;
                    apt)
                        apt list --installed &> /dev/null | wc -l
                        ;;
                    pacman)
                        pacman -Q | wc -l
                        ;;
                esac
                return
            fi
        done
        printf "Not Found"
    }


### CHECKS FOR NUMBER OF UPDATES, ONLY SET UP TO RUN ON VOID
### EDIT LINES FOR APT OR PACMAN OR ADD YOUR OWN LINES FOR OTHER MANAGERS
list_updates() {
   update_count=("xbps-install
      apt
      pacman")
     for updates in ${update_count[@]}; do 
        if command -v $updates &> /dev/null;
        then
           case "$updates" in
               xbps-install)
                  xbps-install -nuM | wc -l
                  ;;
              apt)
                 apt list --installed &> /dev/null | wc -l
                 ;;
             pacman)
                 printf "nope"
                 ;;
         esac
         return
        fi
    done
    printf "Not Found"
}


### CHECKS WHICH VERSION OF ZSH IS RUNNING, CHANGE FOR BASH OR OTHER SHELLS
shell() {
    zsh --version | awk '{ print $1, $2 }'
}

(printf " [ distro - "; distro; printf "] ["; printf "init sys - "; find_init; printf "] ["; printf "shell - "; shell; printf "] ["; printf "pkgs - "; pkg_count; printf "]") | tr '\n' ' ' > .local/share/sysinfo.txt
exit
