#lang sicp

(define (accumulate combine init items)
  (if (null? items) init
      (combine (car items)
               (accumulate combine init (cdr items)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

