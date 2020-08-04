#lang sicp

(define (2-41 n s)
  (filter (lambda (i)
            (= (+ (car i) (cadr i) (caddr i)) s))
          (ordered-triplets n))) 

(define (ordered-triplets n)
  (flatmap (lambda (i)
         (flatmap (lambda (j)
                (map (lambda (k)
                       (list i j k))
                     (enumerate-interval (+ j 1) n)))
              (enumerate-interval (+ i 1) (- n 1)))) 
       (enumerate-interval 1 (- n 2))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (ordered-triplets2 n)
  (flatmap (lambda (i)
         (flatmap (lambda (j)
                (map (lambda (k)
                       (list i j k))
                     (enumerate-interval 1 (- j 1))))
              (enumerate-interval 1 (- i 1)))) 
       (enumerate-interval 1 n)))
