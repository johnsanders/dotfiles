# .bashrc
export PS1="\t \w \\$ \[$(tput sgr0)\]"
export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias tmux="tmux -2"
alias wx="curl wttr.in/london"
alias killdns="sudo killall -HUP mDNSResponder"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Bash completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jsanders/google-cloud-sdk/path.bash.inc' ]; then . '/Users/jsanders/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jsanders/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/jsanders/google-cloud-sdk/completion.bash.inc'; fi
