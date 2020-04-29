(define x (list (list 1 2) (list 3 4) 3))
x

(define (fringe l)
  (cond ((null? l) '())
	((not (pair? l)) (list l))
	(else (append (fringe (car l)) (fringe (cdr l))))))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(fringe x)

(fringe (list x x))



















































