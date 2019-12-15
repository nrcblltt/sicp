#lang sicp

(define (n-th-root x n)
  (fixed-point ((repeated average-damp 3) (lambda (y) (/ x (n-th-power y (- n 1))))) 1.0))

(define (n-th-power y n)
  (if (= n 1)
      y
      (* y (n-th-power y (- n 1)))))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average x y)
  (/ (+ x y) 2))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(n-th-power 2 3)
(n-th-power 3 2)
(n-th-root 15 4)
(n-th-root 15 9)
(n-th-root 32 5)