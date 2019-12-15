#lang sicp

(define (cont-frac n d k)
  (define (cont-frac-iter n d k partial)
    (if (= k 1)
        (/ (n k) (+ (d k) partial))
        (cont-frac-iter n d (- k 1) (/ (n k) (+ (d k) partial)))))
  (cont-frac-iter n d k (/ (n k) (d k))))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

(/ 1 (/ (+ 1 (sqrt 5)) 2))