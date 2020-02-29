#lang sicp

(define (make-interval a b) (cons a b))

(define (lower-bound interval)
  (min (car interval) (cdr interval)))

(define (upper-bound interval)
  (max (car interval) (cdr interval)))

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

(define (width-interval interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2))

; the sum is a function of the widths of the intervals being added
; interval i1 is (a,b), width is b-a
; interval i2 is (c,d), width is d-c
; i1+i2 is (a+c,b+d), width is (b+d)-(a+c)=(b-a)+(d-c), so it's a function of only the widths of the intervals being added

; the multiplication is not (multiply different intervals of same width, the results have different width):
(define a (make-interval 1 4))
(define b (make-interval 6 9))
(define c (make-interval 5 8))
(define d (mul-interval a b))
(define e (mul-interval c b))
(width-interval a)
(width-interval b)
(width-interval c)
(width-interval d)
(width-interval e)
           

