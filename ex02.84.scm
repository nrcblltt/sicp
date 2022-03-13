(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
	      (let ((firstraisedargs (raisefirst (car args) (cadr args)))
		    (secondraisedargs (raisesecond (car args) (cadr args))))
		(cond (firstraisedargs
		       (apply-generic op firstraisedargs))
		      (secondraisedargs
		       (apply-generic op secondraisedargs))
		      (else
		       (error "No method for these types"
                              (list op type-tags)))))
	      (error "No method for these types"
                     (list op type-tags)))))))

(define (raisefirst arg1 arg2)
  (cond ((eq? (type-tag arg1) (type-tag arg2)) (list arg1 arg2))
	((not (get 'raise arg1)) #f)
	(else (raisefirst (raise arg1) arg2))))

(define (raisesecond arg1 arg2)
  (cond ((eq? (type-tag arg1) (type-tag arg2)) (list arg1 arg2))
	((not (get 'raise arg2)) #f)
	(else (raisesecond arg1 (raise arg2)))))
