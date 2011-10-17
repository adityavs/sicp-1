; Exercise 1.14 p.44

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

; Here's a start at a manual expansion...
; (cc 11 5)
; + (cc 11 4)
;   + (cc 11 3)
;     + (cc 11 2)
;       + (cc 11 1)
;         + (cc 11 0)
;             0
;           (cc 10 1)
;           + (cc 10 0)
;               0
;             (cc 9 1)
;             + (cc 9 0)
;                 0
;               (cc 8 1)
;               + (cc 8 0)
;                   0
;                 (cc 7 1)
;                   ...
;         (cc 6 2)
;           ...
;       (cc 1 3)
;       + (cc 1 2)
;         + (cc 1 1)
;           + (cc 1 0)
;               0
;             (cc 0 1)
;               1
;           (cc -4 2)
;             0
;         (cc -9 3)
;           0
;     (cc -14 4)
;       0
;   (cc -39 5)
;     0

; To make my life easier, I went ahead and made a tracing version of the function that outputs
; (more or less) the above, and then verified that I was doing it right:

(define (indent n)
  (display "  ")
  (if (> n 0)
      (indent (- n 1))))

(define (trace-cc i amount kinds-of-coins)
  (indent i)
  (display "(cc ")
  (display amount)
  (display " ")
  (display kinds-of-coins)
  (display ")")
  (cond ((= amount 0) (begin
                        (display " = 1")
                        (newline)
                        1))
        ((or (< amount 0) (= kinds-of-coins 0)) (begin
                                                  (display " = 0")
                                                  (newline)
                                                  0))
        (else (begin
                (newline)
                (+ (trace-cc (+ i 1)
                             amount
                             (- kinds-of-coins 1))
                   (trace-cc (+ i 1)
                             (- amount
                                (first-denomination kinds-of-coins))
                             kinds-of-coins))
                ))))

(trace-cc 0 11 5)
