#lang sicp

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))
    (if (> (* n d) 0)
        (cons (abs (/ n g)) (abs (/ d g)))
        (cons (- (abs (/ n g))) (abs (/ d g))))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define first (make-rat -10 -20))
(define second (make-rat -10 20))
(define third (make-rat 10 -20))
(define fourth (make-rat 10 20))

(print-rat first)
(print-rat second)
(print-rat third)
(print-rat fourth)
