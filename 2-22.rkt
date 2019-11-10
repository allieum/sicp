#lang sicp

(define (square x) (* x x))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))
; the answer list is produced in reverse order because cons adds each element
; to the front of the result

(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square 
                     (car things))))))
  (iter items nil))
; swapping the arguments to cons doesn't work because we end up with a pair
; structure that is not a conventional list: (((), a^2), b^2), ...