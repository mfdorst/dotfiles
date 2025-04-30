#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Append to the history file, don't overwrite it
shopt -s histappend

# Change window size if necessary
shopt -s checkwinsize

# Environment variables
HISTSIZE=10000
HISTFILESIZE=20000

# Environment exports
export EDITOR=lvim
export VISUAL=lvim

# Aliases

## Cargo
alias c="cargo"
alias cb="cargo build"
alias cbr="cargo build --release"
alias ccl="cargo clippy"
alias cr="cargo run"
alias crr="cargo run --release"
alias ct="cargo test"

## Eza
if command -v eza &> /dev/null; then
    alias l="eza --git -l"
    alias la="eza --git -al"
    alias lt="eza --git -lTL2"
    alias lt3="eza --git -lTL3"
    alias lt4="eza --git -lTL4"
    alias lt5="eza --git -lTL5"
    alias lta="eza --git -laTL2"
    alias lta3="eza --git -laTL3"
    alias lta4="eza --git -laTL4"
    alias lta5="eza --git -laTL5"
else
    alias l="ls -l"
    alias la="ls -la"
fi

## Git
alias g="git"
alias gs="git status -su"
alias ga="git add"
alias gaa="git add -A"
alias gb="git branch"
alias gc="git commit"
alias gca="git add -A && git commit"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gd="git diff"
alias gds="git diff --stat"
alias gdw="git diff --word-diff=color"
alias gl="git log --oneline --graph"
alias gla="git log --oneline --graph --branches --remotes --tags HEAD"
alias gll="git log --graph"
alias glla="git log --graph --branches --remotes --tags HEAD"
alias gr="git reset"
alias grh="git reset --hard"
alias grah="git add -A && git reset --hard HEAD"
alias gst="git stash"

## Lazygit
alias lg="lazygit"

## Tmux
alias ta="tmux new -As default"

## Other
alias cls="clear; printf '\e[3J'"

# Functions

## Make a directory and move into it
function mcd() {
    if [ $# -ne 1 ]; then
        echo "Usage: mcd <dir>"
        return
    fi
    mkdir -p $1
    if command -v zoxide &> /dev/null; then
        j $1
    else
        cd $1
    fi
}

# Path
export PATH="$HOME/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"

# Fallback prompt if starship is not installed
PS1='[\u@\h \W]\$ '

# Starship
if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi

# Zoxide
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init bash --cmd j)"
fi

# Pyenv
if command -v pyenv &> /dev/null; then
    eval "$(pyenv virtualenv-init -)"
fi

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# NPM
export PATH="~/.local/share/npm/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/me/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/me/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/me/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/me/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

