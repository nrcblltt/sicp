#lang sicp

(define dx 0.00001)

(define (cube x)
  (* x x x))

(define (smooth f)
  (lambda (x)
    (/ (+ (f x) (f (- x dx)) (f (+ x dx))) 3)))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (compose f g)
  (lambda (x)
    (f (g x))))

((smooth cube) 2.12)
((n-fold-smooth cube 2) 2.12)
