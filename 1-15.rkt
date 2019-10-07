#lang sicp

; from book
(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

; how many times is p applied when we evaluate (sine 12.15) ?

; 12.15 / 3^n <= .1
; 121.5 <= 3^n

; (sine 12.15) apply p          
; (sine 4.05) apply p
; (sine 1.349) apply p
; (sine .4496) apply p
; (sine .15) apply p
; (sine .05) return .05
; 5 times

; time and space: O(log3(n))