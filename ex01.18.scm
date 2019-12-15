#lang sicp

(define (double n)
  (* n 2))

(define (halve n)
  (/ n 2))

(define (fast-mult a b)
  (fast-mult-iter a b 0))

(define (fast-mult-iter a b s)
  (cond ((= b 0) s)
        ((even? b) (fast-mult-iter (double a) (halve b) s))
        (else (fast-mult-iter a (- b 1) (+ a s)))))

(fast-mult 3 9)
(fast-mult 4 5)
(fast-mult 4 4)