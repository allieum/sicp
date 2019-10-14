#lang sicp

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define (+ a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

one(f)(one(f)(x))

; one:
;
;(add-1 zero)
;
;(add-1 (lambda (f) (lambda (x) x)))
;
;(lambda (f) (lambda (x) (f (((lambda (f)
;                               (lambda (x) x))
;                             f) x))))
;
;(lambda (f) (lambda (x) (f ((lambda (x) x) x))))
;

(define one (lambda (f) (lambda (x) (f x))))

; one(f)(x) == f(x). spooky.

; two:
;
;(add-1 one)
;
;(add-1 (lambda (f) (lambda (x) (f x))))
;
;(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x)))
;                             f) x))))
;
;(lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

; two(f)(x) == f(f(x))

(define (divides? a b) (= 0 (remainder a b)))

(define (n-factors n)
  (lambda (x)
    (define (iter acc result)
      (if (divides? acc n)
          (iter (/ acc n) (+ 1 result))
          result))
    (iter x 0)))

(define log2 (n-factors 2))

; zero(f)(x) = x
; one(f)(x) = f(x)
; two(f)(x) = f(f(x))
;
; let f = inc and x = 0
(define (convert church-numeral) ((church-numeral inc) 0))

