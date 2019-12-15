#lang sicp

(define (carmichael-test n)
  (define (carmichael-test-supp n a)
    (if (= a n)
        (displaycarm n #t)
        (if (= (expmod a n n) (remainder a n))
            (carmichael-test-supp n (+ a 1))
            (displaycarm n #f))))
  (carmichael-test-supp n 1))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (square x)
  (* x x))

(define (displaycarm x y)
  (display x)
  (if y
      (display " is a carmichael number")
      (display " is not a carmichael number"))
  (newline))

(carmichael-test 561)
(carmichael-test 1105)
(carmichael-test 1729)
(carmichael-test 2465)
(carmichael-test 2821)
(carmichael-test 6601)
(carmichael-test 562)
(carmichael-test 12)

        
