; Exercise 1.16 p.46

(define (square n) (* n n))

; This one grows logarithmically in space and number of steps.
; Want one that uses constant space.
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

; Here's how it expands:
; (fast-expt 5 12)
; (square (fast-expt 5 6))
; (square (square (fast-expt 5 3)))
; (square (square (* 5 (fast-expt 5 2))))
; (square (square (* 5 (square (fast-expt 5 1)))))
; (square (square (* 5 (square (* 5 (fast-expt 5 0))))))
; (square (square (* 5 (square (* 5 1)))))
; (square (square (* 5 (square 5))))
; (square (square (* 5 25)))
; (square (square 125))
; (square 15625)
; 244140625

; Here's one that's linear in number of steps but constant in space.
(define (slow b n a)
  (if (= n 0)
      a
      (slow b (- n 1) (* a b))))

(define (slow-expt b n) (slow b n 1))

; Here's how it expands:
; (slow-expt 3 8)
; (slow 3 8 1)
; (slow 3 (- 8 1) (* 1 3))
; (slow 3 7 3)
; (slow 3 (- 7 1) (* 3 3))
; (slow 3 6 9)
; (slow 3 (- 6 1) (* 9 3))
; (slow 3 5 27)
; (slow 3 (- 5 1) (* 27 3))
; (slow 3 4 81)
; (slow 3 (- 4 1) (* 81 3))
; (slow 3 3 243)
; (slow 3 (- 3 1) (* 243 3))
; (slow 3 2 729)
; (slow 3 (- 2 1) (* 729 3))
; (slow 3 1 2187)
; (slow 3 (- 1 1) (* 2187 3))
; (slow 3 0 6561)
; 6561

; We've got two branches we can take to reduce. If the exponent is odd, we reduce it by one.
; We can do that iteratively by accumulating above.
; If the exponent is even, we can rely on this identity: b^(n/2) = (b^2)^n/2
; To reduce to a tail call with a larger base and smaller exponent.

(define (expt-accum b n a)
  (cond ((= n 0) a)
        ((even? n) (expt-accum (square b) (/ n 2) a))
        (else (expt-accum b (- n 1) (* b a)))))

(define (expt-iter b n) (expt-accum b n 1))
