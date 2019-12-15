#lang sicp

(define (sqrt-iter guess x)
  (if (or (good-enough? guess x) (not-changing guess (improve guess x)))
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (mysqrt x)
  (sqrt-iter 1.0 x))

(define (not-changing a b)
  (< (abs (- a b)) 0.00000001))
