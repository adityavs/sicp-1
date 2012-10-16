; Given stuff:

(define (make-interval a b) (cons a b))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

; Helper

(define (print-interval i)
  (newline)
  (display "(")
  (display (lower-bound i))
  (display "-")
  (display (upper-bound i))
  (display ")"))

; Exercise 2.7

(define (lower-bound i)
  (car i))

(define (upper-bound i)
  (cdr i))

; Exercise 2.8



(define a (make-interval 1.9 2.1))
(define b (make-interval 3.8 4.2))
(print-interval (mul-interval a b))
