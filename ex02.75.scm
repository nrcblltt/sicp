#lang sicp

(define (make-from-mag-ang x y)
  (define (dispatch op)
    (cond ((eq? op 'real-part)
           (* x (cos y)))
          ((eq? op 'img-part)
           (* x (sin y)))
          ((eq? op 'magnitude) x)
          ((eq? op 'angle) y)
          (else
           (error "Unknown op -- MAKE-FROM-ANG-MAG op"))))
  dispatch)

(define (apply-generic op arg) (arg op))

(define COMPLEX1 (make-from-mag-ang 12 34))

(apply-generic 'real-part COMPLEX1)
(apply-generic 'img-part COMPLEX1)