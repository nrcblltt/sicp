(define (square-list-1 items)
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons (square (car things)) answer))))
  (iter items '()))

(square-list-1 (list 1 2 3 4))

;;; the answer list is reversed because as the items are processed
;;; they are consed on the answer list

(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons answer (square (car things))))))
  (iter items '()))

(square-list-2 (list 1 2 3 4))

;;; answer is not a list but a sequence of pairs
;;; the first time is the pair made by nil and 1
;;; then the pair formed by nil and 1 on one side and the square of 2 on the other and so on
