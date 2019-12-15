#lang sicp

(define (cubert-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubert-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.000001))  

(define (cube x)
  (* x x x))

(define (square x)
  (* x x))

(define (cubert x)
  (cubert-iter 1 x))
