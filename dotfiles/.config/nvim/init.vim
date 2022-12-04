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
set textwidth=0             " do not break lines at overflow column
set colorcolumn=81          " color background after overflow
set number                  " set line numbers, both needed for hybrid
set relativenumber          " set line numbers, both needed for hybrid
set splitright              " open new panes on the right
set splitbelow              " open new panes below current
set ttyfast                 " fast scrolling
filetype plugin indent on   " indent based on file type
syntax on	                " syntax highlighting

" ****************
" *** key maps ***
" ****************

let mapleader=","

" disable arrow keys
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>

" move line with alt + n/e 
inoremap <A-n> <Esc>:m .+1<CR>==gi
inoremap <A-e> <Esc>:m .-2<CR>==gi

" redo to shift + u
nnoremap U <C-R>

" autocomplete braces and quotes
" inoremap { {}<Esc>i
" inoremap ( ()<Esc>i
" inoremap [ []<Esc>i
" inoremap \" \""<Esc>i
" inoremap ' ''<Esc>i
" inoremap ` ``<Esc>i

" tabs
map <leader>tn :tabnew<cr>
map <leader>tm :tabmove
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>

" exit terminal mode with esc
:tnoremap <Esc> <C-\><C-n>

" **************
" *** styles ***
" **************

" use larger color pallette
" set termguicolors

highlight MatchParen cterm=bold ctermfg=DarkMagenta ctermbg=none
highlight ColorColumn ctermbg=DarkGrey guibg=#2d2d2d

" ***************
" *** plugins ***
" ***************

" termdebug
packadd termdebug
let termdebugger="rust-gdb"

" tag bar
nmap <F8> :TagbarToggle<CR>

" nerd tree
let NERDTreeShowHidden=1
let NERDTreeMapOpenExpl='x'  " required to open mapping for menu up
let NERDTreeMenuDown='n'
let NERDTreeMenuUp='e'

" --- do not replace nerdtree buffer
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"     \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" surround
nmap js  <Plug>Ysurround
nmap jS  <Plug>YSurround
nmap jss <Plug>Yssurround
nmap jSs <Plug>YSsurround
nmap jSS <Plug>YSsurround

" coc
" sample config @ https://github.com/neoclide/coc.nvim#example-vim-configuration
" --- goto code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" --- autocomplete
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" --- syling
:highlight CocFloating ctermbg=Black

" --- end coc ---

" rust
let g:rustfmt_autosave = 1

" pounce
nmap ff <cmd>Pounce<CR>
nmap FF <cmd>PounceRepeat<CR>
vmap ff <cmd>Pounce<CR>
omap ff <cmd>Pounce<CR>
