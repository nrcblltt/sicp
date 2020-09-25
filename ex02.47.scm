#lang sicp

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (car (cdr frame)))

(define (edge2-frame frame)
  (car (cdr (cdr frame))))

(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame2 frame)
  (car frame))

(define (edge1-frame2 frame)
  (car (cdr frame)))

(define (edge2-frame2 frame)
  (cdr (cdr frame)))

(origin-frame (make-frame 4 5 6))
(edge1-frame (make-frame 4 5 6))
(edge2-frame (make-frame 4 5 6))

(origin-frame2 (make-frame2 4 5 6))
(edge1-frame2 (make-frame2 4 5 6))
(edge2-frame2 (make-frame2 4 5 6))
