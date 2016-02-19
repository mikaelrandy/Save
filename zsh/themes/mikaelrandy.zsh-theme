BASE_THEME="agnoster"

THEME_DIR=~/.oh-my-zsh/themes
THEME_FILE=$THEME_DIR/$BASE_THEME.zsh-theme

## Check dependencies
if [ -f $THEME_FILE ]; then
  . $THEME_FILE
else
  echo "This theme is based on $BASE_THEME theme and cannot work without it ($THEME_FILE is missing)" 1>&2
#  exit 1
fi


## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_virtualenv
  prompt_dir
  prompt_git
  prompt_hg
  prompt_end
}

PROMPT='%{%f%b%k%}$(build_prompt) '
