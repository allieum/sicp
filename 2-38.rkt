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

(fold-right / 1 (list 1 2 3))
; 1 / ( 2 / 3 ) = 3/2
(fold-left / 1 (list 1 2 3))
; (1 / 2) / 3 = 1/6
(fold-right list nil (list 1 2 3))
; (1 (2 (3 ())))
(fold-left list nil (list 1 2 3))
; (((() 1) 2) 3)

; fold-left and fold-right will produce the same result if op satisfies
; the associative property (ie order of operations does not matter).