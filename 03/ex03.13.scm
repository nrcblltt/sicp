#lang sicp

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

; z is a "ring", the cdr of the last pair is the beginning of the list
(define z (make-cycle (list 'a 'b 'c)))

; (last-pair z) enters in a loop
