#lang sicp

(define (next a b c)
  (+ a (* 2 b) (* 3 c)))

(define (f n)
  (if (< n 3)
      n
      (next (f (- n 1))
            (f (- n 2))
            (f (- n 3)))))

(define (ef n)
  (define (ef-iter count a b c)
    (if (= count 0)
        c
        (ef-iter (- count 1)
                 (next a b c)
                 a
                 b)))
  (ef-iter n 2 1 0))