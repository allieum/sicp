#lang sicp

(define (absdiff a b)
  (abs (- a b)))

(define (square x) (* x x))

(define (cube-root x)
  (define (improve guess)
    (/ (+ (/ x (square guess))
          (* 2 guess))
       3))
  (define (good-enough? guess)
    (= guess (improve guess)))
  (define (iter guess)
    (display guess)
    (newline)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  (iter 1.0))