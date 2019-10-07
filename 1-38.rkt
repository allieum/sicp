#lang sicp

; N_i = 1
; D_i = 1, 2, 1, 1, 4, 1, 1, 6, ...
;     = ceiling(i / 3) * 2  if i%3 = 2 else 1

(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (/ (n i)
                 (+ (d i) result)))))
  (iter k 0))

(define (est-e-minus2 k)
  (cont-frac (lambda (i) 1)
             (lambda (i)
               (if (= 2 (remainder i 3))
                   (* 2 (ceiling (/ i 3)))
                   1))
             k))
(define (est-e k) (+ 2.0 (est-e-minus2 k)))
