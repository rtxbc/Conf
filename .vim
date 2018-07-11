" An example for a vimrc file.
"
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2006 Nov 16
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"         for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"       for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup      " do not keep a backup file, use versions instead
else
  set nobackup      " keep [NO] backup file
endif
set history=250     " keep 250 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch      " do incremental searching
set nu

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
" set mouse=a
set mouse-=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  autocmd VimLeave *
    \ if has("mksession") && exists("v:this_session") && v:this_session != "" |
    \   exec "mksession!" v:this_session |
    \ endif

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")


" Add by Journeylee to make things more easily
set softtabstop=4
set shiftwidth=4
set tabstop=4
set noexpandtab
set smarttab
set showmatch
set foldenable
set autoindent
set smartindent
set cindent
set foldmethod=marker
set background=dark
set nobackup

set encoding=utf-8
"language en_US.utf8
set fileencodings=ucs-bom,utf-8,gbk,latin1
set fileformats=unix,dos,mac
set fileencoding=utf-8
set fileformat=unix
set paste
set fileformat=unix
set matchtime=15

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" let xterm16_brightness = 'default'     " Change if needed
" let xterm16_colormap = 'allblue'       " Change if needed
" colo xterm16

let mapleader=","
"taglist{
"    let Tlist_Show_One_File = 1            "只显示当前文件的taglist，默认是显示多个
"    let Tlist_Exit_OnlyWindow = 1          "如果taglist是最后一个窗口，则退出vim
"    let Tlist_Use_Left_Window = 1         "在左侧窗口中显示taglist
"    let Tlist_GainFocus_On_ToggleOpen = 1  "打开taglist时，光标保留在taglist窗口
"    let Tlist_Ctags_Cmd='/usr/bin/ctags'  "设置ctags命令的位置
	nnoremap <leader>tl : Tlist<CR>        "设置关闭和打开taglist窗口的快捷键
    "}
