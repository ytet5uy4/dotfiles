# Load
## ~/.zsh/rc/*.zsh
### Plugin
[ "$OSTYPE" != "cygwin" ] && ZRC=("plugins")
### Others
ZRC+=(
  'aliases'
  'base'
  'completion'
  'history'
  'prompt'
  'local'
)
for file in ${ZRC[@]}; do
  file=~/.zsh/rc/${file}.zsh
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done; unset -v ZRC file

## ~/.sh/*.sh
INIT_SH=~/.sh/init.sh
[ -r $INIT_SH ] && [ -f $INIT_SH ] && source $INIT_SH

# Profiling configuration files of zsh
# if (which zprof > /dev/null) ;then
#   zprof > ~/.zsh/.zprof_result | less ~/.zsh/.zprof_result
# fi