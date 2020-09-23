#lang sicp

(define (queens board-size)
  (define (queen-cols k)  
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board '())

(define (pair-sum pair)
  (+ (car pair) (car (cdr pair))))

(define (pair-difference pair)
  (- (car pair) (car (cdr pair))))

(define (safe? k positions)
  (if (= k 0)
      true
      (let ((h (pair-sum (car positions)))
            (i (pair-difference (car positions)))
            (j (car (car positions))))
        (and (diagonal-safe h i (cdr positions))
             (row-safe j (cdr positions))))))

(define (row-safe j positions)
  (if (null? positions)
      true
      (and (not (equal? j (car (car positions))))
           (row-safe j (cdr positions)))))

(define (diagonal-safe h i positions)
  (if (null? positions)
      true
      (and (and (not (equal? h (pair-sum (car positions))))
                (not (equal? i (pair-difference (car positions)))))
           (diagonal-safe h i (cdr positions)))))

(define (adjoin-position new-row k rest-of-queens)
  (append (list (list new-row k)) rest-of-queens))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(adjoin-position 0 4 (list (list 1 0) (list 3 1) (list 0 2) (list 2 3)))
(row-safe 2 (list (list 0 1) (list 4 5) (list 6 7)))
(diagonal-safe -1 2 (list (list 1 2) (list 3 1) (list 0 2)))
(safe? 4 (list (list 3 4) (list 0 3) (list 2 2) (list 4 1) (list 1 0)))
(length (queens 0))
(length (queens 1))
(length (queens 2))
(length (queens 3))
(length (queens 4))
(length (queens 9))
(length (queens 10))
(length (queens 11))
  







