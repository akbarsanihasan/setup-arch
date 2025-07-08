#---------- Options ----------#
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

autoload -Uz compinit
compinit


#---------- Keybinds ----------#
tsessionaizer() {
    zle -I
    BUFFER="$HOME/.local/bin/tmux_sessionaizer"
    zle accept-line
}
zle -N tsessionaizer

tsessionaizer_global() {
    zle -I
    BUFFER="$HOME/.local/bin/tmux_sessionaizer global"
    zle accept-line
}
zle -N tsessionaizer_global

tsessionaizer_main() {
    zle -I
    BUFFER="$HOME/.local/bin/tmux_sessionaizer main"
    zle accept-line
}
zle -N tsessionaizer_main

bindkey -e
if [[ -z $TMUX ]]; then
    bindkey "^B;" tsessionaizer
    bindkey "^B/" tsessionaizer_global
    bindkey "^B'" tsessionaizer_main
fi

zle -N _git-diff
bindkey '^Xd' _git-diff



#---------- Export vars ----------#
export FZF_DEFAULT_OPTS="--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
    --prompt '󰭎 ' --pointer ' ' --layout=reverse --border top \
    --multi"
if command -v nvim &>/dev/null; then
    export VISUAL=nvim
    export EDITOR=nvim
fi

#---------- Aliases ----------#
if command -v trash-put &>/dev/null; then
    alias rm='trash-put -v'
fi
if command -v fdfind &>/dev/null; then
    alias fd="fdfind"
fi


#---------- Plugins ----------#
ZINIT_HOME="${ZINIT_HOME:-${XDG_DATA_HOME:-${HOME}/.local/share}/zinit}"
if [[ ! -f ${ZINIT_HOME}/zinit.git/zinit.zsh ]]; then
    print -P "%F{14}▓▒░ Installing ZSH plugin manager %F{13}(zinit)%f"
    command mkdir -p "${ZINIT_HOME}" && command chmod g-rwX "${ZINIT_HOME}"
    command git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT_HOME}/zinit.git" &&
        print -P "%F{10}▓▒░ Installation successful.%f%b" ||
        print -P "%F{9}▓▒░ The clone has failed.%f%b"
fi
source "${ZINIT_HOME}/zinit.git/zinit.zsh"

zinit ice blockf 
zinit light zsh-users/zsh-completions

zinit light zdharma-continuum/fast-syntax-highlighting 

zinit ice atinit"zstyle ':fzf-tab:*' fzf-flags $FZF_DEFAULT_OPTS"
zinit light Aloxaf/fzf-tab

zinit snippet OMZL::directories.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::async_prompt.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZL::theme-and-appearance.zsh
zinit snippet OMZT::robbyrussell
zinit snippet OMZP::common-aliases
zinit snippet OMZP::archlinux


#---------- Path ----------#
export PATH="$HOME/.local/bin:$PATH"
# NodeJS
export NPM_CONFIG_CACHE=$HOME/.node
export NPM_CONFIG_PREFIX=$HOME/.node
if command -v fnm &>/dev/null || command -v /usr/local/bin/fnm &>/dev/null; then
   eval "$(fnm env --fnm-dir "$HOME"/.node)"
fi
# Golang
export PATH="/opt/go/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
# PHP
export PATH="/opt/php/bin:$PATH"
export PHP_INI_SCAN_DIR="/opt/php:$PHP_INI_SCAN_DIR"
# Rust
[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
