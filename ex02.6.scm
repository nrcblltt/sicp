#lang sicp

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (square x)
  (* x x))

(define (+ a b)
  (lambda (f)
    (lambda (x) ((a f) ((b f) x)))))

; you have to obtain (f (f (f x)))
; so you produce a function with argument f, the (lambda (f)...
; this in turn produces a function with argument x, the (lambda (x)...
; ((a f) ((b f) x)) applies f b times to x, and then f a times to the result
; [if b is two and a is one the result is (f (f (f x)))]
; and this is the body of the function with one argument x defined by the (lambda (x)