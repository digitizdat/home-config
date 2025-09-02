

set -o vi

# This prompt function keeps the prompt trimmed to the cwd, but maintains the
# information of you whether you're in a directory under your home dir or not.
ps1_prompt() {
  typeset -i _p_tilde=0
  typeset -i _p_longpath=0
  typeset _p_oifs
  typeset _p_dirs
  typeset _p_path=''

  # Is $HOME part of our path?
  [[ "${PWD:0:${#HOME}}" == "${HOME}" ]] && _p_tilde=1 || _p_tilde=0

  # Are we more than one level deep, not including $HOME?
  _p_oifs=${IFS}  # Save the old field separator to restore later
  IFS=$'/'
  _p_dirs=(${PWD#${HOME}})
  ((${#_p_dirs[@]} > 2)) && _p_longpath=1 || p_longpath=0
  IFS=${_p_oifs}

  # Five possible cases
  if [[ ${HOME} == ${PWD} ]]; then echo -n "~- "
  elif ((_p_tilde && _p_longpath)); then echo -n "~/../${PWD##*/}- "
  elif ((_p_tilde && _p_longpath == 0)); then echo -n "~${PWD#${HOME}}- "
  elif ((_p_tilde == 0 && _p_longpath)); then echo -n "../${PWD##*/}- "
  elif ((_p_tilde == 0 && _p_longpath == 0)); then echo -n "${PWD}- "
  fi
}

export PS1=
export EDITOR=vim

alias vi=vim
alias tf='terraform'
alias 1='fg %1'
alias 2='fg %2'
alias 3='fg %3'
alias 4='fg %4'
alias ipy='ipython --no-confirm-exit'
alias bc='bc -l ~/.bclib'

# Disable those pesky sessions
#touch ~/.bash_sessions_disable
export HISTSIZE=999999
export HISTFILESIZE=99999999

# Install Brew
export HOMEBREW_NO_ANALYTICS=1

# Install Anaconda
conda activate dev38

# Install awscli
complete -C '/Users/mmmcgrea/anaconda3/envs/dev38/bin/aws_completer' aws
export AWS_DEFAULT_REGION=us-east-2

width=$(tput cols)
[ -r ~/.todo ] && cat ~/.todo |while read line; do
    figlet -w ${width} "TODO: ${line}"
done

function bell
{
    usage="usage: bell [seconds] [message]"

    # Test for empty $1
    [[ "$1" == "" ]] && seconds=0

    # Test for integer argument
    if [[ ! "$1" =~ ^[0-9]+$ && "$1" != "" ]]; then
      echo ${usage}
      return 1
    fi

    term=$(ps -p $$ -o tty=)
    [[ "$1" != "" ]] && seconds=$1 || seconds=0
    (
      sleep ${seconds} &&                            \
      figlet -w ${_t_width} "$2" >> /dev/${term} &&  \
      echo -e "\a" > /dev/${term} &
    )
}

aws_profile() {
    profile_name=""
    if [[ -n "$AWS_DEFAULT_PROFILE" ]]; then
        profile_name="$AWS_DEFAULT_PROFILE"
    elif [[ -n "$AWS_PROFILE" ]]; then
        profile_name="$AWS_PROFILE"
    fi
    if [[ -n "$profile_name" ]]; then
        echo -n " $profile_name "
    fi
}
export PS1="\[\033[30;48;5;208m\]\$(aws_profile)\[\033[0m\]${PS1}\$(ps1_prompt)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mmmcgrea/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mmmcgrea/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/mmmcgrea/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mmmcgrea/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


alias isort='ruff check --select I --fix'

# Bat also works well for this nowadays...
alias pycat='pygmentize -O paraiso-dark'
function pcat
{
    pycat $1 |nl -ba
}

# Python checking/formatting
function bark
{
    ruff check --select I --fix $1
    ruff format $1
}
