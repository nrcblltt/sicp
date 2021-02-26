#lang sicp

; a set is represented as a list with no duplicates

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)        
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((element-of-set? (car set1) set2)        
         (union-set (cdr set1) set2))
        (else (adjoin-set (car set1) set2))))

(union-set '() '(2 3 4))
(union-set '(2 3 4) '())
(union-set '(2 3 4) '(3 4 5))
(union-set '(3 4 5) '(2 3 4))
(union-set '(3 4 5 2) '(3 5 4 2))
