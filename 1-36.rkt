#lang sicp

(define (absdiff a b) (abs (- a b)))
(define (average a b) (/ (+ a b) 2))

(define (fixed-point f guess)
  (define (good-enough? g1 g2)
    (< (absdiff g1 g2) .0001))
  (display guess)
  (newline)
  (let ((next-guess (f guess)))
    (if (good-enough? guess next-guess)
        guess
        (fixed-point f next-guess))))

(define (damped-fixed-point f guess)
  (fixed-point (lambda (x) (average x (f x))) guess))

(define (f x) (/ (log 1000) (log x)))

(define (s-no-damp) (fixed-point f 2.0))
(define (s-w-damp) (damped-fixed-point f 2.0))

; w/ damping, takes maybe 1/4 of the steps