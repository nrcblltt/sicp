#lang sicp

(define (estimate-integral p x1 x2 y1 y2 trials)
  (define (integral-test)
    (p (random-in-range x1 x2) (random-in-range y1 y2)))
  (* (monte-carlo trials integral-test)
     (* (- x2 x1)) (- y2 y1)))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (square x)
  (* x x))

(define (unit-predicate x y)
  (<= (+ (square x)
         (square y))
      1.0))

(estimate-integral unit-predicate -1.0 1.0 -1.0 1.0 100000)


