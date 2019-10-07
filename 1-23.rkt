#lang sicp

(define (smallest-divisor n)
  (find-divisor n 2))

(define (next n) (if = n 2) 3 (+ n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) 
         n)
        ((divides? test-divisor n) 
         test-divisor)
        (else (find-divisor 
               n 
               (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square x) (* x x))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) 
                       start-time))
      #f))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  #t)

(timed-prime-test 1000)
(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)
(timed-prime-test 10007)
(timed-prime-test 10009)
(timed-prime-test 10037)
(timed-prime-test 100003)
(timed-prime-test 100019)
(timed-prime-test 100043)
(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 1000037)
(timed-prime-test 1000000007)
(timed-prime-test 1000000009)
(timed-prime-test 1000000021)


; fast ones
;1009 *** 60#t

;1013 *** 2#t

;1019 *** 3#t

;10007 *** 5#t

;10009 *** 5#t

;10037 *** 6#t

;100003 *** 14#t

;100019 *** 14#t

;100043 *** 14#t

;1000003 *** 40#t

;1000033 *** 40#t

;1000037 *** 53#t

;1000000007 *** 1204#t

;1000000009 *** 1188#t

;1000000021 *** 1189#t

; slow ones
;1009 *** 3#t

;1013 *** 2#t

;1019 *** 3#t

;10007 *** 6#t

;10009 *** 6#t

;10037 *** 6#t

;100003 *** 19#t

;100019 *** 19#t

;100043 *** 19#t

;1000003 *** 57#t

;1000033 *** 55#t

;1000037 *** 122#t

;1000000007 *** 1747#t

;1000000009 *** 1945#t

;1000000021 *** 1747#t