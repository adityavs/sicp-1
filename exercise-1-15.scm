; Exercise 1.15 p.44

(define (cube x) (* x x x ))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

; a. How many times is p applied when (sine 12.15) is evaluated?
(define count 0)

(define (trace-p x)
  (set! count (+ count 1))
  (- (* 3 x) (* 4 (cube x))))

(define (trace-sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (trace-p (trace-sine (/ angle 3.0)))))

(trace-sine 12.15)
count ; Answer: 5

; b. What is the order of growth in space and number of steps of since as a function of a
;    for (sine a)?
; Number of steps and space are both linear in a. It's singly-recursive, but not tail recursive.

; WRONG (http://community.schemewiki.org/?sicp-ex-1.15):
; angle is divided by three each time, so it's logarithmic.