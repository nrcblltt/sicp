#lang sicp

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; the expression (if (> b 0) + -) is evaluated
; if b is bigger than 0 an operator + is returned (+ a b)
; if b is smaller than 0 an operator - is returned (- a b)

