# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# CONFIG DEFAULT ARTIX
# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
setopt autocd beep extendedglob nomatch notify
# setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/syuhendar/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# Use powerline
USE_POWERLINE="true"

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin master'
alias ls="ls --color=auto"
# My alias
alias cls="clear"
alias nf="neofetch"
alias ntr="vim -c NERDTree"
alias sn="shutdown now"
alias rswapvim="rm $HOME/.cache/vim/swap/*"
alias rswapnvim="rm $HOME/.local/state/nvim/swap/*"
alias mc="musikcube"
alias lsblkme="lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL"
alias cpuf="cat /proc/cpuinfo"
# open with vim
alias cvim="nvim ~/.vim/vimrc"
alias czsh="nvim ~/.zshrc"
alias ctmux="nvim ~/.tmux.conf"
alias cnvim="nvim ~/.config/nvim/init.vim"
# cd
alias cfg="cd ~/.config"
alias lc="cd ~/.local"
# alias gh="cd ~/.gh"
alias cst="cd ~/.suckless/my-st"
alias cdwm="cd ~/.suckless/my-dwm"
alias bjs="cd ~/MyProgram/JavaScript/"
alias suck="cd ~/.suckless"
alias srv="cd /srv/http"
alias lcb="cd ~/.local/bin"
alias bnj="cd ~/MyProgram/belajar-nodejs"
alias mpr="cd ~/MyProgram"
alias cdot="cd ~/public-dotfiles"
alias bcpp="cd ~/MyProgram/belajar-cpp"
alias bpy="cd ~/MyProgram/belajar-py"
alias prk="cd ~/MyProgram/belajar-cpp/PraktikumAlpro"
alias tm="tmux -2"
alias alpro="cd ~/MyProgram/belajar-cpp/Alpro2"
alias asulah="cd ~/MyProgram/blog-pelampiasan/"
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
alias pclist="LC_ALL=C pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h"
# yay
alias yayallbrowse="yay -Slq | fzf --preview 'yay -Si {}' --layout=reverse"
# service
alias rchr="sudo systemctl restart chronyd"
alias hbr="systemctl hibernate"
alias ochr="sudo chronyc online"

# -- global aliases --
alias -g gp="grep"

# -- suffix aliases --
alias -s txt=nvim
alias -s js=nvim
alias -s py=nvim
alias -s json=nvim

# archcraft
alias btr="acpi -b"
alias png="ping -c 5 google.com"
alias srvgem="ssh admin@103.172.204.225"
alias scr="~/Downloads/scrivano/Scrivano.sh"

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

ytdl(){
	echo 'Masukkan url : '
	read url 
	echo 'Kualitas : '
	read quality
	youtube-dl "$url" -f "(mp4,webm)bestvideo[height<=$quality]+bestaudio/best[height<=$quality]" -o '%(title)s-%(resolution)s.%(ext)s' 
}

cmp(){
	NamaFile=$(basename -s .cpp $1);
    g++ $1 -o $NamaFile;
	./$NamaFile;
}
c(){
	./$1;
}

nmc(){
	cd /etc/NetworkManager/system-connections
}

rec(){
	ffmpeg -f x11grab -video_size 1366x768 -framerate 25 -i $DISPLAY -c:v libx264 -preset ultrafast -c:a aac $HOME/Video/ffmpeg/$1.mp4
}

recaud(){
	# namaFile=$(vared -p 'Masukkan Nama File : ' -c tmp)
	ffmpeg -f x11grab -video_size 1366x768 -framerate 25 -i $DISPLAY -f alsa -i default -c:v libx264 -preset ultrafast -c:a aac $HOME/Video/ffmpeg/$1.mp4
}

comp(){
	ffmpeg -i $1 -vcodec libx265 -crf 28 $2
}

# convert(){
#
# }
# Solved glsl version alacritty not support
# export LIBGL_ALWAYS_SOFTWARE=1 alacritty
# LS_COLORS=$LS_COLORS:'ow=1;34:' ; export LS_COLORS

# Set up Node Version Manager
# source /usr/share/nvm/init-nvm.sh


# export LC_ALL=en_US.UTF-8
# export TERM=xterm-256color

# export PROMPT="%T %B%~%b"$'\n'"$ "

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


source ~/powerlevel10k/powerlevel10k.zsh-theme

# PATH=$PATH:~/.local/bin

# # start typing + [Up-Arrow] - fuzzy find history forward
# if [[ "${terminfo[kcuu1]}" != "" ]]; then
#     autoload -U up-line-or-beginning-search
#     zle -N up-line-or-beginning-search
#     bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
# fi
# # start typing + [Down-Arrow] - fuzzy find history backward
# if [[ "${terminfo[kcud1]}" != "" ]]; then
#     autoload -U down-line-or-beginning-search
#     zle -N down-line-or-beginning-search
#     bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
# fi

