; Exercise 1.5, p21

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

; Normal order:
; First, we call:
(test 0 (p))

; Which substitutes the arguments into the body:
(if (= 0 0)
    0
    (p)))

; Then we evaluate the predicate, which is true, so we evaluate and return 0.

; Applicative order:
; First, we call:
(test 0 (p))

; So we evaluate the arguments:
(test 0 ((p)))
(test 0 (((p))))
(test 0 ((((p)))))
; Oh noes! It gets stuck in an infinite loop.

; So applicative order is basically eager evaluation like most languages.
; Normal order is lazy evaluation like Haskell. It's worth noting that this
; example only works because we wrapped the "if" in a function "test". A
; bare "if" like this:

(if (= 0 0)
    0
    (p))

; Works fine because it won't evaluate (p) unless the condition fails. But
; in an applicative language, normal functions don't do conditional
; evaluation like this.