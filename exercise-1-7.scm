; Exercise 1.7, p25

; Original algorithm:
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

; Original:
;(define (good-enough? guess x)
;  (< (abs (- (square guess) x)) 0.001))
; Refined:
(define (good-enough? guess x)
  (<= (abs (- guess
             (improve guess x)))
     (* guess 0.001)))

(define (sqrt2 x)
  (sqrt-iter 1.0 x))

; Returns how far from the correct answer our guess is.
(define (error x)
  (abs (- (sqrt2 x) (sqrt x))))

(define (error% x)
  (/ (error x) x))

; Our algorithm is particularly bad at small numbers:
; (sqrt2 0) -> Off by 0.03125
; (sqrt2 0.001) -> Off by 0.009622649473307356
; Larger numbers seem to fare better, though it likely wastes more time converging than it
; needs to.
; (sqrt2 10000001) -> Off by 0

; With the refined algorithm, small numbers need to get closer to the answer before we stop
; iterating:
; (sqrt2 0) -> Off by 0
; (sqrt2 0.001) -> Off by .000019239266966994406
; With larger numbers, we've increased the allowed amount of error, though:
; (sqrt2 10000001) -> Off by 0.19990268592755456

; After looking at an answer online: one problem I didn't realize is that some large values
; may never converge with the original solution. Successive iterations may be move the guess by
; more than 0.002, so it may oscillate around a solution forever and never return.