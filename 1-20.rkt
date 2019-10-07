#lang sicp

; (double 

; normal order
;
; (gcd 206 40)
; (gcd 40 (remainder 206 40))
;   (if (= (remainder 206 40) 0)) --> 1
;
; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;  (if (= (remainder 40 (remainder 206 40)) 0)) --> 2
;
; (gcd (remainder 40 (remainder 206 40))
;      (remainder (remainder 206 40)
;                 (remainder 40 (remainder 206 40))))
; (if (= 0 (remainder (remainder 206 40)
;                     (remainder 40 (remainder 206 40)))))
; ... (remainder 6 (remainder 40 6)) == (remainder 6 4) == 2 ---> 4
;
;(gcd (remainder (remainder 206 40)
;                (remainder 40 (remainder 206 40)))
;     (remainder (remainder 40 (remainder 206 40))
;                (remainder (remainder 206 40)
;                (remainder 40 (remainder 206 40))) ----> 7
; (if (= 0 (remainder (remainder 40 (remainder 206 40))
;                     2)))
; ... (remainder (remainder 40 6) 2) == (remainder 4 2) == 0
;
; evaluate a:  (remainder (remainder 206 40)
;                         (remainder 40 (remainder 206 40))) ---> 4
;
; total remainder invocations: 1 + 2 + 4 + 7 + 4 == 18

; applicative order
;(gcd 206 40)
;(gcd 40 (remainder 206 40))
;(gcd 40 6)
;(gcd 6 (remainder 40 6))
;(gcd 6 4)
;(gcd 4 (remainder 6 4))
;(gcd 4 2)
;(gcd 2 (remainder 4 2))
;(gcd 2 0) == 2

; total remainder invocations: 4

