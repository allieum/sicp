#lang sicp

(define (filtered-accumulate combiner null-value term filter a next b)
  (define (iter a result)
    (if (> a b) result
        (iter (next a)
              (if (filter a) (combiner result (term a))
                  result))))
  (iter a null-value))


(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) 
         n)
        ((divides? test-divisor n) 
         test-divisor)
        (else (find-divisor 
               n 
               (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square x) (* x x))

(define (inc x) (+ 1 x))

(define (id x) x)

(define (prime? n)
  (= n (smallest-divisor n)))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (sum-squared-primes a b)
  (filtered-accumulate + 0 square prime? a inc b))

(define (multiply-lesser-relative-primes n)
  (define (relatively-prime? a) (= 1 (gcd a n)))
  (filtered-accumulate * 1 id relatively-prime? 2 inc (- n 1)))

