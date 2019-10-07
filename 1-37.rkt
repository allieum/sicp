#lang sicp

(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
        (/ (n k) (d k))
        (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1))

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (/ (n i)
                 (+ (d i) result)))))
  (iter k 0))

; (1 + sqrt(5)) / 2
(define phi (/ (+ 1 (sqrt 5)) 2))

; logb(a) == ln(a) / ln(b)
; lol this detour wasn't relevant
(define (logb b)
  (lambda (a) (/ (log a) (log b))))
(define log10 (logb 10))
(define (digits n) (+ 1 (floor (log10 n))))


(define (n-sigfigs k value) (+ k (digits value)))


(define (get-sigfigs k value) (floor (* (expt 10 k) value)))
(define (roundk k n) (* (expt 10 (- k)) (get-sigfigs k n)))
(define (round4 n) (roundk 4 n))

; accurate to k decimal places
;(define (accurate? k test actual)
; (let ((sigfigs)))

(define (est-phi k)
  (/ 1 
     (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k)))

(define (ex1.37)
  (define (iter k)
    (if (= (round4 phi) (round4 (est-phi k)))
        k
        (iter (+ 1 k))))
  (iter 1))

; k must be at least 12 to approximate phi to 4 decimal places

; how many til it reaches precision limit?

(define (ex1.37bonus)
  (define (iter k)
    (if (= phi (est-phi k))
        k
        (iter (+ 1 k))))
  (iter 1))

