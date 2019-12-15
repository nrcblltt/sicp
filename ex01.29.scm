#lang sicp

(define (simpson-integral f a b n)
  (simpson-integral-k f a b n 0))

(define (simpson-integral-k f a b n k)
  (* (/ (/ (- b a) n) 3) (s-i-sum s-i-term k s-i-next f a b n)))
  
(define (s-i-sum term k next f a b n)
  (if (> k n)
      0
      (+ (s-i-term f a b k n)
         (s-i-sum term (next k) next f a b n))))

(define (s-i-term f a b k n)
        (* (cond ((or (= k 0) (= k n)) 1)
                 ((even? k) 2)
                 (else 4))
           (f (+ a (* k (/ (- b a) n))))))

(define (s-i-next k) (+ k 1))

(define (cube x)
  (* x x x))

(define (test x)
  (/ 1 (expt (+ (expt x 5) 7) 1/3))) ; 0.518798359105237