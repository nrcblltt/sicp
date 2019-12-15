#lang sicp

(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a) (filtered-accumulate filter combiner null-value term (next a) next b))
          (combiner null-value (filtered-accumulate filter combiner null-value term (next a) next b)))))

(define (sum-of-squares-primes a b)
  (filtered-accumulate prime? + 0 square a inc b))

(define (product-primes-relative-to-n n)
  (define (relatively-prime-to-n i)
    (= (gcd i n) 1))
  (filtered-accumulate relatively-prime-to-n * 1 identity 1 inc n))

(define (square x)
  (* x x))

(define (inc x)
  (+ x 1))

(define (identity x)
  x)

(define (prime? n)
  (if (= n 1)
      false
      (= n (smallest-divisor n))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(sum-of-squares-primes 20 70)
23939

(sum-of-squares-primes 1 5)
38

(product-primes-relative-to-n 18)
85085

(product-primes-relative-to-n 10)
189