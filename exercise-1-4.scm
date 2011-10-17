; Exercise 1.4, p21

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; A: The function applied to a and b is determined by
; whether or not b is greater than zero. If it is, the
; arguments are added, otherwise, they are subtracted.

(a-plus-abs-b 1 2)
(a-plus-abs-b 1 -2)