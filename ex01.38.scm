#lang sicp

(define (EulerD k)
  (define (EulerD k i count result)
    (cond ((= k 1) 1)
          ((= k 2) 2)
          ((and (= i k) (= (remainder count 3) 2)) (+ 2 result))
          ((and (= i k) (not (= (remainder count 3) 2))) 1)
          (else (EulerD k (+ i 1) (+ count 1) (if (= (remainder count 3) 2)
                                                  (+ 2 result)
                                                  result)))))
  (EulerD k 3 3 2))

(EulerD 1)
(EulerD 2)
(EulerD 3)
(EulerD 4)
(EulerD 5)
(EulerD 6)
(EulerD 7)
(EulerD 8)
(EulerD 9)
(EulerD 10)
(EulerD 11)

(define (cont-frac n d k)
  (define (cont-frac-rec i)
    (if (= i k)
      (/ (n i) (d i))
      (/ (n i) (+ (d i) (cont-frac-rec (+ i 1))))))
  (cont-frac-rec 1))

(cont-frac (lambda (i) 1.0) EulerD 2500)

0.718281828459045235360287471352662497757247093699959574966
    
    
        
