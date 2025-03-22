if exists("b:current_syntax")
  finish
endif

set commentstring=#\ %s

syn iskeyword 33,36-38,42-43,45-58,60-90,92,94-95,97-122,124,126

" Comment
syn match pfxComment /#.*/

" Keywords
syn keyword ptxMacro module composit fn if elif else while ref make := -> <- transmute

" Operators
syn keyword ptxOperator + - * / rem neg inc dec and or xor << >> ~>> not = not= < <= > >= byte+ byte-

" Builtins
syn keyword ptxBuiltin copy over drop 2drop swap 2swap call
syn keyword ptxPointer @u8 @s8 @u16 @s16 @u32 @s32 @u64 @s64 @f64 !u8 !s8 !u16 !s16 !u32 !s32 !u64 !s64 !f64

" Types
syn keyword ptxType bool int float char ptr str

" Functions
syn match ptxFunction "\<[a-zA-Z0-9+-\*/%<>=&|^!?_.:@$~]\+\>"

" Literals
" Bools
syn keyword ptxBool true false
" Integers
syn match ptxNumber "\<[+-]\?\d[0-9_]*\>"
syn match ptxNumber "\<[+-]\?0b[0-1][0-1_]*\>"
syn match ptxNumber "\<[+-]\?0o[0-7][0-7_]*\>"
syn match ptxNumber "\<[+-]\?0x[0-9a-fA-F][0-9a-fA-F_]*\>"
" Floats
syn match ptxNumber "\<[+-]\?\d[0-9_]*\.[0-9_]*\>"
syn match ptxNumber "\<[+-]\?\.\d[0-9_]*\>"
" Floats (scientific notation)
syn match ptxNumber "\<[+-]\?\d[0-9_]*[eE][+-]\?\d[0-9_]*\>"
syn match ptxNumber "\<[+-]\?\d[0-9_]*\.[0-9_]*[eE][+-]\?\d[0-9_]*\>"
syn match ptxNumber "\<[+-]\?\.\d[0-9_]*[eE][+-]\?\d[0-9_]*\>"
" Chars
syn match ptxChar "\<\\.\>"
syn match ptxChar "\<\\u[0-9a-fA-F]\{1,6}\>"
syn match ptxChar "\<\\newline\>"
syn match ptxChar "\<\\space\>"
syn match ptxChar "\<\\tab\>"
syn match ptxChar "\<\\formfeed\>"
syn match ptxChar "\<\\backspace\>"
syn match ptxChar "\<\\return\>"
" Strings
syn match ptxString "\"\([^\"\\]\|\(\\[nstfbr\"\\]\)\)*\""

hi def link pfxComment Comment
hi def link ptxMacro Keyword
hi def link ptxOperator Operator
hi def link ptxBuiltin Special
hi def link ptxPointer Special
hi def link ptxType Type
hi def link ptxFunction Identifier
hi def link ptxBool Boolean
hi def link ptxNumber Number
hi def link ptxChar Character
hi def link ptxString String

let b:current_syntax = "ptx"
