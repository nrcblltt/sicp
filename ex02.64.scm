#lang sicp

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

; partial-tree calcola quanti elementi devono stare nell'albero di destra e in quello di sinistra
; poi costruisce i due sottoalberi ricorsivamente e produce l'albero risultante

; per (1 3 5 7 9 11) viene fuori un albero di questo tipo:
;        5
;     1     9
;      3   7 11

; partial-tree ha un costo lineare (due chiamate su sotto-problemi di dimensione n/2 e un costo costante per unire le soluzioni)
; in list->tree si aggiunge un costo lineare, rimanendo in costo lineare

(list->tree '(1 3 5 7 9 11))

