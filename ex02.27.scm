(define x (list 3 (list 1 2) (list 3 4)))
x
(cdr x)

(pair? x)
(pair? (list 1 2 3))
(pair? (list 2))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (deep-rec-reverse l)
  (cond ((not (pair? (car l))) (if (null? (cdr l))
				   l
				   (append (deep-rec-reverse (cdr l)) (list (car l)))))
	((pair? (car l)) (if (null? (cdr l))
			     (deep-rec-reverse (car l))
                             (cons (deep-rec-reverse (cdr l))
				   (list (deep-rec-reverse (car l))))))))

(define (reverse l)
  (if (null? l)
      l
      (append (reverse (cdr l)) (list (car l)))))

(define (deep-reverse l)
  (if (null? l)
      l
      (append (deep-reverse (cdr l)) 
	      (if (not (pair? (car l)))
		  (list (car l))
		  (list (deep-reverse (car l)))))))

(reverse x)

(deep-rec-reverse x)

(deep-reverse x)



