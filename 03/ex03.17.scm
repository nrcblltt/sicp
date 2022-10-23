#lang sicp

(define (already-encountered? pair lop)
  (cond ((null? lop) #f)
        ((eq? pair (car lop)) #t)
        (else (already-encountered? pair (cdr lop)))))

(define (count-pairs x)
  (let ((encountered '()))
    (define (count-pairs-int x)
      (cond ((not (pair? x)) 0)
            ((already-encountered? x encountered) 0)
            (else (begin (set! encountered (cons x encountered))
                         (+ (count-pairs-int (car x))
                            (count-pairs-int (cdr x))
                            1)))))
    (count-pairs-int x)))


(define end (cons 'a 'b))
(define middle (cons end end))
(define top (cons middle middle))
(define top2 (list middle))
(define top3 (cons 'a middle))

(define first (list 'a))
(define second (list 'b))
(define fs (cons first second))
(set-cdr! second fs)

(count-pairs (list 'a 'b 'c))
(count-pairs top)
(count-pairs top2)
(count-pairs top3)
(count-pairs fs)

(define t (cons 'b nil))
(define s (cons 'a t))
(define f (cons s t))
(count-pairs f)
