set -o vi

export PS1='\u@\h:\W- '

alias 1='fg %1'
alias 2='fg %2'
alias 3='fg %1'
alias 4='fg %4'
alias ipy='ipython --no-confirm-exit'

# Disable those pesky sessions
#touch ~/.bash_sessions_disable
export HISTSIZE=999999
export HISTFILESIZE=99999999

# Install Brew
export HOMEBREW_NO_ANALYTICS=1

# Install Anaconda
conda activate dev37

# Install awscli
complete -C '/Users/s0046656/anaconda3/envs/dev37/bin/aws_completer' aws
export AWS_DEFAULT_REGION=us-east-1

# Install Terraform and create links
alias tf='tf12'

