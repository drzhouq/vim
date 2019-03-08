set nocompatible              " be iMproved, required
autocmd! bufwritepost .vimrc source ~/.vimrc
let mapleader=","
let g:mapleader=","
set backspace=indent,eol,start
"call plug#begin('~/.vim/plugged')
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"call plug#end()
""launch config {{{
"currently I have following plugins, use following method to dislabe
"ag the insanely fast search
"ctrlp the quick search of files
"fugitive the git support
"gundo the nice undo
"neocomplete
"neosnippet
"neosnippet-snippets
"nerdtree file tree
"syntastic the syntax check
"vim-python-pep8-indent
"let g:pathogen_disabled=[]
"call add(g:pathogen_disabled, 'csscolor')
"call pathogen#infect()
"call pathogen#runtime_append_all_bundles()

"}}}

filetype off                  " required
"execute pathogen#infect()
syntax on
"
" When vimrc is edited, reload it
" Color {{{
let base16colorspace=256  "Access colors present in 256 colorspace"
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
"colorscheme molokai 
colorscheme badwolf 
"syntax enable "enable syntax processing, it is different with syntax on
" colorscheme anderson 
" following three lines have to be used at the same time
set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256 
" }}}
" Space and Tabs {{{

set tabstop=4   "if a file contains tab,it will displayed as 4 spaces 
set softtabstop=4 "each tab equals 4 spaces
set expandtab "tabs are spaces, no tabs are allowed

" }}}
" UI Config {{{
"
set number "show line numbers
set showcmd "needs to check powerline plugin
set cursorline "highlight current line
filetype plugin indent on    " required needs to check indent files for python, javascript
set wildmenu "visual autocomplete for command menu
set lazyredraw "redraw only when we need to
set wrap
set wrapmargin=8
set linebreak " set soft wrapping
set showbreak=...
set showmatch "highlight matching of [{(
set noerrorbells "no annoying bells 
set visualbell
set t_vb=
set tm=500
" }}}
"key mapping {{{
" shortcut to save
"disable Ex mode
noremap Q <NOP>
inoremap jk <esc>

" set paste toggle this is to avoid autoindent when copy texts from other
" source. presss f6 first before paste the text from other source and press
" again after the paste
"set pastetoggle=<F6>
" toggle paste mode
 map <silent> <C-h> :call WinMove('h')<cr>
 map <silent> <C-j> :call WinMove('j')<cr>
 map <silent> <C-k> :call WinMove('k')<cr>
 map <silent> <C-l> :call WinMove('l')<cr>


"}}}
"
"Invisible characters {{{
"set invlist
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
set showbreak=↪
nmap <leader>l :set list!<cr>


"}}}
" Search {{{

set incsearch
set ignorecase "ignorecase in search
set smartcase "turn case if mixed upper and lower

set hlsearch
"turn off search highlight
"nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader><space> :set hlsearch! hlsearch?<cr>
"}}}
"folding {{{
set foldenable "can fold blocks
set foldlevelstart=10 "open all folds
set foldnestmax=10 "up to 10 nested folds
"use space to fold and unflod
nnoremap <space> za 
set foldmethod=indent " use indent for fold, could use marker, manual, expr, syntax, blah, python and javascript use indent is good
"}}}

" movement {{{
"move as visual line, not real line
nnoremap j gj
nnoremap k gk
"make it easier to use b and e
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
"highlight block of characters last edit, it saves 6 key strokes
nnoremap gV `[v`]
"}}}
" leader shortcuts {{{
"graphical tree undo
nnoremap <leader>u :GundoToggle<CR>    
"nnoremap <leader>s :mksession!<CR>
nnoremap <leader>s :SyntasticToggleMode<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>a :Ag
 map <leader>v :set paste!<cr>
 map <leader>wc :wincmd q<cr>
nmap <leader>w :w<cr>
" }}}
"ctrlP {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer =0
let g:ctrlp_work_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$|node_modules',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }
"}}}

" TMUX config{{{
if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif 

"}}}

"autogroup {{{
augroup configgroup
autocmd!
autocmd VimEnter * highlight clear SignColumn
autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md :call <SID>StripTrailingWhitespaces()
autocmd FileType java setlocal noexpandtab
autocmd FileType java setlocal list
autocmd FileType java setlocal listchars=tab:+\ ,eol:-
autocmd FileType java setlocal formatprg=par\ -w80\ -T4
autocmd FileType php setlocal expandtab
autocmd FileType php setlocal list
autocmd FileType php setlocal listchars=tab:+\ ,eol:-
autocmd FileType php setlocal formatprg=par\ -w80\ -T4
autocmd FileType ruby setlocal tabstop=2
autocmd FileType ruby setlocal shiftwidth=2
autocmd FileType ruby setlocal softtabstop=2
autocmd FileType ruby setlocal commentstring=#\ %s
autocmd FileType python setlocal commentstring=#\ %s
autocmd BufEnter *.cls setlocal filetype=java
autocmd BufEnter *.zsh-theme setlocal filetype=zsh
autocmd BufEnter Makefile setlocal noexpandtab
autocmd BufEnter *.sh setlocal tabstop=2
autocmd BufEnter *.sh setlocal shiftwidth=2
autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
"}}}

"backup {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
"}}}

"customized functions  {{{
function! <SID>StripTrailingWhitespaces()
            " save last search & cursor position
        let _s=@/
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        let @/=_s
        call cursor(l, c)
endfunction

function! ToggleNumber()
        if(&relativenumber == 1)
                set norelativenumber
                set number
        else
                set relativenumber
        endif
endfunc

let $in_hex=0
function! HexMe()
        set binary
        set noeol
        if $in_hex>0
                :%!xxd -r
                let $in_hex=0
        else
                :%!xxd
                let $in_hex=1
        endif
endfunction

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

"}}}
"syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
"}}}
"snippet {{{
"
" Plugin key-mappings.
 imap <C-k>     <Plug>(neosnippet_expand_or_jump)
 smap <C-k>     <Plug>(neosnippet_expand_or_jump)
 xmap <C-k>     <Plug>(neosnippet_expand_target)
"

" " For conceal markers.
 if has('conceal')
   set conceallevel=2 concealcursor=niv
 endif
 "}}}
set modelines=1
"check hex code
noremap <F8> :call HexMe()<CR>
"""Nerd tree {{{
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
 let NERDTreeShowHidden=1
" " remove some files by extension
 let NERDTreeIgnore = ['\.js.map$']
" }}}
"neocomplete {{{
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"}}}
"run python
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
" vim:foldmethod=marker:foldlevel=0
