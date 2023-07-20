" # Playground

" setenv VIM $HQ_VIM_HOME
call setenv('VIM', $HQ_VIM_HOME)
call setenv('VIMWIKI', $HQ_VIM_HOME . "/wiki")

" runtimepath
set rtp+=$VIM/runtime
set rtp+=$VIM/custom

" packpath
set pp+=$VIM/runtime

exec "so " . $VIM . "/plug.vim"

set nu
set rnu

set nocp
set nobk

" TODO auto create directory $VIM/tmp
set dir=$VIM/tmp

map <leader>ec :tabe $VIM/init.vim<cr>

set autochdir

filetype plugin on


" noremap <c-r> :!dotnet fsi %<cr>

exec "so " . $VIM . "/main.vim"

exec "so " . $VIM . "/wow.vim"

exec "so " . $VIM . "/dummy.vim"
