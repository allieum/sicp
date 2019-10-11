#lang sicp

(define (inc x) (+ x 1))
(define (unary x) (lambda (y) x))

(define (compose f g)
  (lambda (x)
    (f (g x))))


(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b) result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (repeated f n)
  (accumulate compose f (unary f) 2 inc n))

(define dx 0.000001)

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))

(define (square x) (* x x))

(define (nfoldsmooth f n)
  ((repeated smooth n) f))