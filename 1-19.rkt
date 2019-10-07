#lang sicp

; a' = bq + aq + ap
; b' = bp + aq

; a'' = b'q + a'q + a'p
;     = q(bp + aq) + (q + p)(bq + aq + ap)
;     = qp*b + q^2*a + qp*b + q^2*b + q^2*a + pq*a + p^2*a + pq*a
;     = a(2q^2 + p^2 + 2pq) + b(q^2 + 2qp)
; b'' = b'p + a'q
;     = p(bp + aq) + q(bq + aq + ap)
;     = bpp + aqp + bqq + aqq = apq
;     = a(qq + 2qp) + b(qq + pp)



; T = [ 1 1 ]   T^2 = [ 2 1 ]     T^4 = [ 5 3 ]
;     [ 1 0 ]         [ 1 1 ]           [ 3 2 ]
;

; T_pq = [ p+q  q ]
;        [  q   p ]

; T_pq^2 = [ (p+q)^2+q^2  q(p+q)+pq ]
;          [ q(p+q)+qp     q^2+p^2  ]
;
;        = [ p^2+2pq+2q^2  q^2+2qp  ]   = [ q'+p'  q' ]  = T_p'q'  QED pls
;          [  q^2+2qp      q^2+p^2  ]     [  q'    p' ]
;
;  q' = q^2 + 2qp   
;  p' = q^2 + p^2

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) 
         b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* q q) (* p p))
                   (+ (* q q) (* 2 q p))
                   (/ count 2)))
        (else 
         (fib-iter (+ (* b q) 
                      (* a q) 
                      (* a p))
                   (+ (* b p) 
                      (* a q))
                   p
                   q
                   (- count 1)))))