" echo 'Hello from tinyplugin'

" load plugin only when Python3 is supported

if !has("python3")
	echo "vim has to be compiled with +python3 to run this plugin"
	finish
endif 

if exists('g:tiny_plugin_loaded')
	finish
endif

" load plugin only once
" python3 << EOF
" print("Hello from a python vim plugin")
" EOF

let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

python3 << EOF
import sys
from os.path import normpath, join
import vim
plugin_root_dir = vim.eval('s:plugin_root_dir')
python_root_dir = normpath(join(plugin_root_dir, '..', 'python'))
sys.path.insert(0, python_root_dir)
import main
EOF

function! PrintCountry()
	python3 main.print_country()
endfunction

function! InsertCountry()
	python3 main.insert_country()
endfunction

" convert function to command
command! -nargs=0 InsertCountry call InsertCountry()

" bind a key to command
map <Leader>a :InsertCountry<CR>

" END

let g:tiny_plugin_loaded = 1

" script variable

command! -nargs=1 Silent execute ':silent!!' . <q-args> | execute ':redraw!'

command! -nargs=1 Silentbg execute ':silent!!' . <q-args> . ' &' | execute ':redraw!'

" Silent /usr/bin/env live-server $VIMWIKI/html

" let s:server = "/usr/bin/env live-server"

let s:colors_name = 'default'
if exists('g:colors_name')
	let s:colors_name = g:colors_name
endif

function! PreviewWiki()
	" silent!! '!open' . ' ' . $VIMWIKI . '/html/index.html'
	exe 'silent' . ' ' .  '!open' . ' ' . $VIMWIKI . '/html/index.html'
	colorscheme default
	exe "colorscheme ". s:colors_name
	edit
endfunction

command! -nargs=0 Vwiki call PreviewWiki()
