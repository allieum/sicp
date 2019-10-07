#lang sicp

(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b) result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (raccumulate combiner null-value term a next b)
  (if (> a b) null-value
      (combiner (term a)
                (raccumulate combiner null-value term (next a) next b))))

(define (sum term a next b) (accumulate + 0 term a next b))
(define (product term a next b) (raccumulate * 1 term a next b))

(define (id x) x)
(define (sq x) (* x x))
(define (inc x) (+ x 1))
