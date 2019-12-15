#lang sicp

(define pascal                  ; value: integer > 0
  (lambda (n m)                 ; n,m, integers >= 0 nth rown, mth position
    (cond ((= m n) 1)
          ((= m 0) 1)
          (else (+ (pascal (- n 1) (- m 1)) (pascal (- n 1) m))))))