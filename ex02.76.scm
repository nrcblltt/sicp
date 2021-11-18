#lang sicp

; 1 - new type. define a representation (or representations), define, if needed, generic selectors
; 1 - new operations. define the operations (add operations to the representations), modify the generic selectors
; 2 - new type. expand the table adding new columns, installing the package
; 2 - new operations. expand the table by adding new rows
; 3 - new data objects. just write them, don't need to modify the other objects
; 3 - new operations. we modify the data objects who might receive the message (add the operation)

; if new types of data objects are often added, 3 is better
; if new operations are often added, 2 is better.