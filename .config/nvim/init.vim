
call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'preservim/nerdcommenter'
" Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'chun-yang/auto-pairs'
Plug 'tpope/vim-markdown'
Plug 'sainnhe/gruvbox-material'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'pangloss/vim-javascript'
" Plug 'jamespeapen/Nvim-R'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons' 
Plug 'ellisonleao/gruvbox.nvim'
Plug 'lambdalisue/suda.vim'
Plug 'nono/vim-handlebars'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
call plug#end()

" ### Lua Config ###
lua require('mylua.gruvbox')
lua require('mylua.coc')
lua require('mylua.treesitter')
lua require('mylua.lualine')
lua require("toggleterm").setup()


" ### System Config ###
" source /usr/share/nvim/archlinux.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif
if &t_Co > 2 || has("gui_running")
  set hlsearch
endif
augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
augroup END
if has('syntax') && has('eval')
  packadd! matchit
endif


" ### Neovim Plugin Config ###

" -- NERDTree --
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeDirArrows = 1
let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
	\ quit | endif
augroup NERD
	au!
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	autocmd VimEnter * wincmd p
augroup END



" --- NERDCommenter ---
filetype plugin on
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' }, 'ejs': {'left':'<!--', 'right':'--!>'} }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1


" --- UlstiSnips ---

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
" - :UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsExpandTrigger = '(\|\.\|:\|<tab>)'
" let g:UltiSnipsJumpForwardTrigger = '(\|\.\|:\|<c-b>)'
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
" Set UltiSnips expand trigger to include '('
" Set UltiSnips jump forward trigger to include '('



" ### My config ###
set number
set relativenumber
syntax on
set laststatus=2
set showtabline=2
set tabstop=4
set numberwidth=4
set shiftwidth=4
set t_Co=256
set mouse=a
set pastetoggle=<F3>
filetype on
set nu
set ruler
set encoding=UTF-8
" -- auto wrapping to new line --
" set textwidth=0
" set wrapmargin=1
" set formatoptions+=t
" set formatoptions-=l
set nobackup
set nowritebackup
set noshowmode
" -- 
" -- copy to clipboard system --
" vmap <C-c> :w !xclip -selection clipboard<CR>
" -- navigasi vim --
nnoremap gh <C-W><C-H>
nnoremap gj <C-W><C-J>
nnoremap gk <C-W><C-K>
nnoremap gl <C-W><C-L>
nmap <silent> <C-h> :vertical resize -3<CR>
nmap <silent> <C-l> :vertical resize +3<CR>
nmap <silent> <C-k> :res +3<CR>
nmap <silent> <C-j> :res -3<CR>
nmap <C-s> :write<CR>
inoremap <C-j> <Esc>o
inoremap <C-k> <Esc>O
inoremap <C-l> <Esc>la
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.mdx set filetype=markdown
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" colorscheme gruvbox-material
" -- remember last line open --
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
" Add Line Indentation
" set list lcs=tab:\|\
" set list lcs=tab:\┆\
set list lcs=tab:\¦\ 
" Buat neovim bisa copy paste ke clipboard system with 'y' and 'p'
set clipboard+=unnamedplus
set smartindent
set autoindent
" inoremap <Tab> <C-p>



" ctrl + d => down
" ctrl + u => up



