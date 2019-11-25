#lang sicp

(define (from a b)
  (if (> a b) nil
      (cons a (from (+ 1 a) b))))

(define (accumulate combine init items)
  (if (null? items) init
      (combine (car items)
               (accumulate combine init (cdr items)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j)
                    (list i j))
                  (from 1 (- i 1))))
           (from 1 n)))

(define (filter keep? items)
  (cond ((null? items) nil)
        ((keep? (car items))
         (cons (car items) (filter keep? (cdr items))))
        (else (filter keep? (cdr items)))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter 
        prime-sum?
        (unique-pairs n))))

(define (make-pair-sum pair)
  (list (car pair) 
        (cadr pair) 
        (+ (car pair) (cadr pair))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (square x) (* x x))

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

(define (prime? n)
  (= n (smallest-divisor n)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))