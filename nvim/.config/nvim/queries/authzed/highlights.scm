((relation_literal) @keyword)


((perm_expression) (identifier) @operator)

(block (identifier) @function)
(block (identifier) (identifier) @type)

((permission (permission_literal) @variable.builtin))

((perm_expression) @operator)

[
  (rel_expression)
  (perm_expression)
] @function

[
 (plus_literal)
 (pipe_literal)
] @punctuation

(comment) @comment
