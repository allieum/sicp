#lang sicp

(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  iter)

(define (absdiff a b) (abs (- a b)))
(define (square x) (* x x))
(define (average a b) (/ (+ a b) 2))
(define (close-enough? a b) (< (absdiff a b) .000001))

(define (sqrt x)
  ((iterative-improve (lambda (y)
                        (close-enough? x (square y)))
                      (lambda (y)
                        (average y (/ x y))))
   1.0))

(define (fixed-point f guess)
  ((iterative-improve (lambda (x) (close-enough? x (f x)))
                      f)
   guess))

(sqrt 4)

; golden ratio
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)