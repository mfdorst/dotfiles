#===--------------------------------------------------------------------------------------------===#
#=== Oh-My-Zsh configuration (user settings are further down - do not set them here)
#===--------------------------------------------------------------------------------------------===#

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Oh-My-Zsh theme
ZSH_THEME='robbyrussell'

# To switch to the spaceship prompt, do:
# echo spaceship > $HOME/.zshrc.theme

# Load custom OMZ theme
if [[ -e "$HOME/.zshrc.theme" ]]; then
    ZSH_THEME=$(cat "$HOME/.zshrc.theme")
fi

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git heroku rust cargo ruby)

source $ZSH/oh-my-zsh.sh

#===--------------------------------------------------------------------------------------------===#
#=== User configuration
#===--------------------------------------------------------------------------------------------===#

# How many lines of history to keep in memory
HISTSIZE=10000
# How many lines to keep in the history file
SAVEHIST=1000000000

 # Apply custom theme settings
# SPACESHIP_VI_MODE_INSERT=
# SPACESHIP_VI_MODE_SUFFIX=
# SPACESHIP_VI_MODE_NORMAL="[V] "
SPACESHIP_USER_COLOR=green
SPACESHIP_USER_SHOW=always
# SPACESHIP_DIR_TRUNC_PREFIX=".../"
# SPACESHIP_CHAR_SYMBOL_ROOT="#"
# SPACESHIP_CHAR_SYMBOL="$"
# SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_CONDA_SHOW=false

# Get rid of all the aliases OMZ adds
unalias -m '*'

#
# Aliases
#

#
# Git
#

# Use hub instead of git when available
if command -v hub &> /dev/null; then
    alias git='hub'
fi

alias g='git'

# Status
alias gs="git status -su"

# Fetch all, prune, and pull
alias gp="git fetch --all --prune && git pull"

# Checkout
alias gco="git checkout"

# Stash
alias gst="git add . && git stash"

# Reset
alias gr="git reset"
alias grh="git reset --hard"
alias grah="git add . && git reset --hard"

# Branch
alias gb="git branch"
alias gba="git branch --all"
alias gbm="git branch --merged"

# Delete merged branches
alias gbdm='git branch --color=never --merged | grep -vE "\*|master" | xargs git branch -d'

# Commit
alias gc="git commit"
alias gca="git add . && git commit"

# Add
alias ga="git add"
alias gaa="git add ."

# Diff
alias gd="git diff"
alias gds="git diff --stat"

# Log
alias gl="git log --oneline --graph"
alias gla="git log --oneline --graph --branches --remotes --tags HEAD"
alias gll="git log --graph"
alias glla="git log --graph --branches --remotes --tags HEAD"

#
# Utility
#

# Clear screen
alias cs="clear && printf '\e[3J'"

# Make a directory and cd into it
mcd()
{
    test -d "$1" || mkdir "$1" && cd "$1"
}

export LANG=en_US.UTF-8

# Disable bell
unsetopt BEEP

# Set default editor to vim
export VISUAL='vim'
export EDITOR='vim'

# Load platform specific rc files
if [[ -e "$HOME/.zshrc.macos" ]]; then
    source "$HOME/.zshrc.macos"
fi

if [[ -e "$HOME/.zshrc.linux" ]]; then
    source "$HOME/.zshrc.linux"
fi

# Load local rc
if [[ -e "$HOME/.zshrc.local" ]]; then
    source "$HOME/.zshrc.local"
fi

# Rust/Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# LLVM
export PATH="/usr/local/opt/llvm/bin:$PATH"

# Anaconda
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# pyenv

export PATH="$HOME/.pyenv/bin:$PATH"

if command -v pyenv &> /dev/null; then
    eval "$(pyenv init -)"
fi

# rbenv
if command -v rbenv &> /dev/null; then
    eval "$(rbenv init -)"
fi
