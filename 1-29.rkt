#lang sicp

(define (sum term a next b)
  (define (iter-sum a)
    (if (> a b)
        0
        (+ (term a) (iter-sum (next a)))))
  (iter-sum a))

(define (inc x) (+ 1 x))
(define (square x) (* x x))
(define (identity x) x)
(define (even? x) (= 0 (remainder x 2)))

(define (integral f a b n)
  (define (integral-inner h)
    (define (y k) (f (+ a (* k h))))
    ; y0 + 4y1 + 2y2 + 4y3 + ... + 2yn-2 + 4yn-1 + yn
    (define (simpsons-coefficient k)
      (cond ((or (= k 0) (= k n)) 1)
            ((even? k) 2)
            (else 4)))
    (define (term k) (* (simpsons-coefficient k) (y k)))
    (* (/ h 3)
       (sum term 0 inc n)))
  (integral-inner (/ (- b a) n)))

(define (cube x) (* x x x))