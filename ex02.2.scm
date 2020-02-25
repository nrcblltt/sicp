#lang sicp

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (midpoint-segment segment)
  (make-point (average (x-point (start-segment segment))
                       (x-point (end-segment segment)))
              (average (y-point (start-segment segment))
                       (y-point (end-segment segment)))))

(define (average x y)
  (/ (+ x y) 2))

(define (midpoint-segment2 segment)
  (average-points (start-segment segment)
                  (end-segment segment)))

(define (average-points a b)
  (make-point (average (x-point a)
                       (x-point b))
              (average (y-point a)
                       (y-point b))))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define p1 (make-point 3 -4))
(define p2 (make-point -2 6))
(define seg1 (make-segment p1 p2))
(define mid1 (midpoint-segment seg1))
(print-point mid1)

(newline)

(define mid2 (midpoint-segment2 seg1))
(print-point mid2)

     