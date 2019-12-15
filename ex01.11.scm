#lang sicp

(define recf
  (lambda (n)
    (if (< n 3)
        n
        (+ (recf (- n 1))
           (* 2 (recf (- n 2)))
           (* 3 (recf (- n 3)))))))

(define iterf
  (lambda (n)
    (iterfsupp 0 1 2 n)))

(define iterfsupp
  (lambda (a b c count)
    (cond ((= count 0) a)
          ((= count 1) b)
          ((= count 2) c)
          (else (iterfsupp b c (+ (* 3 a) (* 2 b) c) (- count 1))))))

(recf 0)
(iterf 0)
(recf 1)
(iterf 1)
(recf 2)
(iterf 2)
(recf 3)
(iterf 3)
(recf 4)
(iterf 4)
(recf 5)
(iterf 5)
(recf 6)
(iterf 6)



