# Lines of history to keep in memory
HISTSIZE=1000000
# Lines of history to keep in the history file
SAVEHIST=1000000

# Import abbreviation plugin
source $HOME/.config/zsh/abbr.zsh

# Abbreviations

## Cargo
abbr c='cargo'
abbr cb='cargo build'
abbr cbr='cargo build --release'
abbr ccl='cargo clippy'
abbr cr='cargo run'
abbr crr='cargo run --release'
abbr ct='cargo test'

## Eza
if command -v eza &> /dev/null; then
    abbr l="eza --git -l"
    abbr la="eza --git -al"
    abbr lt="eza --git -lTL2"
    abbr lt3="eza --git -lTL3"
    abbr lt4="eza --git -lTL4"
    abbr lta="eza --git -laTL2"
    abbr lta3="eza --git -laTL3"
    abbr lta4="eza --git -laTL4"
else
    abbr l="ls -l"
    abbr la="ls -la"
fi

## Git
abbr g="git"
abbr gs="git status -su"
abbr ga="git add"
abbr gaa="git add -A"
abbr gc="git commit"
abbr gca="git add -A && git commit"
abbr gco="git checkout"
abbr gcb="git checkout -b"
abbr gst="git stash"
abbr gd="git diff"
abbr gdw="git diff --word-diff=color"
abbr gds="git diff --stat"
abbr gl="git log --oneline --graph"
abbr gla="git log --oneline --graph --branches --remotes --tags HEAD"
abbr gll="git log --graph"
abbr gb="git branch"
abbr gr="git reset"
abbr grh="git reset --hard"
abbr grah="git add -A && git reset --hard"

## Lazygit
abbr lg="lazygit"

## Tmux
abbr ta="tmux new -As"

## Other
abbr cls="clear; printf '\e[3J'"

# Functions

# Make a directory and cd into it
mcd()
{
    test -d "$1" || mkdir -p "$1" && cd "$1"
}
