if exists("b:current_syntax")
  finish
endif

" Ignored
syn match hextIgnored /.*/

" Hex
syn match hextHex /^\([0-9a-fA-F]\|\s\)\+$/

" Command
syn match hextCommand /^\s*\/.*$/

" Comment
syn match hextIgnored /^\s*\/\/.*$/

" String
syn match hextString /^\s*\/".*$/

hi def link hextIgnored Comment
hi def link hextHex Number
hi def link hextCommand Statement
hi def link hextString String

let b:current_syntax = "hext"
