#lang sicp
(#%require sicp-pict)

(define outline-painter
  (segments->painter (list (make-segment (make-vect 0 0) (make-vect 1 0))
                           (make-segment (make-vect 1 0) (make-vect 1 1))
                           (make-segment (make-vect 1 1) (make-vect 0 1))
                           (make-segment (make-vect 0 1) (make-vect 0 0)))))

(define zig-zag
  (segments->painter (list (make-segment (make-vect 0 0) (make-vect 0.4 0.6))
                           (make-segment (make-vect 0.4 0.6) (make-vect 0.4 0.4))
                           (make-segment (make-vect 0.4 0.4) (make-vect 0.8 0.8))
                           (make-segment (make-vect 0.8 0.8) (make-vect 0.8 0.6))
                           (make-segment (make-vect 0.8 0.6) (make-vect 1 1))
                           (make-segment (make-vect 0 0) (make-vect 1 0))
                           (make-segment (make-vect 1 0) (make-vect 1 1))
                           (make-segment (make-vect 1 1) (make-vect 0 1))
                           (make-segment (make-vect 0 1) (make-vect 0 0)))))

(define (for-each procedure elements)
  (define (iter elements procedure processed)
    (if (null? elements)
	true
	(iter (cdr elements) procedure (cons (procedure (car elements)) processed))))
  (iter elements procedure '()))

