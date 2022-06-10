#lang sicp

(define f
  (let ((state 1))
    (lambda (x)
    (begin (set! state (* state x))
                       state))))

; not this!
(define (g x)
  (let ((state 1))
    (begin (set! state (* state x))
                       state)))
      
  