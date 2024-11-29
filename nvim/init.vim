" ===== vim-plug ====
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
" Plug 'terryma/vim-multiple-cursors'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Better comments and keybindings
" Plug 'scrooloose/nerdcommenter'

" Visual indicators of marks
Plug 'kshenoy/vim-signature'

" Surrouning stuff like quotes, brackets etc..
Plug 'tpope/vim-surround'

Plug 'dense-analysis/ale'

" Navigate tmux panes with hjkl
Plug 'christoomey/vim-tmux-navigator'

" tmux line 
" Makes tmux look good
Plug 'edkolev/tmuxline.vim'

" Tab completion
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 ./install.py --ts-completer' }

Plug 'AndrewRadev/splitjoin.vim'

" Gitwrapper for airline
Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vim-scripts/Tabmerge'

Plug 'jremmen/vim-ripgrep'
Plug 'yssl/QFEnter'

Plug 'sirver/ultisnips'

Plug 'wellle/targets.vim'

Plug 'nathanalderson/yang.vim'

"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'nvim-treesitter/playground'
"Plug 'nvim-treesitter/nvim-treesitter-context'

" Plug 'ervandew/supertab'
call plug#end()

" ===== My plugin settings =====
let mapleader=","
set clipboard+=unnamedplus
"exe 'set rtp+=' . $NCS_DIR . "/../lib/webui/webui-one/"

" vim-airline
set laststatus=2
if !exists('g:airline_symbols')
	let g:airline_symbols={}
endif
let g:airline#extension#branch#enabled=1
let g:airline_theme='simple'
let g:airline_powerline_fonts=1
let g:airline_symbols.space="\ua0"
" let g:airline_left_sep=''
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
" let g:airline_right_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline_symbols.linenr=''
" let g:airline_symbols.branch='⎇'
let g:airline_symbols.branch = ''
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.colnr = ''
let g:airline_symbols.paste='ρ'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.whitespace=''
let g:airline_symbols.dirty='💩'
let g:airline_skip_empty_sections=1
let g:airline_section_c='%t'
let g:airline_section_x=0
let g:airline_section_y=0
let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr', 'colnr'])
let g:airline#extensions#branch#displayed_head_limit=30
let g:airline#extensions#branch#empty_message = '!branch'
" Seems to not work...
let g:airline#extension#tabline#enabled=1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 1
"let g:airline#extensions#ale#enabled=1
"let g:airline#extensions#ale#error_symbol='💩 '
"let g:airline#extensions#ale#warning_symbol='⚠️ '
let g:airline#extensions#whitespace#mixed_indent_algo=1
let g:airline#extensions#whitespace#checks=['indent', 'trailing']
let g:airline#extensions#tmuxline#enabled=1
let g:airline#extensions#ycm#enabled=1
"let g:airline#extensions#ycm#error_symbol='💩'
"let g:airline#extensions#ycm#warning_symbol='⚠️'

" make YCM compatible with UltiSnips
let g:UltiSnipsExpandTrigger           = '<Tab>'
let g:UltiSnipsJumpForwardTrigger      = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<S-Tab>'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsSnippetDirectories=['~/.config/nvim/UltiSnips/']

let g:splitjoin_trailing_comma = 1
let g:splitjoin_html_attributes_bracket_on_new_line = 1

" better key bindings for UltiSnipsExpandTrigger
let g:ultisnips_javascript = {
    \ 'keyword-spacing': 'always',
    \ 'semi': 'always',
    \ 'space-before-function-paren': 'always',
    \ }

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
au BufEnter *.snippets :highlight clear snipLeadingSpaces

let g:ycm_key_list_select_completion   = ['']
let g:ycm_key_list_insert_completion = ['<Tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_use_ultisnips_completer = 0
let g:ycm_filter_diagnostics = { 'javascript': { 'regex': [ '.*' ] } }
let g:ycm_show_diagnostics_ui = 0

"Toggle YouCompleteMe on and off with F3
function Toggle_ycm()
    if g:ycm_show_diagnostics_ui == 0
        let g:ycm_auto_trigger = 1
        let g:ycm_show_diagnostics_ui = 1
        :YcmRestartServer
        :e
        :echo "YCM on"
    elseif g:ycm_show_diagnostics_ui == 1
        let g:ycm_auto_trigger = 0
        let g:ycm_show_diagnostics_ui = 0
        :YcmRestartServer
        :e
        :echo "YCM off"
    endif
endfunction
noremap <leader>tycm :call Toggle_ycm() <CR>


" Git gutter
let g:gitgutter_max_signs=1000
autocmd BufWritePost * GitGutter
nmap <Leader>hs <Plug>(GitGutterStageHunk)
nmap <Leader>hr <Plug>(GitGutterUndoHunk)
nmap <Leader>hn <Plug>(GitGutterNextHunk)
nmap <Leader>hp <Plug>(GitGutterPrevHunk)

nmap <Leader>gs :Git status<CR>
nmap <Leader>gcm :Git commit --amend<CR>
nmap <Leader>gps :Git push --force-with-leas<CR>

" vim-javascript
let g:javascript_plugin_jsdoc=1

" vim-jsx-pretty
let g:vim_jsx_pretty_enable_jsx_highlight=1
let g:vim_jsx_pretty_colorful_config=0

" vim-monokai
" vim-multiple-cursors
" nerdcommenter
" let g:NERDSpaceDelims=1
" let g:NERDCompatSexyComs=1

" vim-signatiure
" vim-surround
nmap <Leader>sw ysiw

" ALE
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_sign_highlight_linenrs = 0
let g:ale_use_neovim_diagnostics_api = 0
let g:ale_set_highlights = 0
let g:ale_set_signs = 1
let g:ale_fix_on_save = 0
let g:ale_lint_on_save = 1
let g:ale_cursor_detail = 0
let g:ale_virtualtext_cursor = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 1
let g:ale_echo_cursor = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error='💩'
let g:ale_sign_style_error='💩'
let g:ale_sign_warning='💩'
let g:ale_sign_style_warning='💩'
let g:ale_echo_msg_error_str = '💩'
let g:ale_echo_msg_warning_str = '💩'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
nnoremap <Leader>af :ALEFix<CR>
nnoremap <Leader>al :ALELint<CR>
nnoremap <Leader>an :ALENext<CR>
nnoremap <Leader>ap :ALEPrevious<CR>

nnoremap <Leader>ne :lnext<CR>
nnoremap <Leader>pe :pnext<CR>

" vim-tmiux-navigator
" tmuxline
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '|',
    \ 'right' : '',
    \ 'right_alt' : '|',
    \ 'space' : ' '}
let g:tmuxline_powerline_separators = 1
let g:tmuxline_preset = {
    \ 'a': '#S',
    \ 'b': '#W',
    \ 'c': '',
    \ 'win': ['#I', '#W'],
    \ 'cwin': ['#I', '#W'],
    \ 'x': '',
    \ 'y': ['%R', '%a', '%Y', '#($TMUX_PLUGIN_MANAGER_PATH/tmux-mem-cpu-load/tmux-mem-cpu-load --colors --interval 1 --graph-lines 0 --averages-count 1 -m 2)']}

" fzf
let g:fzf_action = {
      \ 'enter': 'drop',
      \ 'ctrl-t': 'tab drop',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }
function! RG()
    call inputsave()
    let match = input({ 'prompt': 'Rg: ', 'default': '', 'cancelreturn': '' })
    call inputrestore()
    execute "Rg '".l:match."'" '%p%h'
endfunction

let g:fzf_preview_window = ['up,50%', 'ctrl-/']
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--info=inline', '--preview', '~/.local/share/nvim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

noremap <Leader>Z :Files!<CR>
noremap <Leader>z :GFiles lib/webui/webui-one/<CR>
noremap <Leader>g :GFiles!?<CR>
noremap <Leader>b :Buffers<CR>
noremap <Leader>rg :RG!<CR>
" Other good fzf commands
" :Commits
" :BCommits
" :Commands

" Yank Rip Grep. <C-r>+, reads from clipboard
map <Leader>yrg yiw:RG! <C-r>+<CR>

" ===== my vim settings =====
filetype plugin indent on
syntax on
colorscheme monokai
set guifont="Hack Nerd Font Mono":size=12
set t_Co=256

set mouse=
set nobackup
set noswapfile
set encoding=utf-8
set suffixesadd+=.js,.jsx
set path+=/usr/include
autocmd BufNewFile,BufRead ~/dev/git/tailf/* set path+=$NCS_DIR/../lib/webui/webui-one/
autocmd BufNewFile,BufRead ~/dev/git/tailf/* set path+=$NCS_DIR/../lib/webui/webui-one/src
autocmd BufNewFile,BufRead ~/dev/git/tailf/* set path+=$NCS_DIR/../lib/webui/webui-one/unittests
autocmd BufNewFile,BufRead ~/dev/git/tailf/* set path+=$NCS_DIR/../lib/webui/webui-one/functional
autocmd BufNewFile,BufRead ~/dev/git/webui-one-multi-output-configuration-editor/* set path+=~/dev/git/webui-one-multi-output-configuration-editor/src/
" set path+=$NCS_DIR/../lib/webui/webui-one/src
" set path+=$NCS_DIR/../lib/webui/webui-one/unittests
" set path+=$NCS_DIR/../lib/webui/webui-one/functional
set wildmenu
set wildmode=list:longest,full
set showcmd
set number relativenumber
set ruler
set nowrap
set sidescroll=1
set colorcolumn=100
set matchpairs+=<:>
set ignorecase
set smartcase
set nohlsearch
set incsearch
hi Search ctermfg=Red ctermbg=NONE
set backspace=indent,eol,start
set cursorline
set guicursor=""
"hi clear CursorLine
hi MatchParen ctermfg=NONE ctermfg=NONE
set list
" set listchars=tab:▸\ ,trail:·,eol:¬,space:·
set listchars=tab:▸\ ,trail:·,
set splitbelow
set splitright
set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent
set scrolloff=12
set autoindent
set foldnestmax=5
let @s = '^wi.skip'
let @o = '^wi.only'
let @d = '^wdt('

" :NERDTreeClose<CR>
nmap     <silent> <ESC> :noh<CR>:pclose<CR>:lcl<CR>:ccl<CR>:NvimTreeClose<CR>
vmap     <Leader>ld :Linediff<CR>
nnoremap <Leader>ev :split $MYVIMRC<cr>
nnoremap <Leader>el :split ~/.config/nvim/lua/init.lua<CR>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :w!<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>e :e<CR>k
nnoremap <Leader>E :e!<CR>k
nnoremap <Leader>q :bd<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>r :so ~/.config/nvim/init.vim<CR>:e<CR>
nnoremap <Leader><Up> :exe "resize +5"<CR>
nnoremap <Leader><Down> :exe "resize -5"<CR>
nnoremap <Leader><Left> :exe "vertical resize -1"<CR>
nnoremap <Leader><Right> :exe "vertical resize +1"<CR>
nnoremap <TAB> >>
nnoremap <S-TAB> <<
xnoremap p P

map <Leader>sb vib :sort<CR>kL
map <Leader>sB gSvib :sort<CR>kLgJ

imap <Leader>ic console.log('xxx: ', xxx);<ESC>^<space>:%s/xxx//g<Left><Left>
imap <Leader>irc console.log('%cxxx: ', 'color: red', xxx);<ESC>^<space>:%s/xxx//g<Left><Left>
imap <Leader>igc console.log('%cxxx: ', 'color: green', xxx);<ESC>^<space>:%s/xxx//g<Left><Left>
imap <Leader>ibc console.log('%cxxx: ', 'color: blue', xxx);<ESC>^<space>:%s/xxx//g<Left><Left>
inoremap <Leader>iC console.log('');<Left><Left><Left>
inoremap <Leader>irC console.log('%c', 'color: red');<Esc>^/%c<CR>ea
inoremap <Leader>igC console.log('%c', 'color: green');<Esc>^/%c<CR>ea
inoremap <Leader>ibC console.log('%c', 'color: blue');<Esc>^/%c<CR>ea

"inoremap <Leader>id describe('', () => {});<Left><Left><Left><CR><Up><Esc>^f'a
inoremap <Leader>id describe('', function () {});<Left><Left><Left><CR><Up><Esc>^f'a
" inoremap <Leader>ii it('', () => {});<Left><Left><Left><CR><Up><Esc>^f'a
inoremap <Leader>ii it('', async function () {});<Left><Left><Left><CR><Up><Esc>^f'a
"inoremap <Leader>ib before(() => {});<Left><Left><Left><CR><Up><Esc><Esc>o
inoremap <Leader>ib before(async function () {});<Left><Left><Left><CR><Up><Esc><Esc>o
"inoremap <Leader>ia after(() => {});<Left><Left><Left><CR><Up><Esc><Esc>o
inoremap <Leader>ia after(async function () {});<Left><Left><Left><CR><Up><Esc><Esc>o
inoremap <Leader>iue useEffect(() => {}, []);<Left><Left><Left><Left><Left><Left><Left><CR><Esc><Esc>O
inoremap <Leader>ius const [] = useState();<Esc>^<space>f[a
inoremap <Leader>ibw await browser.waitForVisible('');<Left><Left><Left>

nmap <Leader>id o,id
nmap <Leader>ii o,ii
nmap <Leader>ib o,ib
nmap <Leader>ia o,ia
nmap <Leader>iue o,iue
nmap <Leader>ius o,ius
nmap <Leader>ibw o,ibw
"vmap J :m '>+1<CR>gv=gv
"vmap K :m '<-2<CR>gv=gv
nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz
nmap n nzzzv
nmap N Nzzzv

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

"luafile $HOME/.config/nvim/treesitter.lua
nnoremap <leader>tsh :TSHighlightCapturesUnderCursor<Cr>
nnoremap <leader>tth :TSBufToggle highlight<Cr>
nnoremap <leader>tpg :TSPlaygroundToggle<Cr>

luafile ~/.config/nvim/lua/init.lua
set secure
