#lang sicp

(define (for-each action items)
  (if (not (null? items))
      ((lambda ()
        (action (car items))
        (for-each action (cdr items))))))




