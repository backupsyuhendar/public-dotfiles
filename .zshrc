# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
#if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#  source /usr/share/zsh/manjaro-zsh-prompt
#fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.hist_zshrc
HISTSIZE=10000
SAVEHIST=10000
bindkey -e

# 
# Tips and Trick - arch wiki
autoload -Uz add-zsh-hook
function reset_broken_terminal () {
			printf '%b' '\e[0m\e(B\e)0\017\e[?5l\e7\e[0;0r\e8'
	}

add-zsh-hook -Uz precmd reset_broken_terminal

source ~/.powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet



# export LESS_TERMCAP_mb=$'\e[1;32m'
# export LESS_TERMCAP_md=$'\e[1;32m'
# export LESS_TERMCAP_me=$'\e[0m'
# export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
# export LESS_TERMCAP_ue=$'\e[0m'
# export LESS_TERMCAP_us=$'\e[1;4;31m'
# source <(npx --shell-auto-fallback zsh)


alias ls="ls --color=auto"
# My alias
alias cls="clear"
alias nf="neofetch"
alias ntr="vim -c NERDTree"
alias sn="shutdown now"
alias rswapvim="rm /home/dar729/.cache/vim/swap/*"
alias mc="musikcube"
alias lsblkme="lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL"
alias cpuf="cat /proc/cpuinfo"
# open with vim
alias cvim="vim ~/.vim/vimrc"
alias czsh="vim ~/.zshrc"
alias ctmux="vim ~/.tmux.conf"
alias cnvim="nvim ~/.config/nvim/init.vim"
# cd
alias cfg="cd ~/.config"
alias lc="cd ~/.local"
alias gh="cd ~/.gh"
alias cst="cd ~/.suckless/my-st"
alias cdwm="cd ~/.suckless/my-dwm"
alias bjs="cd ~/MyProgram/JavaScript/js-advanced/"
alias suck="cd ~/.suckless"
alias srv="cd /srv/http"
alias lcb="cd ~/.local/bin"
alias bnj="cd ~/MyProgram/belajar-nodejs"
alias mpr="cd ~/MyProgram"
alias cdot="cd ~/Destop/dotfiles"
#git
alias gr="git log --all --decorate --oneline --graph"
alias gts="git status"
# build
alias cpc="cp config.def.h config.h"
alias mci="make clean install"
alias xrx="xrdb ~/.Xresources"
# docker
alias dcstart="sudo systemctl start docker"
alias dcstop="sudo systemctl stop docker"
alias dcstatus="systemctl status docker"
alias dcimg="docker images"
alias dcls="docker container ls"
alias dclsall="docker container ls --all"
alias startmongo="docker container start mongo"
alias stopmongo="docker container stop mongo"
alias mongodb="docker exec -it mongo /bin/bash"
# pacman
alias pclast="expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n 20"
alias pcbrowse="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
alias pcallbrowse="pacman -Slq | fzf --preview 'pacman -Si {}' --layout=reverse"
alias pcinstall="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -Sy"
alias pcremove="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
alias pcinstalldetail="pacman -Slq | fzf --multi --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk "{print \$2}")' | xargs -ro sudo pacman -S"
# yay
alias yayallbrowse="yay -Slq | fzf --preview 'yay -Si {}' --layout=reverse"
# service
alias rchr="sudo systemctl restart chronyd"
alias hbr="systemctl hibernate"

# -- global aliases --
alias -g gp="grep"

# -- suffix aliases --
alias -s txt=nvim
alias -s js=vim
alias -s py=vim
alias -s json=nvim

# -- param alias --
srcman() {
	man $1 | grep -- $2
}


git-svn(){
  if [[ ! -z "$1" && ! -z "$2" ]]; then
          echo "Starting clone/copy ..."
          repo=$(echo $1 | sed 's/\/$\|.git$//')
          svn export "$repo/trunk/$2"
  else
          echo "Use: git-svn <repository> <subdirectory>"
  fi
}

npmgi(){
	npm -g install "$1" --prefix ~/.local
}
