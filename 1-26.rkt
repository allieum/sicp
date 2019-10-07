#lang sicp

; Eva Lu Ator is cutting the work in half, but doing it twice.. oof.
; so we have:
;;  (expmod e)
;; (expmod e/2) (expmod e/2)
;; (expmod e/4) ... x4 ... expmod (e/4)
;; .....
;; (expmod e/n) ... xn ... expmod (e/n)


;; n + n/2 + n/4 + n/8 .... fuckin turtle paradox... it equals two * n