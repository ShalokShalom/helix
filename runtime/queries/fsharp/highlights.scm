; Modules
;--------

[(module_name) (module_type_name)] @namespace

; Types
;------

[(class_name) (class_type_name) (type_constructor)] @type

[(constructor_name) (tag)] @constructor

; Functions
;----------

(let_binding
  pattern: (value_name) @function
  (parameter))

(let_binding
  pattern: (value_name) @function
  body: [(fun_expression) (function_expression)])

(value_specification (value_name) @function)

(external (value_name) @function)

(method_name) @function.method

; Variables
;----------

(value_pattern) @variable.parameter

; Application
;------------

(infix_expression
  left: (value_path (value_name) @function)
  (infix_operator) @operator
  (#eq? @operator "@@"))

(infix_expression
  (infix_operator) @operator
  right: (value_path (value_name) @function)
  (#eq? @operator "|>"))

(application_expression
  function: (value_path (value_name) @function))

; Properties
;-----------

[(label_name) (field_name) (instance_variable_name)] @variable.other.member

; Constants
;----------

[(boolean) (unit)] @constant

[(number) (signed_number)] @constant.numeric.integer

(character) @constant.character

(string) @string

(quoted_string "{" @string "}" @string) @string

(escape_sequence) @constant.character.escape

[
  (conversion_specification)
  (pretty_printing_indication)
] @punctuation.special

; Keywords
;---------

[
  "abstract" "and" "as" "assert" "base" "begin" "class"
  "default" "delegate" "do" "done" "downcast" "end"
  "extern" "false" "finally" "fixed" "global" "in"
  "inherit" "inline" "interface" "internal" "lazy"
  "let" "let!" "" "match" "match!" "member" "module"
  "mutable" "namespace" "new" "not" "null" "of"
  "or" "override" "private" "public" "rec" "return"
  "return!" "select" "static" "struct" "true" "type"
  "upcast" "use" "use!" "val" "void" "virtual" "when"
  "with" "yield" "yield!" "const"

] @keyword

["fun" "function"] @keyword.function

["if" "then" "else" "elif"] @keyword.control.conditional

["exception" "try"] @keyword.control.exception

["open"] @keyword.control.import

["for" "to" "downto" "while" "done"] @keyword.control.repeat

; Macros
;-------

(attribute ["[@" "]"] @attribute)
(item_attribute ["[@@" "]"] @attribute)
(floating_attribute ["[@@@" "]"] @attribute)
(extension ["[%" "]"] @function.macro)
(item_extension ["[%%" "]"] @function.macro)
(quoted_extension ["{%" "}"] @function.macro)
(quoted_item_extension ["{%%" "}"] @function.macro)
"%" @function.macro

["(" ")" "[" "]" "{" "}" "[|" "|]" "[<" "[>"] @punctuation.bracket

(object_type ["<" ">"] @punctuation.bracket)

[
  "," "." ";" ":" "=" "|" "~" "?" "+" "-" "!" ">" "&"
  "->" ";;" ":>" "+=" ":=" ".."
] @punctuation.delimiter

; Operators
;----------

[
  (prefix_operator)
  (sign_operator)
  (infix_operator)
  (hash_operator)
  (indexing_operator)
  (let_operator)
  (and_operator)
  (match_operator)
] @operator

(match_expression (match_operator) @keyword)

(value_definition [(let_operator) (and_operator)] @keyword)

;; TODO: this is an error now
;(prefix_operator "!" @operator)

(infix_operator ["&" "+" "-" "=" ">" "|" "%"] @operator)

(signed_number ["+" "-"] @operator)

["*" "#" "::" "<-"] @operator

; Attributes
;-----------

(attribute_id) @variable.other.member

; Comments
;---------

[(comment) (line_number_directive) (directive) (shebang)] @comment

(ERROR) @error

; Blanket highlights
; ------------------

[(value_name) (type_variable)] @variable
