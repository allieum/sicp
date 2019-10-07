#lang sicp

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (identity x) x)
(define (iter x) (+ 1 x))

(sum identity 1 inc 4) ; == 10
