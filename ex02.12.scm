(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-interval x y)
  (cons x y))

(define (lower-bound i)
  (car i))

(define (upper-bound i)
  (cdr i))

(define (make-center-percent c p)
  (let ((width (abs (* p (/ c 100)))))
    (make-center-width c width)))

(define (percent i)
  (abs (* (/ (width i) (center i)) 100)))

(make-center-percent 6.8 10)
(make-center-percent -8 10)
(percent (make-center-percent -8 10))
