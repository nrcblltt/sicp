#lang racket
; alternative representation, same principal procedures
; procedures for area and perimeter of rectangles
(define (rect-area rectangle)
  (* (rect-base-length rectangle) (rect-height-length rectangle)))

(define (rect-perimeter rectangle)
  (+ (* 2 (rect-base-length rectangle)) (* 2 (rect-height-length rectangle))))

; rectangles as bottom-left and top-right point
(define (make-rectangle start-point end-point)
  (cons start-point end-point))

(define (rect-base-length rectangle)
  (x-distance (car rectangle) (cdr rectangle)))

(define (rect-height-length rectangle)
  (y-distance (car rectangle) (cdr rectangle)))

; procedures on points
(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (x-distance p1 p2)
  (abs (- (x-point p2) (x-point p1))))

(define (y-distance p1 p2)
  (abs (- (y-point p2) (y-point p1))))

; test program

(define p1 (make-point 3 2))
(define p2 (make-point -6 -4))
(define rectangle1 (make-rectangle p1 p2))
(rect-area rectangle1)
(rect-perimeter rectangle1)