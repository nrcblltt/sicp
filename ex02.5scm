#lang sicp

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car x)
  (find-factor x 2))

(define (cdr x)
  (find-factor x 3))


(define (find-factor n x)
  (if (not (= (remainder n x) 0))
      0
      (+ 1 (find-factor (/ n x) x))))

(car (cons 27 5))
(cdr (cons 4 435))






           
      
  
