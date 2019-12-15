#lang sicp

(define (double f)
  (lambda (x)
    (f (f x))))

(inc 2) "should be 3"
((double inc) 2) "should be 4"

(((double (double double)) inc) 5)