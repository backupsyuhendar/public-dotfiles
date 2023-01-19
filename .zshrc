# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="archcraft"
ZSH_THEME="jonathan"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME="archcraft"
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

# omz
alias zshconfig="geany ~/.zshrc"
alias ohmyzsh="thunar ~/.oh-my-zsh"

# ls
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -A'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'

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

# convert(){
#
# }
# Solved glsl version alacritty not support
# export LIBGL_ALWAYS_SOFTWARE=1 alacritty
LS_COLORS=$LS_COLORS:'ow=1;34:' ; export LS_COLORS

# Set up Node Version Manager
source /usr/share/nvm/init-nvm.sh


export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

# git account switch
source $HOME/.git-acc

# export PROMPT="%T %B%~%b"$'\n'"$ "
