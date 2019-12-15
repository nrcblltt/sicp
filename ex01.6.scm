#lang sicp

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
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


(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; if is a special form, the interpreter evaluates first the predicate,
; if this is true evaluates the consequent case, if not the alternative case

; new-if is a compound procedure and the interpreter
; first retrieves the body of new-if and then evaluates
; (good-enough? guess x) AND guess AND (sqrt-iter (improve guess x) x)
; the last one triggers an infinite loop