" ===== vim-plug ===== 
call plug#begin()

" Status bar for vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git gutter
Plug 'airblade/vim-gitgutter'

" JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation.
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" vim monokai thene
Plug 'crusoexia/vim-monokai'

" vim multiple curors
Plug 'terryma/vim-multiple-cursors'

" Better comments and keybindings
Plug 'scrooloose/nerdcommenter'

" File navigator
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Visual indicators of marks
Plug 'kshenoy/vim-signature'

" Surrouning stuff like quotes, brackets etc..
Plug 'tpope/vim-surround'

" Syntax checker framework amongst other things
Plug 'vim-syntastic/syntastic'

" Navigate tmux panes with hjkl
Plug 'christoomey/vim-tmux-navigator'

" tmux line
Plug 'edkolev/tmuxline.vim'

" Tab completion
" Plug 'Valloric/YouCompleteMe', { 'do': 'python ./install.py --js-completer' }
Plug 'Valloric/YouCompleteMe'

Plug 'AndrewRadev/splitjoin.vim'

" Gitwrapper for airline
Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', { 'dir': '~/dev/git/dotfiles/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

Plug 'vim-scripts/Tabmerge'

call plug#end()

" ===== My plugin settings =====
let mapleader=","
set clipboard+=unnamedplus

" vim-airline
set laststatus=2
if !exists('g:airline_symbols')
	let g:airline_symbols={}
endif
let g:airline#extension#branch#enabled=1
let g:airline#extension#tabline#enabled=1
let g:airline_theme='simple'
let g:airline_powerline_fonts=1
let g:airline_symbols.space="\ua0"
" let g:airline_left_sep=''
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
" let g:airline_right_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline_symbols.linenr='☯'
" let g:airline_symbols.branch='⎇'
let g:airline_symbols.branch = ''
let g:airline_symbols.paste='ρ'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.whitespace=''
let g:airline_skip_empty_sections=1
let g:airline_section_x=0
let g:airline_section_y=0
let g:airline#extensions#branch#displayed_head_limit=30
let g:airline#extensions#branch#empty_message = '!branch'
let g:airline#extensions#tabline#show_tab_type=1
let g:airline#extentions#tabline#fnamecollapse=0
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#whitespace#mixed_indent_algo=1
let g:airline#extensions#whitespace#checks=['indent', 'trailing']
let g:airline#extensions#tmuxline#enabled=1
let g:airline#extensions#ycm#enabled=1
let g:airline#extensions#ycm#error_symbol='e:'
let g:airline#extensions#ycm#warning_symbol='w:'

" Git gutter
let g:gitgutter_max_signs=1000
autocmd BufWritePost * GitGutter
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterUndoHunk
nmap <Leader>hn <Plug>GitGutterNextHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk

" vim-javascript
let g:javascript_plugin_jsdoc=1

" vim-jsx-pretty
let g:vim_jsx_pretty_enable_jsx_highlight=1
let g:vim_jsx_pretty_colorful_config=0

" vim-monokai
" vim-multiple-cursors
" nerdcommenter
let g:NERDSpaceDelims=1
let g:NERDCompatSexyComs=1
map ,cb <plug>NERDComSexyComment

" scrooloose/nerdtree
let NERDTreeChDirMode=0
let g:NERDTreeIndicatorMapCustom={
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✹",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
map <C-t> :NERDTreeToggle %:p:h<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" vim-signatiure
" vim-surround
nmap <Leader>sw ysiw

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map={ 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=1
let g:syntastic_cursor_column=0
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exec='/home/eolofsso/dev/git/confd-6.7/lib/webui/webui-one/node_modules/eslint/bin/eslint.js'
let g:syntastic_enable_highlighting=0
let g:syntastic_error_symbol='💩'
let g:syntastic_style_error_symbol='💩'
let g:syntastic_warning_symbol='⚠️'
let g:syntastic_style_warning_symbol='⚠️'

hi link SyntasticErrorSign SignColumn
hi link SyntasticWarningSign SignColumn
hi link SyntasticStyleErrorSign SignColumn
hi link SyntasticStyleWarningSign SignColumn

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction

nnoremap <silent> <Leader>st :call ToggleErrors()<CR>
nnoremap <Leader>sc :SyntasticCheck<CR>
nnoremap <Leader>ne :lnext<CR>
nnoremap <Leader>pe :pnext<CR>

" vim-tmiux-navigator
" tmuxline
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
    \ 'a': '#S',
    \ 'b': '#W',
    \ 'win': ['#I', '#W'],
    \ 'cwin': ['#I', '#W'],
    \ 'x': '%a',
    \ 'y': ['%b %d', '%R'],
    \ 'z': '#H'}

" fzf
map <Leader>z :FZF<CR>

" ===== my vim settings =====
filetype plugin indent on
syntax on
colorscheme monokai
set t_Co=256

set mouse=
set nobackup
set noswapfile
set encoding=utf-8
set suffixesadd+=.js,.jsx
set path=.,/usr/include,,$PWD/src,$PWD/test/unittests/,$PWD/test/functional/
set wildmenu
set wildmode=list:longest,full
set showcmd
set number
set ruler
set nowrap
set sidescroll=1
set colorcolumn=100
set matchpairs+=<:>
set ignorecase
set smartcase
set incsearch
set hlsearch
hi Search ctermfg=Red ctermbg=NONE
set backspace=indent,eol,start
set cursorline
hi CursorLineNr ctermfg=Green
hi clear CursorLine
hi MatchParen ctermfg=NONE ctermfg=NONE
set list
" set listchars=tab:▸\ ,trail:·,eol:¬,space:\ 
set listchars=tab:▸\ ,trail:·,space:\ 
set splitbelow
set splitright
set expandtab
set shiftwidth=4
set softtabstop=4
set scrolloff=6
set autoindent
set foldnestmax=5
let @s = '^wi.skip'
let @o = '^wi.only'
let @d = '^wdt('

nmap     <silent> <ESC> :noh<CR>:pclose<CR>
vmap     <Leader>ld :Linediff<CR>
nnoremap <Leader>ev :split $MYVIMRC<cr>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :w!<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>e :e<CR>k
nnoremap <Leader>E :e!<CR>k
nnoremap <Leader>q :q<CR>   
nnoremap <Leader>Q :q!<CR>   
nnoremap <Leader>r :so ~/.config/nvim/init.vim<CR>:e<CR>
nnoremap <Leader><Up> :exe "resize +5"<CR>
nnoremap <Leader><Down> :exe "resize -5"<CR>
nnoremap <Leader><Left> :exe "vertical resize -1"<CR>
nnoremap <Leader><Right> :exe "vertical resize +1"<CR>

nnoremap <Leader>vf ^<S-v>f{%
nnoremap <Leader>vF ?{^<S-v>%
nnoremap <Leader>caa ^f(<Right>ci)
nnoremap <Leader>cfa ^f(<Right>ct,)
nnoremap <Leader>cla ^f)F,<Right>ct)
imap <Leader>ic console.log('xxx: ', xxx);<ESC>^<space>/xxx<CR><C-n><C-n>c
imap <Leader>iC console.log('');<Left><Left><Left>
inoremap <Leader>id describe('', async () => {});<Left><Left><Left><CR><Up><Esc>^f'a
" inoremap <Leader>id describe('', function () {});<Left><Left><Left><CR><Up><Esc>^f'a
inoremap <Leader>ii it('', async () => {});<Left><Left><Left><CR><Up><Esc>^f'a
" inoremap <Leader>ii it('', function () {});<Left><Left><Left><CR><Up><Esc>^f'a
inoremap <Leader>ib before(async () => {});<Left><Left><Left><CR><Up><Esc><Esc>o
" inoremap <Leader>ib before(function () {});<Left><Left><Left><CR><Up><Esc><Esc>o
inoremap <Leader>ia after(async () => {});<Left><Left><Left><CR><Up><Esc><Esc>o
" inoremap <Leader>ia after(function () {});<Left><Left><Left><CR><Up><Esc><Esc>o
nmap <Leader>id o,id
nmap <Leader>ii o,ii
nmap <Leader>ib o,ib
nmap <Leader>ia o,ia
inoremap <Leader>o <C-o>
nnoremap <sapce> za
nnoremap <space>f $zf%
vnoremap <C-c> "+y
nnoremap <C-c> "+yy
vnoremap <C-x> "+ygvd
nnoremap <C-f> /
vnoremap < <gv
vnoremap > >gv
map ' `
nnoremap L $
vnoremap L $
nnoremap H ^<space><Left>
vnoremap H ^<space><Left>
nnoremap J 5<Down>
vnoremap J 5<Down>
nnoremap K 5<Up>
vnoremap K 5<Up>
nnoremap j gj
nnoremap k gk

iabbrev idocroot <docroot>/home/eolofsso/dev/git/webui-prime/docroot/ncs</docroot>
iabbrev idocrootone <docroot>/home/eolofsso/dev/git/tailf/lib/webui/webui-one/docroot</docroot>

augroup vimrc
	au BufWinEnter * setlocal foldmethod=manual
augroup END

function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nnoremap <Leader>css :call SynStack()<CR>

function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
nnoremap <Leader>csg :call SynGroup()<CR>

" color for item under cursor
function! SynColour()
    echo "guibg = ".synIDattr(synIDtrans( synID(line("."), col("."), 1) ), "bg").", guifg = ".synIDattr(synIDtrans( synID(line("."), col("."), 1)), "fg")
endfunction
nnoremap <Leader>csc :call SynColour()<CR>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

set secure
