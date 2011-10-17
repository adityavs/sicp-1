; Exercise 1.3, p21

(define (square x) (* x x))

(define (sum-squares a b)
  (+ (square a) (square b)))

(define (sum-largest-squares a b c)
  (cond ((and (< a b) (< a c)) (sum-squares b c))
        ((and (< b a) (< b c)) (sum-squares a c))
        (else (sum-squares a b))))

; Try it out.
(sum-largest-squares 1 2 3)
(sum-largest-squares 2 1 3)
(sum-largest-squares 3 2 1)
