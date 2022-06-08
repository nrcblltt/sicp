#lang sicp

(define (estimate-integral p x1 x2 y1 y2 trials)
  (define (integral-test)
    (p (random-in-range x1 x2) (random-in-range y1 y2)))
  (* (monte-carlo trials integral-test)
     (area-of-rect x1 x2 y1 y2)))

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

(define (area-of-rect x1 x2 y1 y2)
  (* (- x2 x1) (- y2 y1)))

(define (circle-predicate center-x center-y radius)
  (lambda (x y)
    (<= (+ (square (- x center-x))
           (square (- y center-y)))
        (square radius))))

(estimate-integral (circle-predicate 5.0 7.0 3.0) 2.0 8.0 4.0 10.0 1000000)

(estimate-integral (circle-predicate 0.0 0.0 1.0) 1.0 -1.0 1.0 -1.0 100000)