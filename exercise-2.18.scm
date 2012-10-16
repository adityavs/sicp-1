(define (reverse-list items)
  (define (reverse-accum items result)
    (if (null? items)
        result
        (reverse-accum (cdr items) (cons (car items) result))))
  (reverse-accum items '()))
  
(reverse-list (list 1 4 9 16 25))
; Should print: (25 16 9 4 1)
