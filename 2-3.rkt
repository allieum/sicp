#lang sicp

(define make-segment cons)
(define start-segment car)
(define end-segment cdr)

(define make-point cons)
(define x-point car)
(define y-point cdr)

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (magnitude seg) (distance (start-segment seg) (end-segment seg)))

(define (square x) (* x x))

(define (distance p1 p2) (sqrt (+ (square (abs (- (x-point p1) (x-point p2))))
                                  (square(abs (- (y-point p1) (y-point p2)))))))

;;
;; implementation 1: rectangles as 4 points
;;

;(define (make-rect p1 p2 p3 p4)
;  (cons (cons p1 p2)
;        (cons p3 p4)))
;(define (dims rect) 
;  (let ((d1 (distance (get-p1 rect) (get-p2 rect)))
;        (d2 (distance (get-p2 rect) (get-p3 rect))))
;   (cons (max d1 d2) (min d1 d2))))
;(define (len rect) (car (dims rect)))
;(define (width rect) (cdr (dims rect)))
;(define unit-square (make-rect (make-point 0 0) (make-point 1 0)
;                               (make-point 1 1) (make-point 0 1)))

;;
;; implementation 2: rectangles as 2 adjacent segments
;;  

(define (make-rect s1 s2) (cons s1 s2))
(define (len rect) (max (magnitude (car rect)) (magnitude (cdr rect))))
(define (width rect) (min (magnitude (car rect)) (magnitude (cdr rect))))
(define 2square (make-rect (make-segment (make-point 0 0) (make-point 2 0))
                           (make-segment (make-point 0 0) (make-point 0 2))))


; area and perim same for both. depend on len and width selectors.
(define (area rect) (* (len rect) (width rect)))
(define (perim rect) (+ (* 2 (len rect)) (* 2 (width rect))))

(area 2square)
(perim 2square)