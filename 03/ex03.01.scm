#lang sicp

(define (make-accumulator value)
  (lambda (amount)
    (begin
      (set! value (+ value amount))
      value)))

(define A (make-accumulator 5))
(define B (make-accumulator 10))
(A 10)
(A 10)
(B 10)
(B 10)