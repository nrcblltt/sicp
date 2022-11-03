#lang sicp

(define (already-encountered? pair lop)
  (cond ((null? lop) #f)
        ((eq? pair (car lop)) #t)
        (else (already-encountered? pair (cdr lop)))))

(define (cycle-detect x)
  (let ((encountered '()))
    (define (cycle-detect-int x)
      (cond ((not (pair? x)) #f)
            ((already-encountered? x encountered) #t)
            (else (begin
              (set! encountered (cons x encountered))
              (or (cycle-detect-int (car x))
                   (cycle-detect-int (cdr x)))))))
    (cycle-detect-int x)))

(define a '(a b c))
(cycle-detect a)

(define b '(a b))
(set-cdr! (cdr b) b)
(cycle-detect b)

(define c '(f g))
(set-car! (cdr c) c)
(cycle-detect c)

(define d '(m n o p q))
(set-car! (cddr d) d)
(cycle-detect d)

(define e '(m n o p q))
(set-cdr! (cddr e) e)
(cycle-detect e)