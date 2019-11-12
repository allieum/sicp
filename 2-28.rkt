#lang sicp

(define subtree? pair?)

(define (fringe tree)
  (if (null? tree) nil
      (let ((node (car tree))
            (fringe-rest (fringe (cdr tree))))
        (if (subtree? node) (append (fringe node) fringe-rest)
            (cons node fringe-rest)))))

(define x 
  (list (list 1 2) (list 3 4)))

(fringe x)
;(1 2 3 4)

(fringe (list x x))
;(1 2 3 4 1 2 3 4)
