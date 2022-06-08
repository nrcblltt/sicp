#lang sicp

(define rand
  (let ((x 234))
    (lambda (m)
      (cond ((eq? m 'generate)
             (begin
               (set! x (rand-update x))
               x))
            ((eq? m 'reset)
             (lambda (new-value)
               (set! x new-value)
               x))
            (else (error "option not available"))))))
	     
; a very poor rand-update
(define (rand-update x)
  (+ x 2))

(rand 'generate)
((rand 'reset) 18) 
(rand 'generate)
(rand 'generate)
(rand 'generate)
(rand 'generate)
(rand 'generate)
((rand 'reset) 18)
(rand 'generate)
(rand 'generate)
(rand 'generate)
(rand 'generate)
(rand 'generate)
