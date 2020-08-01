#lang sicp

(define (count-leaves t)
  (accumulate (lambda (x y)
                (+ x y))
              0
              (map
               (lambda (x)
                 (cond ((pair? x) (count-leaves x))
                       ((null? x) 0)
                       (else 1)))
              t)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define x (cons (list 1 2) (list (list 3 4) nil (list 5 6 7 8) nil 9 10 (list 11 12))))
(define tree (list 1 2 (list 3 4) (list 5 (list 6 7)))) 
(count-leaves x)
(count-leaves (list x x))
(count-leaves tree)
