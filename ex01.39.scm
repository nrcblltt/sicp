#lang sicp

(define (lambert i)
  (define (lambert-iter k i result)
    (if (= k i)
        result
        (lambert-iter (+ k 1) i (+ result 2))))
  (lambert-iter 1 i 1))

(lambert 1)
(lambert 2)
(lambert 3)
(lambert 4)

(define (cont-frac n d k)
  (define (cont-frac-rec i)
    (if (= i k)
      (/ (n i) (d i))
      (/ (n i) (+ (d i) (cont-frac-rec (+ i 1))))))
  (cont-frac-rec 1))

(define (tan-cf x k) 
   (cont-frac (lambda (i) 
                (if (= i 1) x (- (* x x)))) 
              lambert
              k)) 

(tan-cf 0.5 20)
0.54630
  