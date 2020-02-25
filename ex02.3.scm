#lang sicp

; procedures for area and perimeter of rectangles
(define (rect-area rectangle)
  (* (rect-base-length rectangle) (rect-height-length rectangle)))

(define (rect-perimeter rectangle)
  (+ (* 2 (rect-base-length rectangle)) (* 2 (rect-height-length rectangle))))

; rectangles as base segment and height segment
(define (make-rectangle base height)
  (cons base height))

(define (rect-base-length rectangle)
  (x-segment-length (car rectangle)))

(define (rect-height-length rectangle)
  (y-segment-length (cdr rectangle)))

; procedures on segment
(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (x-segment-length segment)
  (points-x-distance (end-segment segment) (start-segment segment)))

(define (y-segment-length segment)
  (points-y-distance (end-segment segment) (start-segment segment)))

; procedures on points
(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (points-x-distance p1 p2)
  (abs (- (x-point p2) (x-point p1))))

(define (points-y-distance p1 p2)
  (abs (- (y-point p2) (y-point p1))))

; test program

(define p1 (make-point 3 2))
(define p2 (make-point -6 -4))
(define p3 (make-point 3 -4))
(define segment1 (make-segment p2 p3))
(define segment2 (make-segment p3 p1))
(define rectangle1 (make-rectangle segment1 segment2))
(rect-area rectangle1)
(rect-perimeter rectangle1)


