#!/bin/bash

printf "Are you sure you want to continue (yes/no)? "
read ANSWER

case $ANSWER in
    "Y" | "y" | "Yes" | "yes" )
        export ASSUME_YES="1"
        source ~/.dotfiles/tools/uninstall.bash
        printf "Downloading installer..."
        if [ $(which curl) ]; then
            export LESS="-cE"; { sleep 1; curl -o ~/j4ve1in_dotfiles_install.bash -L dot.j4ve1in.com; } | less
        elif [ $(which wget) ]; then
            export LESS="-cE"; { sleep 1; wget -O ~/j4ve1in_dotfiles_install.bash dot.j4ve1in.com; } | less
        fi
        echo -e "\033[1;36mdone\033[0;39m"
        source ~/j4ve1in_dotfiles_install.bash
        rm -f ~/j4ve1in_dotfiles_install.bash
        export ASSUME_YES=""
        echo -e "Reinstalled\n"
        ;;
    * )
        ;;
esac

exit 0