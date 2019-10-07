#lang sicp

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder 
          (* base (expmod base (- exp 1) m))
          m))))

(define (passes-fermat? n)
  (define (iter a n)
    (cond ((= n 0)
           #t)
          ((= (remainder a n)
              (expmod a n n))
           (passes-fermat? (- n 1)))
          (else
           #f))
        #t)
  (iter n n))

(passes-fermat? 561)
(passes-fermat? 1105)
(passes-fermat? 1729)
(passes-fermat? 2465)
(passes-fermat? 2821)
(passes-fermat? 6601)