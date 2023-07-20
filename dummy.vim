" set bg=dark

" https://www.bbkane.com/blog/vim-color-schemes/
" Try to use a colorscheme plugin
" but fallback to a default one
try
"     " colorscheme gruvbox
"     " colorscheme lucius
"     " https://github.com/dracula/vim/issues/88
  let g:dracula_colorterm = 0
  colorscheme dracula
  highlight Visual cterm=reverse ctermbg=NONE
catch /^Vim\%((\a\+)\)\=:E185/
"     " no plugins available
  colorscheme elflord
endtry

" Linux has termguicolors but it ruins the colors...
if has('termguicolors') && (has('mac') || has('win32'))
    set termguicolors
endif

if has('nvim')
    Plug 'Soares/base16.nvim'
endif
" https://realpython.com/vim-and-python-a-match-made-in-heaven/#ditch-the-mouse

set splitbelow
set splitright



" " layout
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
" autocmd VimEnter * terminal
" autocmd VimEnter * wincmd k
" " autocmd VimEnter * 10 wincmd +


" Please use command like:verbose imap <tab> to make sure that your keymap has taken effect.

nnoremap <leader>t :wincmd b \| bel terminal<CR>

noremap <leader>c <ESC>"+y

" https://vi.stackexchange.com/questions/22528/toggle-vim-background-transparency-how-to-setup
let t:is_transparent = 1
" hi Normal guibg=#111111 ctermbg=black

function! Toggle_transparent_background()
  if t:is_transparent == 0
    hi Normal guibg=#111111 ctermbg=black
    let t:is_transparent = 1
  else
    hi Normal guibg=NONE ctermbg=NONE
    let t:is_transparent = 0
  endif
endfunction

" hi Normal guibg=NONE ctermbg=NONE
nnoremap <C-x><C-t> :call Toggle_transparent_background()<CR>


autocmd FileType scss setl iskeyword+=@-@


au VimEnter,BufNewFile,BufRead *.rs
      \ set tabstop=2
      \ softtabstop=2
      \ shiftwidth=2
      \ textwidth=79
      \ expandtab
      \ autoindent
      \ fileformat=unix

" let $VIMRC=$HOME . '/.vimrc'

map <leader>s :so $VIMRC<cr>

map <c-,> :tabp<cr>
map <c-.> :tabn<cr>

inoremap <leader><leader> \

" silent! echo "reload."<cr>

function! UseDracula()
  let g:dracula_colorterm = 0
  colorscheme dracula
  highlight Visual cterm=reverse ctermbg=NONE
endfunction


augroup dracula_customization
  au!
  " autocmds...
  autocmd ColorScheme dracula hi CursorLine cterm=underline term=underline
  autocmd ColorScheme dracula hi Comment term=bold ctermfg=Cyan guifg=#80a0ff gui=bold
augroup END

autocmd ColorScheme dracula hi Comment  term=bold ctermfg=Cyan guifg=#80a0ff gui=bold
hi Comment term=bold ctermfg=Cyan guifg=#80a0ff gui=bold
