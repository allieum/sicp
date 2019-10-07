#lang sicp

(define (square x) (* x x))

(define (sum-of-squares a b) (+ (square a) (square b)))

(define (<= a b) (not (> a b)))

(define (ex-1-3 a b c)
  (define (is-smallest? n) (and (<= n a) (<= n b) (<= n c)))
  (cond ((is-smallest? a) (sum-of-squares b c))
        ((is-smallest? b) (sum-of-squares a c))
        ((is-smallest? c) (sum-of-squares a b))))

(= 26 (ex-1-3 1 1 5))
(= 29 (ex-1-3 1 2 5))
(= 25 (ex-1-3 3 3 4))
(= 41 (ex-1-3 4 3 5))