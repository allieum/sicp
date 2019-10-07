#lang sicp

; 3 * 4 == (3 - 1) * 4 + 4 == 2*4 + 4 == 1*8 + 4 == 12

(define (double x) (* x 2))
(define (halve x) (/ x 2))
(define (even? x) (= 0 (remainder x 2)))

(define (x a b)
  (define (iter a b c)
    (cond ((= a 0) c)
          ((even? a) (iter (halve a) (double b) c))
          (else (iter (- a 1) b (+ c b)))))
  (iter a b 0))

