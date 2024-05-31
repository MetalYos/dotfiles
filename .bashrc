#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Add arm gnu toolchain to PATH
export PATH="/opt/arm-gnu-toolchain-13.2.Rel1-aarch64-arm-none-eabi/bin:$PATH"

# Add pico sdk environment variables
export PICO_SDK_PATH=~/pico/pico-sdk
