#lang sicp

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (union-set set1 set2)
  (let ((list1 (tree->list-2 set1))
        (list2 (tree->list-2 set2)))
    (let ((united-list (orderedlistunion list1 list2)))
      (list->tree united-list))))

(define (intersection-set set1 set2)
  (let ((list1 (tree->list-2 set1))
        (list2 (tree->list-2 set2)))
    (let ((united-list (intersection-list list1 list2)))
      (list->tree united-list))))

(define (orderedlistunion list1 list2)
  (cond ((null? list1) list2)
        ((null? list2) list1)
        ((< (car list1) (car list2)) (cons (car list1) (orderedlistunion (cdr list1) list2)))
        ((> (car list1) (car list2)) (cons (car list2) (orderedlistunion list1 (cdr list2))))
        (else (cons (car list1) (orderedlistunion (cdr list1) (cdr list2))))))

(define (intersection-list list1 list2)
  (if (or (null? list1) (null? list2))
      '()    
      (let ((x1 (car list1)) (x2 (car list2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-list (cdr list1)
                                       (cdr list2))))
              ((< x1 x2)
               (intersection-list (cdr list1) list2))
              ((< x2 x1)
               (intersection-list list1 (cdr list2)))))))

;union-set and intersection-set

  (define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))


  (define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

; tests for union-set and intersection-set

(union-set '(3 (1 () ()) (5 () ())) '(6 (5 () ()) (7 () ())))
(union-set '(2 () ()) '(2 () ()))
(union-set '(4 (2 () ()) (6 () ())) '(1 () (2 () (3 () (4 () ())))))
(intersection-set '(3 (1 () ()) (5 () ())) '(6 (5 () ()) (7 () ())))
(intersection-set '(2 () ()) '(2 () ()))
(intersection-set '(4 (2 () ()) (6 () ())) '(1 () (2 () (3 () (4 () ())))))

