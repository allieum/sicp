#lang sicp

(define (reverse items)
  (define (reverse-iter rest result)
    (if (null? rest) result
        (reverse-iter (cdr rest) (cons (car rest) result))))
  (reverse-iter items nil))