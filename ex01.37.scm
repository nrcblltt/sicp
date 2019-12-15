#lang sicp

(define (cont-frac n d k)
  (define (cont-frac-rec i)
    (if (= i k)
      (/ (n i) (d i))
      (/ (n i) (+ (d i) (cont-frac-rec (+ i 1))))))
  (cont-frac-rec 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

(/ 1 (/ (+ 1 (sqrt 5)) 2))
      