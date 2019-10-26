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

; 12.13
;
; all positive:
; (t1, c1) * (t2, c2)
;     
; lb: (c1 - c1*t1) * (c2 - c2*t2)
;     c1*c2 - c1*c2*t2 - c1*c2*t1 + c1*c2*t1*t2
;
; ub: (c1 + c1*t1) * (c2 + c2*t2)
;     c1*c2 + c1*c2*t2 + c1*c2*t1 + c1*c2*t1*t2
;
; ub - lb: 2 * (c1*c2*t2 + c1*c2*t1)
; width = c1*c2*t2 + c1*c2*t1 = c1c2(t1 + t2)
; ub + lb: 2 * (c1*c2 + c1*c2*t1*t2)
; center = c1*c2 + c1*c2*t1*t2 = c1c2(1 + t1t2)
;
; tolerance = width / center
; tolerance = (t1 + t2) / (1 + t1*t2)
;
;
; if we assume t1 and t2 are small, t1*t2 ~= 0
; so tolerance ~= t1 + t2

(define (tolerance-of-product i1 i2)
  (let ((t1 (percent i1))
        (t2 (percent i2)))
    (/ (+ t1 t2)
       (+ 1 (* t1 t2)))))

(define i1 (make-center-percent 50 .99))
(define i2 (make-center-percent 25 .99))

(percent (mul-interval i1 i2))
(tolerance-of-product i1 i2)