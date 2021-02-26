#lang sicp

; a set is represented as a list with duplicates

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

'element-of-set
(element-of-set? 'a '(b b b b b a a))
(element-of-set? 'a '(a))
(element-of-set? 'b '(a))
(element-of-set? 'b '())

(define (adjoin-set x set)
  (cons x set))

'adjoin-set
(adjoin-set 2 '(c d e))
(adjoin-set 'c '(c d e))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)        
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

'intersection-set
(intersection-set '(2 3 2 1 3 2 2) '(9 4 5 2 3))
(intersection-set '(9 4 5 2 3) '(2 3 2 1 3 2 2))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (adjoin-set (car set1) (union-set (cdr set1) set2)))))

'union-set
(union-set '() '(2 3 4 5))
(union-set '(2 3 4 5) '())
(union-set '(2 3 4 5) '(2 2 3 3 4 4 5 6))

; adjoin-set is now constant time, union-set is big theta of n.
; element-of-set? and intersection-set stay the same
; if we add sets (or elements to sets) a lot, this is preferable than the previous version
; we use more memory though