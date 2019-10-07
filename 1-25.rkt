#lang sicp

(define (even? n) (= 0 (remainder n 2)))

(define (square x) (* x x))

(define (fast-expt b n)
  (cond ((= n 0) 
         1)
        ((even? n) 
         (square (fast-expt b (/ n 2))))
        (else 
         (* b (fast-expt b (- n 1))))))

(define (expmod-slow base exp m)
  (remainder (fast-expt base exp) m))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder 
          (* base (expmod base (- exp 1) m))
          m))))

; the numbers get too big!

(expmod 2^6 2^100 3)
(remainder (square  ; exp counts down 2^100 2^99 ...
            (remainder (square
                        (remainder (square
                                    ;...
                                     (remainder (square (remainder (* 2^6 1) 3))))))(
                               )))))

;a^n mod m --> end up taking a mod m,,, then successive squaring, keeping under n after each.
; max intermediate value is a^2 and squaring is pretty fast dawg its n^2 in number of digits in
; the naive case. also loggy2 w.r.t. exponent