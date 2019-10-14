#lang sicp

(define (divides? a b) (= 0 (remainder a b)))

(define (n-factors n)
  (lambda (x)
    (define (iter acc result)
      (if (divides? acc n)
          (iter (/ acc n) (+ 1 result))
          result))
    (iter x 0)))

(define two-factors (n-factors 2))
(define three-factors (n-factors 3))

(define (cons a b) (* (expt 2 a) (expt 3 b)))
(define (car c) (two-factors c))
(define (cdr c) (three-factors c))
    