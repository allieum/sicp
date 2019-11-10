#lang sicp

; Suppose we evaluate the expression (list 1 (list 2 (list 3 4))).
; Give the result printed by the interpreter, the corresponding
; box-and-pointer structure, and the interpretation of this as a tree.

(list 1 (list 2 (list 3 4)))
; (1 (2 (3 4)))
(cons 1 (cons (list 2 (list 3 4)) nil))
(cons 1 (cons (cons 2 (cons (list 3 4) nil)) nil))
(cons 1
      (cons
       (cons 2
             (cons (cons 3 (cons 4 nil))
                   nil))
       nil))

; 1 | .
;     |
;     |
;     . | X
;     |
;     |
;     2 | .
;         |
;         |
;         . | X
;         |
;         |
;         3 | .
;             |
;             |
;             4 | X


; (1 (2 (3 4)))
;      .
;     / \
;    /   \
;   1     \. (2 (3 4))
;         / \
;        /   \
;       2     \. (3 4)
;             / \
;            /   \
;           3     4