(number_literal) @number

(string_literal) @string

(char_literal) @string

(boolean_literal) @constant.builtin

(comment) @comment

(module_definition name: (identifier) @type)

(function_definition name: (identifier) @function)

(type name: (identifier) @type)

(tick_identifier) @type

(parameter
  name: (identifier) @variable.parameter
  ":" @punctuation.delimiter)

["("
 ")"
 "["
 "]"
;  "{"
;  "}"
 ] @punctuation.bracket

[";"] @punctuation.delimiter

["module"
 "end"
 "fun"
 "in"
 "do"] @keyword
;(function_definition name: (identifier) @function)
