;; constructors

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;; (a) selectors

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

;; (b) total-weight

(define (total-weight mobile)
  (if (not (pair? mobile))
      mobile
      (+ (total-weight (branch-structure (left-branch mobile)))
	 (total-weight (branch-structure (right-branch mobile))))))

;; (c) balanced

(define (balanced? mobile)
  (if (not (pair? mobile))
      true
      (and (= (* (total-weight (branch-structure (left-branch mobile)))
		 (branch-length (left-branch mobile)))
	      (* (total-weight (branch-structure (right-branch mobile)))
		 (branch-length (right-branch mobile))))
	   (balanced? (branch-structure (left-branch mobile)))
	   (balanced? (branch-structure (right-branch mobile))))))

;; (d) with a different representation we just have to modify the selectors

(define (make-mobile2 left right)
  (cons left right))

(define (make-branch2 length structure)
  (cons length structure))

(define (left-branch2 mobile)
  (car mobile))

(define (right-branch2 mobile)
  (cdr mobile))

(define (branch-length2 branch)
  (car branch))

(define (branch-structure2 branch)
  (cdr branch))

(define (total-weight2 mobile)
  (if (not (pair? mobile))
      mobile
      (+ (total-weight2 (branch-structure2 (left-branch2 mobile)))
	 (total-weight2 (branch-structure2 (right-branch2 mobile))))))

(define (balanced?2 mobile)
  (if (not (pair? mobile))
      true
      (and (= (* (total-weight2 (branch-structure2 (left-branch2 mobile)))
		 (branch-length2 (left-branch2 mobile)))
	      (* (total-weight2 (branch-structure2 (right-branch2 mobile)))
		 (branch-length2 (right-branch2 mobile))))
	   (balanced?2 (branch-structure2 (left-branch2 mobile)))
	   (balanced?2 (branch-structure2 (right-branch2 mobile))))))

;; examples

(define mob1 (make-mobile (make-branch 5 (make-mobile (make-branch 3 3)
						      (make-branch 2 6)))
			  (make-branch 4 7)))

(define mob2 (make-mobile (make-branch 5 4)
			  (make-branch 4 5)))

(define mob3 (make-mobile (make-branch 2 mob2)
			  (make-branch 6 3)))

(total-weight mob1)
(balanced? mob1)

(total-weight mob2)
(balanced? mob2)

(total-weight mob3)
(balanced? mob3)

(define mob4 (make-mobile2 (make-branch2 5 (make-mobile2 (make-branch2 3 3)
							 (make-branch2 2 6)))
			   (make-branch2 4 7)))

(define mob5 (make-mobile2 (make-branch2 5 4)
			   (make-branch2 4 5)))

(define mob6 (make-mobile2 (make-branch2 2 mob5)
			   (make-branch2 6 3)))

(total-weight2 mob4)
(balanced?2 mob4)

(total-weight2 mob5)
(balanced?2 mob5)

(total-weight2 mob6)
(balanced?2 mob6)