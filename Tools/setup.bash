#!/bin/bash
menu() {
    PS3="> "
    ans1="Update"
    ans2="Backup"
    ans3="Deploy"
    ans4="Reinstall"
    ans5="Uninstall"
    ans6="Exit"

    echo "Menu"
    #echo "実行したい処理を数字で指定してください"
    select ANS in "$ans1" "$ans2" "$ans3" "$ans4" "$ans5" "$ans6"; do
        case $REPLY in
            1)
                source ~/.dotfiles/Tools/update.bash
                break
                ;;
            2)
                source ~/.dotfiles/Tools/backup.bash
                break
                ;;
            3)
                source ~/.dotfiles/Tools/deploy.bash
                break
                ;;
            4)
                source ~/.dotfiles/Tools/reinstall.bash
                break
                ;;
            5)
                source ~/.dotfiles/Tools/uninstall.bash
                break
                ;;
            6)
                echo -e "exit\n"
                exit 0
                ;;
            *)
                echo -e "\e[1;31mError\e[m\n"
                #echo "範囲内の数字を入力してください"
                menu
                ;;
        esac
    done
}

if [ "$1" = "--update" ]; then
    source ~/.dotfiles/Tools/update.bash
elif [ "$1" = "-b" ]; then
    source ~/.dotfiles/Tools/backup.bash
elif [ "$1" = "-d" ]; then
    source ~/.dotfiles/Tools/deploy.bash
elif [ "$1" = "-r" ]; then
    source ~/.dotfiles/Tools/reinstall.bash
elif [ "$1" = "--uninstall" ]; then
    source ~/.dotfiles/Tools/uninstall.bash
elif [ "$1" = "" ]; then
    menu
else
    echo -e "\e[1;31mError\e[m\n"
    exit 1
fi