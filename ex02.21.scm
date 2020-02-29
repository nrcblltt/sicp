(define (square-list-a items)
  (if (null? items)
      '()
      (cons (* (car items) (car items))
	    (square-list-a (cdr items)))))

(define (square-list-b items)
  (map (lambda (x) (* x x))
       items))

(square-list-a (list 1 2 3 4))
(square-list-b (list 1 2 3 4))
