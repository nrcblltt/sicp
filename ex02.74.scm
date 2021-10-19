#lang sicp

; the individal divisions' files don't need a specific structure
; as long as each division's system has a procedure to return a record from a file
; or a salary from a record

; we create a tab with operations and divisions and put in the respective procedures
; the table has a row for the get-record procedure and one for get-salary
; (the tab creation procedures are not shown here)

; all the divisions' files should be tagged with the division tag

(define (tagged-file division original-file)
  (cons division original-file))

(define (division file)
  (car file))

(define (file-content file)
  (cdr file))

; now we operate on tagged files and we return a tagged record

(define (get-record name file)
  (cons (division file) ((get 'get-record (division file)) name (file-content file))))

; now we operate on tagged records (we have tagged the record once extracted)

(define (get-salary record)
  ((get 'get-salary (car record)) (cdr record)))

; we prepare a list of tagged division files and work on it

(define (find-employee-record name files-list)
  (if (get-record name (car files-list))
      (get-record name (car files-list))
      (find-employee-record name (cdr files-list))))

; to add a new company we have to extend the table and to tag its file