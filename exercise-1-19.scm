; NOT DONE YET.

; Exercise 1.18 p.46

; One iteration of fib():
; a <- a + b
; b <- a

; This is a special case of:
; a <- bq + aq + ap
; b <- bp + aq
; where q = 1 and p = 0

; What is two iterations of fib()?
; Iterate twice:
; a1 = a0 + b0
; b1 = a0
; a2 = a1 + b1
; b2 = a1
; Substitute:
; a2 = (a0 + b0) + (a0)
; b2 = (a0 + b0)
; Reduce:
; a2 = 2a0 + b0
; b2 = a0 + b0
; So for two iterations, q = 1 and p = 1

; a3 = 3a0 + 2b0
; b3 = 2a0 + b0
; For three iterations, q = 2 and p = 1

; a4 = 3a0 + 2b0 + 2a0 + b0
; b4 = 3a0 + 2b0
; For four iterations, q = 3 and p = 2