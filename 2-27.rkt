#lang sicp

(define (deep-reverse items)
  (define (reverse-iter rest result)
    (if (null? rest) result
        ((lambda (item)
           (reverse-iter (cdr rest) (cons item result)))
         (if (pair? (car rest))
             (deep-reverse (car rest))
             (car rest)))))
  (reverse-iter items nil))

(define x 
  (list (list 1 2) (list 3 4)))

x
;((1 2) (3 4))

(reverse x)
;((3 4) (1 2))

(deep-reverse x)
;((4 3) (2 1))