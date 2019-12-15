#lang racket

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; (A 1 10) is 1024 2 to the tenth
; (A 2 4) is 65536 2 to the 16th ; same as (A 1 16)
; (A 3 3) is 65536 2 to the 16th ; same as (A 2 4)

; (define (f n) (A 0 n)) ; (f n) doubles the input n
; (define (g n) (A 1 n)) ; (g n) elevates 2 to the n-th power
; (define (h n) (A 2 n)) ; (h n) elevates 2 to the 2 to the 2 (n - 1) times