#lang sicp

; number of steps linear in b

(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

; logarithmic number of steps

(define double
  (lambda (n)
    (* n 2)))

(define halve
  (lambda (n)
    (/ n 2)))

(define mult
  (lambda (a b)
    (cond ((= b 0) 0)
          ((even? b) (mult (double a) (halve b)))
          (else (+ a (mult a (- b 1)))))))
        

