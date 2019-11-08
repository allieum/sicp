#lang sicp

(define (same-parity? a b) (= (remainder a 2) (remainder b 2)))

(define (filter items keep?)
  (cond ((null? items) nil)
        ((keep? (car items))
         (cons (car items) (filter (cdr items) keep?)))
        (else (filter (cdr items) keep?))))

(define (same-parity first . rest)
  (cons first (filter rest (lambda (nth) (same-parity? first nth)))))