#lang sicp

(define (even? x) (= 0 (remainder x 2)))
(define (square x) (* x x))
(define (halve x) (/ x 2))

; 2^8 == (4)^4 == 16^2 == 32^1 == 32 * 32^0 = 32

(define (expt x y)
  (define (iter a b n)
    (cond ((= n 0) a)
          ((even? n) (iter a (square b) (halve n)))
          (else (iter (* a b) b (- n 1)))))
  (iter 1 x y))