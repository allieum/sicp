#lang sicp

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)
; 1024
(A 2 4)
; 65536
(A 3 3)
; 65536

; (A 0 n) = 2n


(define (f n) (A 0 n))
; f(n) = 2 * n
(define (g n) (A 1 n))
; g(n) = 2 ^ n
(define (h n) (A 2 n))
; h(n) = 2 ^ 2 ^ ... n times
(define (k n) (* 5 n n))
; k(n) = 5n^2


; (A 1 n)
; (A 0
;    (A 1 (- n 1)))
; (A 0
;    (A 0
;       (A 1 (- n 2))))
; (A 0
;    ... n - 1 times
;        ... (A 1 (- n (- n 1)))
; (A 0
;    ... n - 1 times
;        ... (A 1 1) = 2
; 2 * 2 * ... (n - 1 times) * 2 == 2^(n - 1) * 2 == 2^n

; (A 2 n) --> h(n)
; (A 1
;    (A 2 (- n 1))) ---> h(n - 1)
; h(n) = 2 ^ h(n - 1)   ==> h(n - 1) = 2 ^ h(n - 2)
; h(n) = 2 ^ (2 ^ h(n - 2))
; h(n) = 2 ^ 2 ^ ... n-1 times ^ h(n - (n-1))
; h(n) = 2 ^ 2 ^ ... n-1 times ^ h(1)
; h(n) = 2 ^ 2 ^ ... n-1 times ^ 2
; h(n) = 2 ^ 2 ^ ... (n times)