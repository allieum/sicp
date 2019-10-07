#lang sicp

(define (double x) (+ x x))
(define (halve x) (/ x 2))
(define (even? x) (= 0 (remainder x 2)))

(define (* a b)
  (cond ((= a 0)
         0)
        ((even? a)
         (* (halve a) (double b)))
        (else
         (+ b (* (- a 1) b)))))