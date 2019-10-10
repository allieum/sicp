#lang sicp

(define (inc x) (+ 1 x))

(define (double f) (lambda (x) (f (f x))))

;((double double) f)
;(double (double f))
;(double f(f()))
;f(f(f(f(x)))))

;(double (double double))
;(double double(double(?)))
;(double (double (double (double inc))))
;(double (double (double add2)))
;(double (double add4))
;(double add8)
;add16

; should be 13? nope. it's 21, see above
(((double (double double)) inc) 5)

; also consider
(define quadruple (double double))

; ((quadruple inc) 1)
; 5

; then we can restate the above as
;(((double quadruple) inc) 5)
;((quadruple (quadruple inc)) 5)
;((quadruple add4) 5)
;(add16 5)


