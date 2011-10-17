; Exercise 1.8, p26

; Original algorithm:
(define (cube-root-iter guess x)
  (if (good-enough? guess x)
          guess
          (cube-root-iter (improve guess x)
                          x)))

(define (square x)
  (* x x))

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (average x y)
  (/ (+ x y) 2))

(define (cube x)
  (* x x x))

(define (good-enough? guess x)
  (<= (abs (- guess
             (improve guess x)))
     (* guess 0.00001)))

(define (cube-root x)
  (cube-root-iter 1.0 x))

; Returns how far from the correct answer our guess is.
(define (error x)
  (abs (- (cube (cube-root x)) x)))

; I had to tighten the tolerance in good-enough since cubing magnifies the error.
; With the improved tolerance it gives pretty good results for small numbers and
; scales OK. Once you get up to about 1e10, the error starts blowing up, likely
; because we're hitting the maximum precision of the numbers.