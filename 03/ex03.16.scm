#lang sicp

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define end (cons 'a 'b))
(define middle (cons end end))
(define top (cons middle middle))
(define top2 (list middle))

(define first (list 'a))
(define second (list 'b))
(define fs (cons first second))
(set-cdr! second fs)

(count-pairs (list 'a 'b 'c))
(count-pairs top)
(count-pairs top2)
; (count-pairs fs) infinite recursion