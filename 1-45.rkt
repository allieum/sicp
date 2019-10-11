#lang sicp


(define (inc x) (+ x 1))
(define (unary x) (lambda (y) x))

(define (compose f g)
  (lambda (x)
    (f (g x))))


(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b) result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (repeated f n)
  (accumulate compose f (unary f) 2 inc n))

(define (absdiff a b) (abs (- a b)))

(define (fixed-point f guess)
  (define (good-enough? g1 g2) ;(= g1 g2))
    (< (absdiff g1 g2) .0001))
  (let ((next-guess (f guess)))
    (if (good-enough? guess next-guess)
        guess
        (fixed-point f next-guess))))

(define (average a b) (/ (+ b a) 2))

(define (average-damp f) (lambda (x) (average x (f x))))
(define (log2 x) (/ (log x) (log 2)))
(define (make-nth-root n)
  (lambda (x)
    (fixed-point ((repeated average-damp (floor (log2 n))) ; too many damps but oh well
                  (lambda (y)
                    (/ x (expt y (- n 1)))))
                 1.0)))

(define cube-root (make-nth-root 3))

(define fourth-root (make-nth-root 4))
