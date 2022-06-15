" disable compatibility with vi
set nocompatible	        

" **************
" *** packer ***
" **************

" start packer for plugin management
lua require('plugins')

" autocompile new plugins
" vim.cmd([[
"   augroup packer_user_config
"     autocmd!
"     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
"   augroup end
" ]])

" *******************
" *** preferences ***
" *******************

set showmatch		        " show matching
set hlsearch		        " highlight search
set ignorecase              " ignore case in searches
set tabstop=4		        " tab width
set softtabstop=4           " view multiple spaces as tabs
set shiftwidth=4            " width for auto indents
set expandtab		        " converts tabs to spaces
set autoindent              " indent new line as above
set textwidth=80            " overflow column
set colorcolumn=+1          " color background after overflow
set number                  " set line numbers, both needed for hybrid
set relativenumber          " set line numbers, both needed for hybrid
set ttyfast                 " fast scrolling
filetype plugin indent on   " indent based on file type
syntax on	                " syntax highlighting

" ****************
" *** key maps ***
" ****************

" disable arrow keys
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>

" move line with alt + j/k 
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi

" redo to shift + u
nnoremap U <C-R>

" autocomplete braces and quotes
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

" tag bar
nmap <F8> :TagbarToggle<CR>

" **************
" *** styles ***
" **************

highlight MatchParen cterm=bold ctermfg=DarkMagenta ctermbg=DarkGrey
highlight ColorColumn ctermbg=DarkGrey guibg=#2d2d2d
