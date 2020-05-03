(define (tree-map procedure tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (procedure tree))
	(else (cons (tree-map procedure (car tree))
		    (tree-map procedure (cdr tree))))))

(define x (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (square-tree tree) (tree-map square tree))
(define (cube-tree tree) (tree-map cube tree))

(square-tree x)
(cube-tree x)






