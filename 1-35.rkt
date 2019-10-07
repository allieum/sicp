#lang sicp

(define (absdiff a b) (abs (- a b)))

(define (fixed-point f guess)
  (define (good-enough? g1 g2)
    (< (absdiff g1 g2) .0001))
  (let ((next-guess (f guess)))
    (if (good-enough? guess next-guess)
        guess
        (fixed-point f next-guess))))

; show that golden ratio is fixed point of x -> 1 + 1/x
;
; golden ratio = (1 + sqrt(5)) / 2 = g
;
; g^2 = g + 1     (divide by g)
;  g  = g/g + 1/g
;  g  = 1 + 1/g    suggests g is fixed point of above thingy
;
;
; let x = golden ratio:
;
; 1 + 1/g == 1 + 2 / (1 + sqrt(5))
;         == 1 + 2 / (1 + sqrt(5)) * (1 - sqrt(5)) / (1 - sqrt(5))
;         == 1 + 2(1 - sqrt(5)) / (1 - 5)
;         == 1 - (1 - sqrt(5))/2
;         == (2 - 1 + sqrt(5))/2
;         == (1 + sqrt(5))/2 == g
;
;  QED, g is a fixed point of x -> 1/x
;

(define (golden-ratio) (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))
  