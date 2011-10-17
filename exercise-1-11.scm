; Exercise 1.11, p. 42
; f(n) = n <  3 |n
;        n >= 3 | f(n - 1) + 2f(n - 2) + 3f(n - 3)

; Given the three previous values of f(), calculates the next one.
(define (next a b c)
  (+ a
     (* 2 b)
     (* 3 c))) 

; Recursive
(define (f-rec n)
  (if (< n 3)
      n
      (next (f-rec (- n 1))
         (f-rec (- n 2))
         (f-rec (- n 3)))))

; Iterative
(define (f-iter n)
  (define (step i prev1 prev2 prev3)
    (define current (next prev1 prev2 prev3))
    (cond ((= i 3) current)
          ((= i 2) prev1)
          ((= i 1) prev2)
          ((= i 0) prev3)
          (else (step (- i 1) current prev1 prev2))))
  (step n 2 1 0))
