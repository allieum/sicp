#lang sicp

(define (product term a next b)
  (define (piter a result)
    (if (> a b)
        result
        (piter (next a) (* (term a) result))))
  (piter a 1))

(define (rproduct term a next b)
  (if (> a b) 1
      (* (term a)
         (rproduct term (next a) next b))))

(define (sq x) (* x x))
(define (inc x) (+ 1 x))
(define (dec x) (- x 1))
(define (plus2 x) (+ 2 x))
(define (id x) x)

; pi / 4 = (2 * 4) / 3^2 * (4 * 6) / 5^2 * (6 * 8) / 7^2 ...
(define (approx-pi n)
  (define (term d)
    (/ (* (dec d) (inc d))
       (sq d)))
  (* 4
     (product term 3.0 plus2 n)))

(define (! n) (rproduct id 1 inc n))

