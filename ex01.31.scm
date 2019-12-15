#lang sicp

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))
      

(define (identity x)
  x)

(define (increment x)
  (+ x 1))

(define (factorial n)
  (product identity 1 increment n))

(define (factorial-iter n)
  (product-iter identity 1 increment n))

(factorial 5)
(factorial-iter 5)
(* 5 4 3 2 1)

(define (wallis-term x)
  (* (/ (* 2 x) (+ (* 2 x) 1))
     (/ (+ (* 2 x) 2) (+ (* 2 x) 1))))

(define (wallis-pi n)
  (* 4 (product wallis-term 1 increment 3)))

(define (wallis-pi-iter n)
  (* 4 (product-iter wallis-term 1 increment 3)))

(wallis-pi 3)
(wallis-pi-iter 3)
(* (/ (* 2 4 4 6 6 8) (* 3 3 5 5 7 7)) 4)
