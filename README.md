# My Dotfiles

![Repo size](https://img.shields.io/github/repo-size/syuhendar729/public-dotfiles?label=Dotfiles%20Size&style=for-the-badge)


![Screenshot1](img/my-dwm1.png)
![Screenshot2](img/my-dwm2.png)
![Screenshot3](img/my-dwm3.png)

## Install
- clone this repo on your directory (this case in folder Desktop)
```sh
cd ~/Desktop
git clone https://github.com/syuhendar729/public-dotfiles mydot
cd mydot
```
- create simbolic link or syncroning to your config
```sh
ln -s /path/ke/asal /path/ke/tujuan
# contoh :
ln -s ~/Desktop/mydot/.vim/vimrc ~/.vim/vimrc

# or with rsync
rsync /path/to/asal /path/to/tujuan
# contoh :
rsync .vim/vimrc ~/.vim/vimrc
```
See also [My dwm configuration](https://github.com/syuhendar729/dwm "My dwm configuration").
