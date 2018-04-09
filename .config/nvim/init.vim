set clipboard=unnamed
set backupcopy=yes
set nu

" Create parent folders
augroup Mkdir
  autocmd!
  autocmd BufWritePre *
    \ if !isdirectory(expand("<afile>:p:h")) |
        \ call mkdir(expand("<afile>:p:h"), "p") |
    \ endif
augroup END

" Tab colors
:hi TabLineFill ctermfg=Yellow ctermbg=Yellow
:hi TabLine ctermfg=Grey ctermbg=Yellow
:hi TabLineSel ctermfg=White ctermbg=Yellow

" Highlight
"highlight CursorLine cterm=NONE ctermbg=DarkGrey ctermfg=White guibg=NONE guifg=NONE
"set cursorline
"autocmd GuiEnter * set background&


" Complete
let g:python3_host_prog = '/usr/bin/python3.6'
let g:python_host_prog = '/usr/bin/python2.7'

let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1
set completeopt+=noinsert
set completeopt-=preview

imap <C-space>     <Plug>(neosnippet_expand_or_jump)
smap <C-space>     <Plug>(neosnippet_expand_or_jump)
xmap <C-space>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Tabulation
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Mouse
set mouse=a

" Remap Keys
nnoremap <F2> :NERDTreeToggle <CR>
nnoremap <F3> :FZF <CR>

" Plugins
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
"Plug 'maxmellon/vim-jsx-pretty'
Plug 'chemzqm/vim-jsx-improve'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-obsession'
Plug 'raimondi/delimitmate'
"Plug 'marijnh/tern_for_vim'
"Plug 'valloric/youcompleteme'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'wokalski/autocomplete-flow'
" For func argument completion
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'rakr/vim-one'
"Plug 'chrisbra/csv.vim'
"Plug 'svermeulen/vim-easyclip'
call plug#end()

" Airline
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
"let g:airline_symbols.space = "\ua0"
let g:airline_powerline_fonts = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_javascript_checkers = ['eslint']

" Colorscheme
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:airline_theme='one'
set background=dark " for the dark version
" set background=light " for the light version
colorscheme one

hi Normal guibg=NONE ctermbg=NONE
