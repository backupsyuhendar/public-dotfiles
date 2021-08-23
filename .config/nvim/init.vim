
call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'preservim/nerdcommenter'
call plug#end()

" source ~/.vim/vimrc
"
" -- Airline --
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_powerline_fonts = 1

" -- NERDTree --
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '
let NERDTreeDirArrows = 1
set encoding=UTF-8

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


" --NERDCommenter--
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


" === My config === 
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
colorscheme koehler
" vnoremap <C-c> :w !xclip -selection clipboard<CR>
vmap <C-c> :w !xclip -selection clipboard<CR>
cnoremap w!! w !sudo tee > /dev/null %
nnoremap gh <C-W><C-H>
nnoremap gj <C-W><C-J>
nnoremap gk <C-W><C-K>
nnoremap gl <C-W><C-L>
nmap <silent> <C-h> :vertical resize -3<CR>
nmap <silent> <C-l> :vertical resize +3<CR>
nmap <silent> <C-k> :res +3<CR>
nmap <silent> <C-j> :res -3<CR>
inoremap <C-j> <Esc>o
inoremap <C-k> <Esc>O
inoremap <C-l> <Esc>la
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" ctrl + d => down
" ctrl + u => up

