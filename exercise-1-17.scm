; Exercise 1.17 p.46

; Given:
(define (double n) (* n 2))
(define (halve n) (/ n 2))

; ...but we don't otherwise have "*". Write an iterative multiplication procedure that
; works in logarithmic time.

(define (mult-accum x y a)
  (cond
    ((= y 0) a)
    ((even? y) (mult-accum (double x) (halve y) a))
    (else (mult-accum x (- y 1) (+ a x)))))

(define (mult x y) (mult-accum x y 0))

(mult 1 3)
(mult 2 4)
(mult 4 2)
(mult 10 20)
