;; inside the integer package

(define (int->rat n)
  (make-rational (contents n) 1))

(put 'raise 'integer
     (lambda (n) (int->rat n)))

;; inside the rational package

(define (rat->real n)
  (make-real (/ (* 1.0 (numer (contents n)) (denom (contents n))))))

(put 'raise 'rational
     (lambda (n) (rat->real n)))

;; inside the real package

(define (real->complex n)
  (make-complex-from-real-imag (contents n) 0))

(put 'raise real
     (lambda (n) (real->complex n)))

;; nothing in complex

;; i also need a generic raise

(define (raise x)
  (apply-generic 'raise x))


(/ (* 1.0 56) 12)

