#lang sicp

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(equal? (fold-right / 1 (list 1 2 3)) 3/2)
(equal? (fold-left / 1 (list 1 2 3)) 1/6)
(equal? (fold-right list nil (list 1 2 3)) (list 1 (list 2 ( list 3 nil))))
(equal? (fold-left list nil (list 1 2 3)) (list (list (list nil 1) 2) 3))

; if the operator is commutative fold-right and fold-left produce the same result ? seems so...
(equal? (fold-right + 0 (list 1 2 3)) (fold-left + 0 (list 1 2 3)))