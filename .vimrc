
" Install Pathogen
" Install vim-markdown-preview

call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on
set bg=dark
set tabstop=2
set autoindent
set ruler  " Put the current line,col values in the status bar
set tw=79
set expandtab
set hlsearch
let vim_markdown_preview_browser='Firefox'
let vim_markdown_preview_github=1

" By default VIM's yaml indentation is like 8 spaces.
" This sets it to 2 and adds a foldmethod.
" https://lornajane.net/posts/2018/vim-settings-for-working-with-yaml
""au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Turn on hybrid line numbering. Good write-up on this feature here:
" https://jeffkreeftmeijer.com/vim-number/
:set number relativenumber

" This will automaticaly switch line numbering to absolute when in insert mode.
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
