" echo "after plugin loaded"


au BufNewFile,BufRead *.rs
      \ set tabstop=2
      \ softtabstop=2
      \ shiftwidth=2
      \ textwidth=79
      \ expandtab
      \ autoindent
      \ fileformat=unix

