"                      _
"   ___  ___ ___ _  __(_)_ _
"  / _ \/ -_) _ \ |/ / /  ' \
" /_//_/\__/\___/___/_/_/_/_/
"
"                      ____                    __  _
"       _______  ___  / _(_)__ ___ _________ _/ /_(_)__  ___
"      / __/ _ \/ _ \/ _/ / _ `/ // / __/ _ `/ __/ / _ \/ _ \
"      \__/\___/_//_/_//_/\_, /\_,_/_/  \_,_/\__/_/\___/_//_/
"                        /___/

" neovim config file - ~/.config/nvim/init.vim
" Author: George Kaimakis
" Github: https://github.com/geokai
" Date:   24 02 2019

" Initial_Setup_Instructions:----------------------------------------------{{{1
" Install vim-plug:
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" then use :PlugInstall

" Plugin_support:
" pip install neovim flake8 mypy yapf pylint
" powerline fonts: https://github.com/powerline/fonts

" Themes:
" Create a colors directory ~/.config/nvim/colors
" cd ~/.config/nvim/colors
" and then curl them with -o option to write a file, e.g.
" curl -fL https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim -o badwolf.vim

" Vimplug:-----------------------------------------------------------------{{{1
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'  " Put stuff around stuff
Plug 'tpope/vim-unimpaired'  " Pairs of handy bracket mappings + more
Plug 'tpope/vim-fugitive'  " Git functionality from within vim/neovim
Plug 'tpope/vim-repeat'  "  Provides repeat functionality to other plugins
Plug 'tpope/vim-commentary'  " Commenting the pope way
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'  " Easier/Powerful vim motions
Plug 'scrooloose/nerdtree'  " Vim file browsing
Plug 'jistr/vim-nerdtree-tabs'  " Nerdtree independent of tabs
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'jreybert/vimagit'
Plug 'LukeSmithxyz/vimling'
Plug 'vimwiki/vimwiki'  " Make your own wiki
Plug 'bling/vim-airline'  " Cool status bar
Plug 'christoomey/vim-sort-motion'  " Sorting: linewise, character, block etc
Plug 'ying17zi/vim-live-latex-preview'  " LaTeX coolness
Plug 'junegunn/goyo.vim'
Plug 'junegunn/rainbow_parentheses.vim'  " Colorful nested parens - sweet!
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'guns/vim-sexp',       {'for': 'clojure'}
Plug 'liquidz/vim-iced',    {'for': 'clojure'}
Plug 'vim-pandoc/vim-pandoc'    " fuzzy-find for bib files
Plug 'vim-pandoc/vim-pandoc-syntax'  " syntax support for bib files searches
call plug#end()

" Enable vim-iced's default key mapping
let g:iced_enable_default_key_mappings = v:true

" General setup:-----------------------------------------------------------{{{1
let mapleader = ","
let maplocalleader = "\\"

set nocompatible
filetype plugin on
syntax on
set hidden
set encoding=utf-8
" set mouse=a
set clipboard=unnamedplus
set shortmess+=Iw
set textwidth=80

" Basic Settngs:-----------------------------------------------------------{{{1
set number

set list
set showbreak=↳\
set listchars=tab:›\ ,trail:–,extends:»,precedes:«,eol:¬
set title
set scrolloff=5
set noshowmode

" Splits - feels more natural
set splitbelow
set splitright

" Tabs, spaces and wrapping:-----------------------------------------------{{{1

" default tab settings:
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

if has("autocmd")
    " Enable file type detection
    filetype on
    autocmd FileType c setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType html setlocal ts=2 sts=2 sw=2 noexpandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 noexpandtab
    autocmd FileType vim setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType clojure setlocal ts=2 sts=2 sw=2 expandtab
endif

set wrap
nnoremap <silent> <leader>wr <ESC>:set wrap!<CR><ESC>

" Crontab Safe:------------------------------------------------------------{{{1
" Make (neo)vim able to edit crontab files w/o exploding! <mb not needed>
" set backupskip=/tmp/*,/private/tmp/*

" Themes & Highlighting:---------------------------------------------------{{{1
" place in the colors directory ~/.config/nvim/colors using curl -o
colorscheme badwolf "https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim
" colorscheme molokai "https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim

set colorcolumn=+1
set background=dark
set cursorline
highlight cursorline ctermbg=234 ctermfg=none cterm=none
highlight ColorColumn ctermbg=232
call matchadd('ColorColumn', '\%81v', 100)
highlight! link TermCursor Cursor
highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
highlight nontext ctermfg=darkgrey ctermbg=none

" Finding And Autocomplete:------------------------------------------------{{{1
set path+=**
set wildmenu
set ignorecase
set smartcase
set showmatch
set wildmode=longest,list,full
set complete=.,w,b,u,t,i,kspell

" Ctrl-p:------------------------------------------------------------------{{{1

" Useful F-key mappings:---------------------------------------------------{{{1
nnoremap <silent> <F2> <ESC>i#!/bin/bash<ESC>o<ESC>
nnoremap <silent> <F3> <ESC>i#!/usr/local/bin/python3<ESC>o<ESC>
nnoremap <silent> <F4> <ESC>o# Author: George Kaimakis - https://github.com/geokai<ESC>o<ESC>
nnoremap <silent> <F5> <ESC>a# This file was created on <ESC>:r!date "+\%d \%b \%Y"<ESC>kJ0<ESC>

" Re-Mappings:-------------------------------------------------------------{{{1
" Toggle relativenumber:
" use relative numbering - Use 'vim-unimpaired' [or & ]or, to toggle: =or
" inoremap <silent> <leader>u <esc>:set relativenumber!<CR>a
" nnoremap <silent> <leader>u :set relativenumber!<CR><esc>

" run any command written on a line as if in the shell (cursor on line)
" and replace the line (command) with the result:
" e.g. date --date='@0' --> Thu Jan  1 01:00:00 BST 1970
nnoremap Q !!sh<CR>

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
vnoremap <C-c> "+y
" map <C-p> "+P

" open vimrc in a split for a quick edit
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
" source the vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>

" -all-caps & continue in INSERT mode
inoremap <c-u> <esc>viwUea
" -all-caps & continue in NORMAL mode
nnoremap <c-u> viwUe<ESC>
" -add missing ':' to end of statements
nnoremap <leader>: mqA:<ESC>`q
" -add missing ';' to end of statements
nnoremap <leader>; mqA;<ESC>`q
" -search highlighting off
nnoremap <silent> <leader>nh :nohl<cr>

" Nerd tree
nnoremap <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open my bibliography file in split
nnoremap <leader>b :vsp<space>$REFBIB<CR>
" map <leader>r :vsp<space>$REFER<CR>

" quick pairs in INSERT mode
inoremap <leader>' ''<ESC>i
inoremap <leader>" ""<ESC>i
inoremap <leader>* **<ESC>i
inoremap <leader>( ()<ESC>i
inoremap <leader>[ []<ESC>i
inoremap <leader>t[ [  ]<ESC>hi
inoremap <leader>{ {}<ESC>i
inoremap <leader>< <><ESC>i

" set up function block:
inoremap <leader>{{ {}<ESC>i<CR><ESC><<O
" set up docstring:
inoremap <leader>ds """"""<ESC>hhi
nnoremap <leader>ds a""""""<ESC>hhi

" surround a word with ... pairs - Use 'vim-surround'
" nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
" nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel
" nnoremap <leader>< viw<esc>a><esc>hbi<<esc>lel
" nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel
" nnoremap <leader>__ viw<esc>a__<esc>hbi__<esc>lel

" exit pair(s) to end of line:
inoremap <c-l> <ESC>A
" exit nested pair to within parent pair:
inoremap <c-j> <ESC>la

" Disable the arrow keys:--------------------------------------------------{{{2
" : in NORMAL mode
nnoremap <up> <Nop>
nnoremap <left> <Nop>
nnoremap <right> <Nop>
nnoremap <down> <Nop>
" : in INSERT mode
inoremap <up> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
inoremap <down> <Nop>
" : in VISUAL mode
vnoremap <up> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>
vnoremap <down> <Nop>
" 2}}}

" EasyMotion:--------------------------------------------------------------{{{1
" Remap EasyMotion leader key:
map <localleader> <Plug>(easymotion-prefix)

" Character-wise motion
map <localleader>s <Plug>(easymotion-overwin-f)

" Disable default mappings:
let g:EasyMotion_do_mapping = 0

" line-wise motion:
let g:EasyMotion_startofline = 0

map <silent> <localleader>j <Plug>(easymotion-j)
map <silent> <localleader>J <Plug>(easymotion-sol-j)
" nmap <localleader>j <Plug>(easymotion-overwin-line)
map <silent> <localleader>k <Plug>(easymotion-k)
map <silent> <localleader>K <Plug>(easymotion-sol-k)
" nmap <localleader>k <Plug>(easymotion-overwin-line)

" Turn on case insensitive feature:
let g:EasyMotion_smartcase = 1

" Mappings:
" -bd- for bidirectional motion with word-wise
map <silent> <localleader>w <Plug>(easymotion-bd-w)
nmap <silent> <localleader>w <Plug>(easymotion-bd-w)
map <silent> <localleader>W <Plug>(easymotion-bd-W)

" end-of-word motion
map <silent> <localleader>e <Plug>(easymotion-bd-e)
map <silent> <localleader>E <Plug>(easymotion-bd-E)

" Navigation:--------------------------------------------------------------{{{1
" Shortcutting split navigation, saving a keypress:
" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l

" navigating between vim tabs
nnoremap <leader>n <ESC>:tabn<CR>
nnoremap <leader>N <ESC>:tabp<CR>

" Folding:-----------------------------------------------------------------{{{1
highlight Foldcolumn ctermfg=Darkgrey ctermbg=0 cterm=BOLD
highlight Folded ctermfg=Darkgrey ctermbg=NONE cterm=none
set foldcolumn=4

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevelstart=0
augroup END


function! MyFoldText()  "--------------------------------------------------{{{2
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  let onetab = strpart('           ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 - len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction  "  2}}}

set foldtext=MyFoldText()

" 1}}}
" Fuctional & Filetype settings:-------------------------------------------{{{1
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
nnoremap <leader>f :Goyo \| set bg=dark \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
" nnoremap <leader>o :setlocal spell! spelllang=en_us<CR>

" vimling - special character and accent marks key combinations:
nnoremap <leader><leader>d :call ToggleDeadKeys()<CR>
inoremap <leader><leader>d <esc>:call ToggleDeadKeys()<CR>a
nnoremap <leader><leader>i :call ToggleIPA()<CR>
inoremap <leader><leader>i <esc>:call ToggleIPA()<CR>a
nnoremap <leader><leader>q :call ToggleProse()<CR>

" Check file in shellcheck:
" map <leader>s :!clear && shellcheck %<CR>

" Replace all is aliased to S.
" nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
nnoremap <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
nnoremap <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.rasi set filetype=css

" Enable Goyo by default for mutt writting
	" Goyo's width will be the line limit in mutt.
autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo \| set bg=light

" Automatically deletes all trailing whitespace on save.
" autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost ~/.Xresources,~/.Xdefaults,~/.config/Xresources/Xresources !xrdb %

" Navigating with guides
nnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l

" Clojure configuration
" activate rainbow-parens on file type
augroup rainbow_lisp
    autocmd!
    autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

"""LATEX:------------------------------------------------------------------{{{1
	" Word count:
	autocmd FileType tex nnoremap <leader>w :w !detex \| wc -w<CR>
	" Code snippets
	autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
	autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
	autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
	autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
	autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
	autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
	autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
	autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
	autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
	autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,li <Enter>\item<Space>
	autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
	autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
	autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i
	autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
	autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
	autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,bt {\blindtext}
	autocmd FileType tex inoremap ,nu $\varnothing$
	autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
	autocmd FileType tex inoremap ,rn (\ref{})<++><Esc>F}i

"""HTML:-------------------------------------------------------------------{{{1
    " do not auto line-break html files:
    " generate folds:
    " do not wrap html files:
    augroup filetype_html
        autocmd!
        autocmd FileType html setlocal textwidth=0
        autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
        autocmd FileType html setlocal foldmethod=manual
        autocmd FileType html setlocal foldlevelstart=0
        autocmd BufWritePre,BufRead *.html setlocal nowrap
    augroup END

    " awesome keybindings:
    autocmd FileType html inoremap ,D <!DOCTYPE html><Enter><html><Enter><++><Enter></html><Esc>02kf><Esc>a
    autocmd FileType html inoremap ,cc <space><!----><Esc>2F-i
    autocmd FileType html inoremap ,hd <Esc>0a<head><Enter><Enter><++><Enter><Enter></head><Esc>04kf><Esc>a
    autocmd FileType html inoremap ,bd <CR><body><Enter><Enter><++><Enter><Enter></body><Esc>04kf><Esc>a
    autocmd FileType html inoremap ,dv <CR><div><Enter><Enter><++><Enter><Enter></div><Esc>04kf><Esc>a
	autocmd FileType html inoremap ,tt <title></title><Enter><Enter><++><Esc>02kf>a
	autocmd FileType html inoremap ,b <b></b><Space><++><Esc>FbT>i
	autocmd FileType html inoremap ,it <em></em><Space><++><Esc>FeT>i
	autocmd FileType html inoremap ,1 <h1></h1><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,2 <h2></h2><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,3 <h3></h3><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,4 <h4></h4><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,5 <h5></h5><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,6 <h6></h6><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,p <p></p><Enter><Enter><++><Esc>02kf>a
	autocmd FileType html inoremap ,hr <hr><Enter><Enter><++><Esc>02kf>a
	autocmd FileType html inoremap ,a <a<Space>href=""><++></a><Space><++><Esc>14hi
	autocmd FileType html inoremap ,e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
	autocmd FileType html inoremap ,lk <CR><CR><link<Space>href=""<space>rel="stylesheet"<space>type="text/css"><Enter><Enter><++><Esc>02kf"a
	autocmd FileType html inoremap ,ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03k2f<i
	autocmd FileType html inoremap ,li <Esc>o<li></li><Esc>F>a
	autocmd FileType html inoremap ,ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03k2f<i
	autocmd FileType html inoremap ,im <img src="" alt="<++>"><++><esc>Fcf"a
	autocmd FileType html inoremap ,td <td></td><++><Esc>Fdcit
	autocmd FileType html inoremap ,tr <tr></tr><Enter><++><Esc>kf<i
	autocmd FileType html inoremap ,th <th></th><++><Esc>Fhcit
	autocmd FileType html inoremap ,tab <table><Enter></table><Esc>O
	autocmd FileType html inoremap ,gr <font color="green"></font><Esc>F>a
	autocmd FileType html inoremap ,rd <font color="red"></font><Esc>F>a
	autocmd FileType html inoremap ,yl <font color="yellow"></font><Esc>F>a
	autocmd FileType html inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
	autocmd FileType html inoremap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
	autocmd FileType html inoremap &<space> &amp;<space>
	autocmd FileType html inoremap á &aacute;
	autocmd FileType html inoremap é &eacute;
	autocmd FileType html inoremap í &iacute;
	autocmd FileType html inoremap ó &oacute;
	autocmd FileType html inoremap ú &uacute;
	autocmd FileType html inoremap ä &auml;
	autocmd FileType html inoremap ë &euml;
	autocmd FileType html inoremap ï &iuml;
	autocmd FileType html inoremap ö &ouml;
	autocmd FileType html inoremap ü &uuml;
	autocmd FileType html inoremap ã &atilde;
	autocmd FileType html inoremap ẽ &etilde;
	autocmd FileType html inoremap ĩ &itilde;
	autocmd FileType html inoremap õ &otilde;
	autocmd FileType html inoremap ũ &utilde;
	autocmd FileType html inoremap ñ &ntilde;
	autocmd FileType html inoremap à &agrave;
	autocmd FileType html inoremap è &egrave;
	autocmd FileType html inoremap ì &igrave;
	autocmd FileType html inoremap ò &ograve;
	autocmd FileType html inoremap ù &ugrave;

"""MARKDOWN:---------------------------------------------------------------{{{1
	autocmd Filetype markdown,rmd,md inoremap ,w <esc>yiWi[<esc>Ea](<esc>pa)
	autocmd Filetype markdown,rmd,md inoremap ,n ---<Enter><Enter>
	autocmd Filetype markdown,rmd,md inoremap ,b ****<++><Esc>F*hi
	autocmd Filetype markdown,rmd,md inoremap ,s ~~~~<++><Esc>F~hi
	autocmd Filetype markdown,rmd,md inoremap ,e __<++><Esc>F_i
	autocmd Filetype markdown,rmd,md inoremap ,h ====<Space><++><Esc>F=hi
	autocmd Filetype markdown,rmd,md inoremap ,i ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd,md inoremap ,a [](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd,md inoremap ,1 #<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd,md inoremap ,2 ##<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd,md inoremap ,3 ###<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd,md inoremap ,l --------<Enter>
	autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO

""".bib:-------------------------------------------------------------------{{{1
	autocmd FileType bib inoremap ,a @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
	autocmd FileType bib inoremap ,b @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>6kA,<Esc>i
	autocmd FileType bib inoremap ,c @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>booktitle<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i

""".xml:-------------------------------------------------------------------{{{1
	autocmd FileType xml inoremap ,e <item><Enter><title><++></title><Enter><guid<space>isPermaLink="false"><++></guid><Enter><pubDate><Esc>:put<Space>=strftime('%a, %d %b %Y %H:%M:%S %z')<Enter>kJA</pubDate><Enter><link><++></link><Enter><description><![CDATA[<++>]]></description><Enter></item><Esc>?<title><enter>cit
	autocmd FileType xml inoremap ,a <a href="<++>"><++></a><++><Esc>F"ci"

" learning vim the hard way:-----------------------------------------------{{{1

" 1}}}

"""""""""""""""""""" --- end of init.vim file --- """"""""""""""""""""
