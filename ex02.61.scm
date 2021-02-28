#lang sicp

; sets represented as ordered lists

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()    
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set (cdr set1)
                                       (cdr set2))))
              ((< x1 x2)
               (intersection-set (cdr set1) set2))
              ((< x2 x1)
               (intersection-set set1 (cdr set2)))))))

(define (adjoin-set x set)
  (cond ((null? set) (cons x '()))
        ((< x (car set)) (cons x set))
        ((> x (car set)) (cons (car set) (adjoin-set x (cdr set))))
        (else set)))

(adjoin-set 1 '(4 7 9))
(adjoin-set 5 '(4 7 9))
(adjoin-set 8 '(4 7 9))
(adjoin-set 9 '(4 7 9))
(adjoin-set 10 '(4 7 9))
(adjoin-set 10 '())