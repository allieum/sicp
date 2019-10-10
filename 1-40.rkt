#lang sicp

(define (absdiff a b) (abs (- a b)))

(define (fixed-point f guess)
  (define (good-enough? g1 g2)
    (< (absdiff g1 g2) .0001))
  (let ((next-guess (f guess)))
    (if (good-enough? guess next-guess)
        guess
        (fixed-point f next-guess))))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define dx 0.0000000000001)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) 
            ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) 
               guess))

(define (square x) (* x x))
(define (cube x) (* x x x))

(define (cubic a b c)
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

(newtons-method (cubic 0 0 0) 1)