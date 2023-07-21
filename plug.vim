" curl -fLo $HQ_VIM_HOME/runtime/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" ## vim-plug
call plug#begin($VIM . '/plugged')

Plug 'tpope/vim-sensible'


" On-demand loading
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'bling/vim-airline'
Plug 'dracula/vim'
Plug 'jaredgorski/SpaceCamp'
Plug 'jiangmiao/auto-pairs'
Plug 'jonathanfilip/vim-lucius'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mhartington/oceanic-next'
Plug 'neoclide/coc.nvim', {'branch':'release'}
" Plug 'neoclide/coc.nvim', {'branch':'master', 'do', 'yarn install --fronzen-lockfile'}

Plug 'sheerun/vim-polyglot'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/indentpython.vim'
Plug 'vimwiki/vimwiki'
Plug 'ap/vim-css-color'


Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'natebosch/dartlang-snippets'

" Dart
Plug 'dart-lang/dart-vim-plugin'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'easymotion/vim-easymotion'

" custom plugin
Plug $VIM . '/custom/plugs/tinyplugin'

call plug#end()

"davidhalter/jedi-vim"
"tweekmonster/impsort.vim"
"w0rp/ale"
"roxma/vim-hug-neovim-rpc"
"roxma/nvim-yarp"
"ncm2/ncm2"
"HansPinckaers/ncm2-jedi"
"ncm2/ncm2-bufword"
"ncm2/ncm2-path"


let $NVIM_COC_HOME = $VIM . '/coc'
let g:coc_config_home = $VIM
let g:coc_data_home = $NVIM_COC_HOME
