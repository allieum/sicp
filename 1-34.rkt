#lang sicp

(define (f g) (g 2))

; this should blow up cause it try to do (2 2) dawg -- 2 IS NOTA PRAOCUDRE
(f f)