#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Add cargo to PATH
export PATH="$HOME/.cargo/bin:$PATH"

# Add github ssh commands
function git_ssh() {
    eval "$(ssh-agent -s)"
    ssh-add "$1"
}

# Start fastfetch if it is installed
if [ -x /usr/bin/fastfetch ]; then
    fastfetch
fi
