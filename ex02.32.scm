(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x)
			    (cons (car s) x))
			  rest)))))

(subsets (list 1 2 3))

; the procedure used for map has to add the first element
; of the original list to all the subsets obtained from
; the original list except the first element,
; it does so by consing 



