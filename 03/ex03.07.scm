#lang sicp

(define (make-account balance setpass)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (begin (set! balance (+ balance amount))
           balance))
  (define (dispatch inpass m)
    (if (eq? inpass setpass)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request -- MAKE-ACCOUNT"
                           m)))
        (error "Incorrect password")))
  dispatch)

(define (make-joint old-acc old-acc-pass new-pass)
  (define (dispatch in-pass m)
    (if (eq? in-pass new-pass)
        (old-acc old-acc-pass m)
        (error "Incorrect password")))
  dispatch)

(define peter-acc (make-account 100 'open-sesame))
((peter-acc 'open-sesame 'deposit) 40) ; the account now has 140

(define paul-acc (make-joint peter-acc 'open-sesame 'rosebud))

((paul-acc 'rosebud 'deposit) 50) ; the account now has 190
((peter-acc 'open-sesame 'deposit) 110) ; the account now has 300

((paul-acc 'open-sesame 'deposit) 21) ; Incorrect password