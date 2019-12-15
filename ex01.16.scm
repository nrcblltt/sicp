#lang sicp

; working but wrong solution:

(define fast-expt
  (lambda (b n a)
    (cond ((= n 0) a)
          ((even? n) (fast-expt b (- n 2) (* a (square b))))
          (else (fast-expt b (- n 1) (* a b))))))

(define square
  (lambda (x)
    (* x x)))

(fast-expt 2 4 1)
(fast-expt 2 5 1)
(fast-expt 2 6 1)
(fast-expt 2 7 1)
(fast-expt 3 2 1)
(fast-expt 3 3 1)
(fast-expt 3 4 1)

; working and right:

(define (expt b n)
  (fast-expt-2 b n 1))

(define (fast-expt-2 b n product)
    (cond ((= n 0) product)
          ((even? n) (fast-expt-2 (square b) (/ n 2) product))
          (else (fast-expt-2 b (- n 1) (* product b)))))

(expt 2 4)
(expt 2 5)
(expt 2 6)
(expt 2 7)
(expt 3 2)
(expt 3 3)
(expt 3 4)