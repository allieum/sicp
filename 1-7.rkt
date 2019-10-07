#lang sicp

(define (avg a b)
  (/ (+ a b) 2.0))

(define (absdiff a b)
  (abs (- a b)))

(define (square x) (* x x))

(define (square-root x)
  (define (improve guess)
    (avg guess (/ x guess)))
  (define (good-enough? guess)
    (= guess (improve guess)))
  (define (iter guess)
    (display guess)
    (newline)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  (iter 1))