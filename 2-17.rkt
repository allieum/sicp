#lang sicp

(define (last-pair items)
  (let ((rest (cdr items)))
    (if (null? rest) (car items)
        (last-pair rest))))

(last-pair (list 23 72 149 34))