; Mustache template highlighting

; Opening tags
(open_block) @tag
(open_inverted_block) @tag
(close_block) @tag

; Variable names in blocks
(block_name) @variable

; Standalone variables
(variable) @variable

; Text content
(text) @text

; Delimiters
("{" @punctuation.delimiter
"}") @punctuation.delimiter

