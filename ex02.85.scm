;; this is not complete
;; why can't we project 1.5 + 0i to a rational?
;; why do they say to project reals to integers and not to rationals?

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (let ((t1->t2 (get-coercion type1 type2))
                      (t2->t1 (get-coercion type2 type1)))
                  (cond (t1->t2
                         (apply-generic op (t1->t2 a1) a2))
                        (t2->t1
                         (apply-generic op a1 (t2->t1 a2)))
                        (else
                         (error "No method for these types"
                                (list op type-tags))))))
              (error "No method for these types"
                     (list op type-tags)))))))

;; inside the complex package

(put 'project 'complex
     (lambda (n)
       (make-real ((get 'real-part 'complex) (contents n)))))

;; inside the real package

(put 'project 'real
     (lambda (n)
       (make-rat (round (contents n)) 1)))

;; inside the rational package

(put 'project 'rational
     (lambda (n)
       ( )))
	    
;; nothing inside integer

;; we also need a generic project

(define (project n)
  (apply-generic 'project n))

