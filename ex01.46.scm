#lang sicp

(define (iterative-improve goodguess? improve)
  (lambda (x)
    (if (goodguess? x)
        x
        ((iterative-improve goodguess? improve) (improve x)))))


(define (sqrt x)
  ((iterative-improve (lambda (y) (< (abs (- (square y) x)) 0.00001)) (lambda (y) (/ (+ y (/ x y)) 2))) 1.0))

(define (square x)
  (* x x))

(define (fixed-point f first-guess)
  ((iterative-improve (lambda (y) (< (abs (- y (f y))) 0.00001)) f) first-guess))


(sqrt 12)
(fixed-point cos 1.0)
(fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0)

  
  
