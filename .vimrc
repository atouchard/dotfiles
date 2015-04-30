
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Sets how many lines of history VIM has to remember
set history=700

" statusline
set laststatus=2
set statusline=%t\ %y%m

" Don't beep
set visualbell
set noerrorbells

" Default encoding
set encoding=utf8

" wildmode
set wildmode=longest,list
" temp and backup files
set wildignore+=*.swp,*~,._*
" OSX bullshit
set wildignore+=*.DS_Store

" -----------------------------------------------------------------------------
" Use pathogen
" -----------------------------------------------------------------------------
execute pathogen#infect()
filetype plugin indent on

" Activate mouse (bad use)
set mouse=a

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on

" Highlight current line
set cursorline

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Incremental search
set incsearch

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Display line numbers on the left
set number

" -----------------------------------------------------------------------------
" Indentation options
" -----------------------------------------------------------------------------
set tabstop=2                   " tab is two spaces
set softtabstop=2               " softtab is two spaces
set shiftwidth=2                " autoindent is two spaces
set expandtab                   " convert tabs to spaces

" Keep Insert mode when multiple indentation
vnoremap < <gv
vnoremap > >gv

" -----------------------------------------------------------------------------
" Force sudo
" -----------------------------------------------------------------------------
cmap w!! %!sudo tee > dev/null %

" -----------------------------------------------------------------------------
" ctrlp plugin config
" https://github.com/kien/ctrlp.vim/issues/174#issuecomment-49747252
" -----------------------------------------------------------------------------
let g:ctrlp_custom_ignore = {
  \ 'scm': '\v[\/]\.(git|hg|svn)$',
  \ 'dir': '\v[\/](node_modules|dist|\.sass-cache|bower_components|vendor|vendors|build|\.tmp)$',
  \ 'file': '\v\.(exe|so|dll|jpg|gif|png)$',
  \ }
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" -----------------------------------------------------------------------------
" delimitMate plugin config
" -----------------------------------------------------------------------------
let g:delimitMate_autoclose = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let delimitMate_expand_inside_quotes = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_jump_expansion = 1
let g:delimitMate_matchpairs = "(:),[:],{:},<:>"

" -----------------------------------------------------------------------------
" Airline plugin config
" -----------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

function! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

" -----------------------------------------------------------------------------
" Toggle Vexplore with Ctrl-E
" -----------------------------------------------------------------------------
function! ToggleVExplorer()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        if expl_win_num != -1
            let cur_win_nr = winnr()
            exec expl_win_num . 'wincmd w'
            close
            exec cur_win_nr . 'wincmd w'
            unlet t:expl_buf_num
        else
            unlet t:expl_buf_num
        endif
    else
        exec '1wincmd w'
        Vexplore
        let t:expl_buf_num = bufnr("%")
    endif
endfunction

map <silent> <C-E> :call ToggleVExplorer()<CR>

" -----------------------------------------------------------------------------
" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
" -----------------------------------------------------------------------------
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_liststyle=3

" -----------------------------------------------------------------------------
" Change directory to the current buffer when opening files.
" -----------------------------------------------------------------------------
set autochdir

" -----------------------------------------------------------------------------
" Remove whitespace
" -----------------------------------------------------------------------------
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" -----------------------------------------------------------------------------
" Show whitespace
" -----------------------------------------------------------------------------
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd filetype html,xml set listchars-=tab:>.

" -----------------------------------------------------------------------------
" CSS snippet
" -----------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.scss set ft=scss.css

" -----------------------------------------------------------------------------
" Local settings
" -----------------------------------------------------------------------------
if filereadable(glob("$HOME/.vimrc.local"))
    source $HOME/.vimrc.local
endif

