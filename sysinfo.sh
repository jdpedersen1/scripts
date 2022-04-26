#!/usr/bin/env bash

########################## !!! IMPORTANT NOTE !!! #############################
#                                                                             #
#  must run script one time from terminal using ./<path/to/script> to         #
#  generate the sysinfo.txt file for terminal to display, also if you use     #
#  the list_updates portion of the script, or create any other function that  #
#  displays any sort of data that changes, you will want to set the script    #
#  to run as a cronjob to verify the correct and current information is       #
#  displayed.                                                                 #
#                                                                             #
###############################################################################

### CHECKS WHICH DISTRO YOU ARE RUNNING
distro() {
    file='/etc/os-release'
    if [[ -f $file && -r $file ]]; then
        while IFS='=' read key value; do
            if [[ $key == NAME ]]; then
                printf '%s\n' "${value//\"/}"

                break
            fi
        done < "$file"
    else
        printf '?'
    fi
}

### CHECKS FOR INIT SYSTEM
### ADD YOUR OWN LINE IF YOU USE OTHER INIT SYSTEM
find_init() {
    if pidof systemd &> /dev/null; then
        printf 'SystemD'
    elif [[ -f /sbin/openrc ]]; then
        printf 'OpenRC'
    else
        file='/proc/1/comm'
        if [[ -r $file ]]; then
            read data < "$file"
            printf '%s' "${data%% *}"
        else
            printf '?'
        fi
    fi
}

### COUNTS NUMBER OF INSTALLED PACKAGES FOR APT PACMAN AND XBPS
### ADD YOUR OWN LINE IF YOUR MANAGER IS NOT LISTED
pkg_count() {
    for pkg_mgr in xbps-install apt pacman; do
        type -P "$pkg_mgr" &> /dev/null || continue

        case $pkg_mgr in
            xbps-install)
                xbps-query -l | wc -l ;;
            apt)
                while read abbrev _; do
                    [[ $abbrev == ii ]] && (( line_count++ ))
                done <<< "$(dpkg -l)"
                printf '%d' $line_count ;;
            pacman)
                readarray lines <(pacman -Q)
                printf '%d' ${#lines[*]} ;;
        esac
        return
    done
    printf 'Not Found'
}

### CHECKS FOR NUMBER OF UPDATES, ONLY SET UP TO RUN ON VOID
### EDIT LINES FOR APT OR PACMAN OR ADD YOUR OWN LINES FOR OTHER MANAGERS
list_updates() {
    for pkg_mgr in xbps-install apt pacman; do
        type -P "$pkg_mgr" &> /dev/null || continue

        #TODO: Unfinished. May need to add code for each package manager.
        case $pkg_mgr in
            xbps-install)
                readarray lines <(xbps-install -nuM)
                printf '%d' ${#lines[*]} ;;
            apt)
                printf '?' ;;
            pacman)
                printf '?' ;;
        esac
        return
    done
    printf 'Not Found'
}

### CHECKS WHICH VERSION OF ZSH IS RUNNING, CHANGE FOR BASH OR OTHER SHELLS
shell() {
    if type -P bash &> /dev/null; then
        bash -c "printf '%s' \"$BASH_VERSION\""
    elif type -P zsh &> /dev/null; then
        zsh -c "printf '%s' \"$ZSH_VERSION\""
    else
        printf '?'
    fi
}

{
    printf ' [ LSB: %s ] ' "$(distro)"
    printf '[ Init: %s ] ' "$(find_init)"
    printf '[ Shell: %s ] ' "$(shell)"
    printf '[ PKGs: %s ]' "$(pkg_count)"
} > .local/share/sysinfo.txt
