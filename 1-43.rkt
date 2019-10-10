#lang sicp

(define (square x) (* x x))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (define (iter n result)
    (if (= n 0) result
        (iter (- n 1) (f result))))
  (lambda (x)
    (iter n x)))

(define (repeated-alt f n)
  (define (iter n result)
    (if (= n 1) result
        (iter (- n 1) (compose f result))))
  (iter n f))

((repeated square 2) 5)
((repeated-alt square 2) 5)


(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b) result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (inc x) (+ x 1))
(define (id x) x)
(define (unary x) (lambda (y) x))

; oh fuck oh wow
(define (repeated-god f n)
  (accumulate compose f (unary f) 2 inc n))

((repeated-god square 2) 5)


