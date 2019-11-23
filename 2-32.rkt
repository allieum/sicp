#lang sicp

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s)))
            (first (car s)))
        (append rest (map (lambda (subset) (cons first subset))
                          rest)))))

; This works by first recursively computing all the subsets of s without
; the first element. We can then express the result as the combination of
; all the subsets that don't include the first element, along with all the
; subsets that do include the first element, which we get by simply adding
; the first element to each of the other subsets.