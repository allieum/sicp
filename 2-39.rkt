#lang sicp

(define (fold-right combine init items)
  (if (null? items) init
      (combine (car items)
               (fold-right combine init (cdr items)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (rreverse sequence)
  (fold-right
   (lambda (x y) (append y (list x))) nil sequence))

(define (lreverse sequence)
  (fold-left
   (lambda (x y) (cons y x)) nil sequence))
