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

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (r) (dot-product v r)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

; (1 2 3)     (1 2)     
; (4 5 6)  *  (3 4)  =  
;             (5 6)

(define (matrix-*-matrix m n)
  (let ((cols (transpose n))
        (rows m))
    (map (lambda (row)
           (map (lambda (col)
                  (dot-product row col))
                cols))
         rows)))