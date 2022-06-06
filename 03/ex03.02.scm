#lang sicp

(define (make-monitored f)
  (let ((counter 0))
    (define (mf input)
      (cond
        ((eq? input 'how-many-calls?) counter)
        ((eq? input 'reset-count) (set! counter 0))
        (else (begin
                (set! counter (+ 1 counter))
                (f input)))))
    mf))
      
(define s (make-monitored sqrt))

(s 100)
(s 100)
(s 100)
(s 100)
(s 100)
(s 'how-many-calls?)
(s 'reset-count)
(s 'how-many-calls?)
(s 100)
(s 'how-many-calls?)