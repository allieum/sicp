#lang sicp

(define (even? n) (= 0 (remainder n 2)))

(define (square n) (* n n))

(define (expmod base exp m)
  (define (modsquare-or-bust n)
    (define (square-or-zero-depending n-squared)
      (if (and (= 1 n-squared)
               (> n 1)
               (< n (- m 1)))
          0
          n-squared))
    (square-or-zero-depending (remainder (square n) m)))
  (cond ((= exp 0) 1)
        ((even? exp) (modsquare-or-bust (expmod base (/ exp 2) m)))
        (else
         (remainder 
          (* base (expmod base (- exp 1) m))
          m))))

(define (rabin-miller-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (or (= n 1)
      (try-it (+ 1 (random (- n 1))))))

(define (>= a b) (or (> a b) (= a b)))
  
(define (is-prime? n)
  (define (iter i passed-tests)
    (cond ((= 0 i)
           (>= (/ passed-tests n) 0.5))
          ((rabin-miller-test i n)
           (iter (- i 1) (+ passed-tests 1)))
          (else
           (iter (- i 1) passed-tests))))
  (iter (- n 1) 0))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((rabin-miller-test n) 
         (fast-prime? n (- times 1)))
        (else false)))
