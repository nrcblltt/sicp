#lang sicp

(define (simpson-integral f a b n)
  (define (simpson-term k)
    (* (cond ((or (= k 0) (= k n)) 1)
             ((even? k) 2)
             (else 4))
       (f (+ a (* k (/ (- b a) n))))))
  (define (simpson-next k) (+ k 1))
  (* (/ (/ (- b a) n) 3) (sum simpson-term 0 simpson-next n)))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube x)
  (* x x x))

(define (test x)
  (/ 1 (expt (+ (expt x 5) 7) 1/3)))

(define (test2 x)
  (* (* x 27) (expt (+ (expt x 3) 7) 1/8)))

(simpson-integral cube 0 1 100) ; 1/4
(simpson-integral cube 0 1 1000) ; 1/4
(simpson-integral test 0 1 4) ; 0.518798359105237
(simpson-integral test2 0 1 24) ;17.3360043650801
