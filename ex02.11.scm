#lang sicp

(define (make-interval a b) (cons a b))

(define (lower-bound interval)
  (min (car interval) (cdr interval)))

(define (upper-bound interval)
  (max (car interval) (cdr interval)))

; we revert to standard multiplication when both intervals span zero

(define (mul-interval x y)
  (let ((L1 (lower-bound x))
        (U1 (upper-bound x))
        (L2 (lower-bound y))
        (U2 (upper-bound y)))
    (cond ((and (> L1 0) (> U1 0))
           (cond ((and (> L2 0) (> U2 0)) (make-interval (* L1 L2) (* U1 U2)))
                 ((and (< L2 0) (< U2 0)) (make-interval (* L2 U1) (* U2 L1)))
                 ((and (< L2 0) (> U2 0)) (make-interval (* L2 U1) (* U2 U1)))))
          ((and (< L1 0) (> U1 0))
           (cond ((and (> L2 0) (> U2 0)) (make-interval (* L1 U2) (* U1 U2)))
                 ((and (< L2 0) (< U2 0)) (make-interval (* L2 U1) (* L2 L1)))
                 ((and (< L2 0) (> U2 0)) (mul-interval-standard x y))))
          ((and (< L1 0) (< U1 0))
           (cond ((and (> L2 0) (> U2 0)) (make-interval (* L1 U2) (* U1 L2)))
                 ((and (< L2 0) (< U2 0)) (make-interval (* U1 U2) (* L1 L2)))
                 ((and (< L2 0) (> U2 0)) (make-interval (* L1 U2) (* L1 L2))))))))

(define (mul-interval-standard x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(mul-interval (make-interval 1 2) (make-interval 3 5))
(mul-interval-standard (make-interval 1 2) (make-interval 3 5))

(mul-interval (make-interval 1 2) (make-interval -3 -5))
(mul-interval-standard (make-interval 1 2) (make-interval -3 -5))

(mul-interval (make-interval 1 2) (make-interval -3 5))
(mul-interval-standard (make-interval 1 2) (make-interval -3 5))

(newline)

(mul-interval (make-interval -1 2) (make-interval 3 5))
(mul-interval-standard (make-interval -1 2) (make-interval 3 5))

(mul-interval (make-interval -1 2) (make-interval -5 -3))
(mul-interval-standard (make-interval -1 2) (make-interval -5 -3))

(mul-interval (make-interval -1 2) (make-interval -5 3))
(mul-interval-standard (make-interval -1 2) (make-interval -5 3))

(newline)

(mul-interval (make-interval -2 -1) (make-interval 3 5))
(mul-interval-standard (make-interval -2 -1) (make-interval 3 5))

(mul-interval (make-interval -2 -1) (make-interval -5 -3))
(mul-interval-standard (make-interval -2 -1) (make-interval -5 -3))

(mul-interval (make-interval -2 -1) (make-interval -3 5))
(mul-interval-standard (make-interval -2 -1) (make-interval -3 5))

      