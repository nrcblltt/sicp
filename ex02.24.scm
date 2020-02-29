(define x (list 1 (list 2 (list 3 4))))

(define (count-leaves x)
  (cond ((null? x) 0)
	((not (pair? x)) 1)
	(else (+ (count-leaves (car x))
		 (count-leaves (cdr x))))))

(count-leaves x)

; the rest on paper
