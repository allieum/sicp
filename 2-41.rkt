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

(define (sum xs) (accumulate + 0 xs))

(define (unique-triples n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k)
                               (list i j k))
                             (from 1 (- j 1))))
                      (from 1 (- i 1))))
           (from 1 n)))

(define (filter keep? items)
  (cond ((null? items) nil)
        ((keep? (car items))
         (cons (car items) (filter keep? (cdr items))))
        (else (filter keep? (cdr items)))))

(define (cute-triples n s)
  (filter (lambda (triple)
            (= s (sum triple)))
          (unique-triples n)))