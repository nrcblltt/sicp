(define (for-each procedure elements)
  (define (iter elements procedure processed)
    (if (null? elements)
	true
	(iter (cdr elements) procedure (cons (procedure (car elements)) processed))))
  (iter elements procedure '()))

(for-each (lambda (x) (newline) (display x)) (list 57 231 88))
      
