
call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'preservim/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'chun-yang/auto-pairs'
Plug 'tpope/vim-markdown'
Plug 'sainnhe/gruvbox-material'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'pangloss/vim-javascript'
Plug 'jamespeapen/Nvim-R'
" Plug 'nvim-tree/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" ### System Config ###

" Get the defaults that most users want.
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
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif


" ### Neovim Plugin Config ###


" -- NERDTree --
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" let g:NERDTreeDirArrowExpandable = ' '
" let g:NERDTreeDirArrowCollapsible = ' '
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
    autocmd VimEnter * call lightline#update()
augroup END

" -- Nvim Treesitter --
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
lua <<EOF
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}
EOF
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()


" -- NERDCommenter --
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

" -- Lightline --
let g:lightline = {
		\ 'colorscheme': 'wombat',
		\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
		\ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
      \ }
		" \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
		" \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },

" -- Vim Markdown --
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript']


" -- gruvbox-material --
if has('termguicolors')
	set termguicolors
endif
set background=dark
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_cursor = 'yellow'
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_visual = 'reverse'
colorscheme gruvbox-material
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" " solving termguicolors
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" " solving termguicolors


" ### UlstiSnips ###

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" directory 
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']


" NVIM WEB DEVICONS




" ### My config ###
set number
" set relativenumber
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
set textwidth=0
set wrapmargin=1
set formatoptions+=t
set formatoptions-=l
set nobackup
set nowritebackup
" -- 
set noshowmode
" -- copy to clipboard system --
vmap <C-c> :w !xclip -selection clipboard<CR>
" -- paksa save jika butuh sudo --
cnoremap w!! w !sudo tee > /dev/null % 
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
" colorscheme peachpuff
" -- remember last line open --
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
" Add Line Indentation
" set list lcs=tab:\|\
" set list lcs=tab:\┆\
set list lcs=tab:\¦\ 

" ctrl + d => down
" ctrl + u => up



