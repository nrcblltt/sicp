(define *coercion-table* (make-equal-hash-table))

(define (put-coercion type-from type-to proc)
  (hash-table-set!
    *coercion-table* 
    (list type-from type-to) 
    proc))

(define (get-coercion type-from type-to)
  (hash-table-ref 
    *coercion-table* 
    (list type-from type-to) 
    #f))

(put-coercion 'real 'int (lambda (x) x))
(put-coercion 'int 'rational (lambda (x) x))
((get-coercion 'real 'int) 9)
(get-coercion 'real 'complex)
