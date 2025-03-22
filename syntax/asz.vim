if exists("b:current_syntax")
  finish
endif

syn region aszComment start="#\|;" end="$"

" Keywords
syn keyword aszKeyword fn local block label break continue cond_break cond_continue ncond_break ncond_continue end

syn keyword aszInstruction add addf sub subf mul mulf div divf mod modf neg negf
syn keyword aszInstruction equal equalf less lessf greater greaterf
syn keyword aszInstruction set mov move 
syn keyword aszInstruction jmp jump branch nbranch call ret int_to_str stderr stdout stdin exit

" Functions
syn match aszIdentifier "\<[a-zA-Z_][a-zA-Z0-9_]\+\>"
syn match aszPunct "[,\(\)]\+"

" Numbers
" Integers
syn match aszNumber "\<[+-]\?\d[0-9_]*\>"
syn match aszNumber "\<[+-]\?0b[0-1][0-1_]*\>"
syn match aszNumber "\<[+-]\?0o[0-7][0-7_]*\>"
syn match aszNumber "\<[+-]\?0x[0-9a-fA-F][0-9a-fA-F_]*\>"
" Floats
syn match aszNumber "\<[+-]\?\d[0-9_]*\.[0-9_]*\>"
syn match aszNumber "\<[+-]\?\.\d[0-9_]*\>"
" Floats (scientific notation)
syn match aszNumber "\<[+-]\?\d[0-9_]*[eE][+-]\?\d[0-9_]*\>"
syn match aszNumber "\<[+-]\?\d[0-9_]*\.[0-9_]*[eE][+-]\?\d[0-9_]*\>"
syn match aszNumber "\<[+-]\?\.\d[0-9_]*[eE][+-]\?\d[0-9_]*\>"

" Strings
syn match aszString "\"\([^\"\\]\|\(\\[ntsr\"\\]\)\)*\""

hi def link aszKeyword Keyword
hi def link aszInstruction Function
hi def link aszIdentifier Identifier
hi def link aszPunct Operator
hi def link aszNumber Number
hi def link aszString String
hi def link aszComment Comment

let b:current_syntax = "asz"
