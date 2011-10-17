; Exercise 1.6, p25

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

; It will overflow the stack instead of returning. The problem is that even cond selectively
; evaluates its arguments, wrapping it in a function causes applicative evaluation to kick in.
; Every call to (new-if ...) will eagerly evaluate all arguments, including, in this case, the
; recursive one.
