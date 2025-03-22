if exists("b:current_syntax")
  finish
endif

" set commentstring=#\ %s

" Keywords
syn keyword fmlDirective include nil true end
syn keyword fmlMacro dup swap dtor rtod load open_lambda call jump inc dec def def_value switch cond type_of print debug
syn keyword fmlMacro make_vec make_bytevec make_symbolmap vec_push map_put map_get

" Functions
syn match fmlSymbol "[^!#$%&'()*+,-./:;<=>?@\[\]^`{|}~ \t\n\"\\]\+"
syn match fmlPunct "[!#$%&'()*+,-./:;<=>?@\[\]^`{|}~]\+"

" Numbers
" Integers
syn match fmlNumber "\<[+-]\?\d[0-9_]*\>"
syn match fmlNumber "\<[+-]\?0b[0-1][0-1_]*\>"
syn match fmlNumber "\<[+-]\?0o[0-7][0-7_]*\>"
syn match fmlNumber "\<[+-]\?0x[0-9a-fA-F][0-9a-fA-F_]*\>"
" Floats
syn match fmlNumber "\<[+-]\?\d[0-9_]*\.[0-9_]*\>"
syn match fmlNumber "\<[+-]\?\.\d[0-9_]*\>"
" Floats (scientific notation)
syn match fmlNumber "\<[+-]\?\d[0-9_]*[eE][+-]\?\d[0-9_]*\>"
syn match fmlNumber "\<[+-]\?\d[0-9_]*\.[0-9_]*[eE][+-]\?\d[0-9_]*\>"
syn match fmlNumber "\<[+-]\?\.\d[0-9_]*[eE][+-]\?\d[0-9_]*\>"

" Strings
syn match fmlString "\"\([^\"\\]\|\(\\[ntsr\"\\]\)\)*\""

" Comment
syn match fmlComment "(\*.*\*)"

hi def link fmlComment Comment
hi def link fmlDirective Keyword " Keyword
hi def link fmlMacro Macro " Keyword
hi def link fmlSymbol Identifier
hi def link fmlPunct Operator
hi def link fmlNumber Number
hi def link fmlString String

let b:current_syntax = "fml"
