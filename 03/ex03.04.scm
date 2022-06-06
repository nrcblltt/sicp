#lang sicp

(define (make-account balance setpass)
  (let ((count 0))
    (define (withdraw amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficient funds"))
    (define (deposit amount)
      (begin (set! balance (+ balance amount))
             balance))
    (define (call-the-cops)
      "cops called")
    (define (check-and-inc x)
      (cond
        ((< count 7) (set! count (+ 1 count)))
        (else (call-the-cops))))
    (define (dispatch inpass m)
      (if (eq? inpass setpass)
          (cond ((eq? m 'withdraw)
                 (begin (set! count 0) withdraw))
                ((eq? m 'deposit)
                 (begin (set! count 0) deposit))
                (else (error "Unknown request -- MAKE-ACCOUNT"
                             m)))
          check-and-inc))
    dispatch))

(define acc (make-account 100 'pluto))
((acc 'pluto 'withdraw) 40) ; account now 60
((acc 'pippo 'deposit) 10)
((acc 'pippo 'deposit) 10)
((acc 'pippo 'deposit) 10)
((acc 'pippo 'deposit) 10)
((acc 'pippo 'deposit) 10)
((acc 'pippo 'deposit) 10)
((acc 'pippo 'deposit) 10)
((acc 'pluto 'deposit) 10) ; ok until now, account now 70
((acc 'pippo 'deposit) 10)
((acc 'pippo 'deposit) 10)
((acc 'pippo 'deposit) 10)
((acc 'pluto 'deposit) 10) ; ok until now, account now 80 
((acc 'pippo 'deposit) 10)
((acc 'pippo 'deposit) 10)
((acc 'pippo 'deposit) 10)
((acc 'pippo 'deposit) 10)
((acc 'pippo 'deposit) 10)
((acc 'pippo 'deposit) 10)
((acc 'pippo 'deposit) 10)
((acc 'pippo 'deposit) 10) ; cops called
((acc 'pippo 'deposit) 10) ; cops called
((acc 'pluto 'deposit) 10) ; ok now, account now 90