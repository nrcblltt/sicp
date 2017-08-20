#lang sicp

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

#; with applicative-order evaluation the program would enter into a loop
because the interpreter would evaluate the operands first and (p) is continuosly
evaluated as itself
with normal order evaluation the interpreter would evaluate "test", substitute it with
the if expression with operands 0 and (p) and then evaluate the predicate expression
the answer would be true and so the consequent expression would be evaluated