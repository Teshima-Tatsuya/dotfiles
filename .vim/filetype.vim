augroup filetypedetect
  au BufRead,BufNewFile *.rb setfiletype ruby
  au BufRead,BufNewFile *.jbuilder setfiletype ruby
  au BufRead,BufNewFile Guardfile setfiletype ruby
  au BufRead,BufNewFile *.php setfiletype php
  au BufRead,BufNewFile *.swift setfiletype swift
augroup END
