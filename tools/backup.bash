#!/bin/bash

source ~/.dotfiles/tools/lib/base.bash
source_dotool lib/dot

cprint "Backup dotfiles" $UNDERLINE
cd "$DOT_DIR"
export GIT_{AUTHOR,COMMITTER}_NAME='dotsetup'
export GIT_{AUTHOR,COMMITTER}_EMAIL='dotsetup@example.com'
git stash >/dev/null 2>&1
git checkout master >/dev/null 2>&1

# create branch
BACKUP_BRANCH="backup/$(date +'%Y%m%d%H%M%S')"
printf ' Creating backup branch...'
git checkout --orphan "$BACKUP_BRANCH" >/dev/null 2>&1
cprint 'done' $CYAN_B
cprintf '  Backup branch: ' $COLOR_75_B
echo "$BACKUP_BRANCH"

# commit
printf ' master'
cprintf ' -> ' $COLOR_93_B
print "$BACKUP_BRANCH"
printf ' '
git commit -m "backup dotfiles" | sed -n 2p
echo ' If you want to roll back, run the following command.'
echo "   $(cprintf '$' $COLOR_75_B) git -C "$DOT_DIR" checkout $BACKUP_BRANCH"

git checkout master >/dev/null 2>&1
git stash pop >/dev/null 2>&1
unset GIT_{AUTHOR,COMMITTER}_NAME GIT_{AUTHOR,COMMITTER}_EMAIL
cd - >/dev/null 2>&1
echo
