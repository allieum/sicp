#lang sicp

(define (make-interval a b) (cons a b))
(define (upper-bound i) (max (car i) (cdr i)))
(define (lower-bound i) (min (car i) (cdr i)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) 
                    (lower-bound y))
                 (+ (upper-bound x) 
                    (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) 
               (lower-bound y)))
        (p2 (* (lower-bound x) 
               (upper-bound y)))
        (p3 (* (upper-bound x) 
               (lower-bound y)))
        (p4 (* (upper-bound x) 
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (sub-interval x y) (add-interval x (make-interval
                                            (- (upper-bound y))
                                            (- (lower-bound y)))))

(define (spans-zero? i)
  (let ((a (lower-bound i))
        (b (upper-bound i)))
    (or (= a 0)
        (= b 0)
        (and (< a 0) (> b 0)))))

(define (div-interval x y)
  (if (spans-zero? y) (error "Cannot divide by interval that spans zero"))
  (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y)) 
                               (/ 1.0 (lower-bound y)))))

; above copied from previous exercises

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) 
        (upper-bound i)) 
     2))

(define (width i)
  (/ (- (upper-bound i) 
        (lower-bound i)) 
     2))

; tolerance = t = w / c
; w = t*c
(define (make-center-percent center tolerance)
  (make-center-width center (* tolerance center)))
(define (percent i) (/ (width i) (center i)))

(define (print i)
  (display (center i))
  (display ",")
  (display (percent i))
  (newline))

(define (par1 r1 r2)
  (div-interval 
   (mul-interval r1 r2)
   (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval 
     one
     (add-interval 
      (div-interval one r1) 
      (div-interval one r2)))))

(define A (make-center-percent 200000000 .000001))
(define B (make-center-percent 4 .1))

(print (div-interval A A))
(print (div-interval A B))

(print (par1 A B))
(print (par2 A B))

; 2-15: Eva is right. repeating a variable causes it to increase the
; uncertainty of the computation multiple times. our system treats
; multiple uses of a variable as multiple independently uncertain values,
; rather than a single uncertain value which is substituted multiple times
; in an expression.

; 2-16: we may get different answers with equivalent expressions because the
; laws of algebra that we're used to using for numbers do not always
; hold true for intervals. eg distributive law, thanks internet friend
;
; it's pretty hard to answer whether it's impossible to create an interval
; arithmetic package without this shortcoming. you'd maybe have to decide on
; some consistent rules about how algebra on intervals should behave, and also
; implement a symbolic arithmetic system that has a notion of identity to overcome
; the repeated variable problem from 2-15. *shrug*