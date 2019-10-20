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

;2.8
;
;(1, 2) - (-2, 1) = (0, 4)
;(1, 2) + (-1, 2) = (0, 4)
(define (sub-interval x y) (add-interval x (make-interval
                                            (- (upper-bound y))
                                            (- (lower-bound y)))))
;(sub-interval (make-interval 1 2) (make-interval -2 1))

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

; 2.9
;
; i1 = (a,b)     i2 = (c,d)
;
; w1 = (b-a)/2   w2 = (d-c)/2
;
;(a,b) + (c,d) = (a+c, b+d)
; w_sum = (b+d - a+c)/2
;       = (b-a + d-c)/2
;       = (2*w1 + 2*w2)/2
;       = w1 + w2
;
;(a,b) - (c,d) = (a-d, b-c)/2
; w-sub = (b-c - a-d)/2
;       = (b-a + d-c)/2
;       = w1 + w2
;
; for addition and subtraction, the width of the result is the sum of
; the widths of the operands.

; in these two examples, the widths of the operands are all the same,
; but widths of the results are different.
;(mul-interval (make-interval 1 2) (make-interval -1 0))
;(mul-interval (make-interval 1 2) (make-interval -11 -10))

; same here. so, it's not a function of only the widths for mult/div
;(div-interval (make-interval 3 4) (make-interval 5 6))
;(div-interval (make-interval 1 2) (make-interval 10 11))

; 2.11
;
; break mul-interval into nine cases, one of which requires more than two mults
;
; (a, b) * (c, d)
;
; all positive: (a*c, b*d)
; all negative: (b*d, a*c)
;
; a=0, b: 0, b*c, b*d (min, max) (works w/ any zero)
;
; a<0: (a*d, b*d)   single negative
;
; a<0,b<0: (a*d, b*a)
; 
; a,b,c<0: (a*d, a*c)
;
; a,c<0: (min(a*d, b*c), max(a*c, b*d))

(define (>= a b) (or (= a b) (> a b)))

(define (pos? i) (and (>= (lower-bound i) 0)
                      (>= (upper-bound i) 0)))
(define (neg? i) (and (< (lower-bound i) 0)
                      (< (upper-bound i) 0)))
(define (both-pos? x y) (and (pos? x) (pos? y)))
(define (both-neg? x y) (and (neg? x) (neg? y)))
(define (has-zero-end? i) (or (= 0 (lower-bound i))
                              (= 0 (upper-bound i))))
(define (get-nonzero a b) (if (= a 0) b a))

(define (mul-interval-wat x y)
  (define (handle-same-sign x y)
    (let ((m (* (lower-bound x) (lower-bound y)))
          (n (* (upper-bound x) (upper-bound y))))
      (make-interval (min m n) (max m n))))
  (let ((a (lower-bound x))
        (b (upper-bound x))
        (c (lower-bound y))
        (d (upper-bound y)))
    (cond ((or (both-pos? x y)
               (both-neg? x y))
           (handle-same-sign x y))
          ((and (neg? x) (spans-zero? y))
           (make-interval (* a d) (* a c)))
          ((and (neg? y) (spans-zero? x))
           (make-interval (* b c) (* c a)))          
          ((spans-zero? x)
           (make-interval (* a d) (* b d)))
          ((spans-zero? y)
           (make-interval (* c b) (* d b)))
          ((and (neg? x) (pos? y))
           (make-interval (* a d) (* a c)))
          ((and (pos? y) (neg? x))
           (make-interval (* c b) (* c a)))
          ((and (< a 0) (< c 0))
           (make-interval (min (* a d) (* b c))
                          (max (* a c) (* b d)))))))

(define i (make-interval 1 2))
(define j (make-interval -3 -1))
(define k (make-interval -1 3))
(define l (make-interval 0 4))

(mul-interval i i)
(mul-interval-wat i i)

(mul-interval i l)
(mul-interval-wat i l)

(mul-interval j k)
(mul-interval-wat j k)

(mul-interval k l)
(mul-interval-wat k l)


