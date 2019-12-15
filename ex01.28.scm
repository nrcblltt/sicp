#lang sicp

(define (rabin-miller x)
  (= (expmod (+ (random (- x 1)) 1) (- x 1) x) 1)) 

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (if (nontrivialsquare (expmod base (/ exp 2) m) m)
             0
             (remainder (square (expmod base (/ exp 2) m))
                    m)))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (nontrivialsquare x m)
  (cond ((= x 1) #f)
        ((= x (- m 1)) #f)
        (else (= (remainder (square x) m) 1)))) 

(define (square x)
  (* x x))
