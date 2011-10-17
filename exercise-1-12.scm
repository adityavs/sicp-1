; Exercise 1.12 p.42
; Compute elements of Pascal's triangle using a recursive procedure.

; row and col are 0-based. col indexes from left to right. the top
; of the triangle is at (0, 0)
(define (pascal row col)
  (cond ((< row 0) 0)                         ; above top
        ((< col 0) 0)                         ; past left side
        ((> col row) 0)                       ; past right side
        ((and (= row 0) (= col 0)) 1)         ; peak
        (else (+ (pascal (- row 1) (- col 1)) ; within triangle
                 (pascal (- row 1) col)))))

(pascal 0 0)
(pascal 1 0)
(pascal 1 1)
(pascal 2 0)
(pascal 2 1)
(pascal 2 2)
(pascal 3 0)
(pascal 3 1)
(pascal 3 2)
(pascal 3 3)