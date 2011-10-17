; Just as a typing exercise, here's the original square root code with the helper functions
; moved into the body of sqrt2.

(define (sqrt2 x)
  (define (average x y)
    (/ (+ x y) 2))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (good-enough? guess)
    (<= (abs (- guess (improve guess)))
        (* guess 0.001)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(sqrt2 4)