#lang sicp

; if the relative frequencies of the n symbols are as described in exercise 2.71, we have the most frequent symbol in the root's left leaf
; this means that encoding it takes a constant time (the procedures looks first on the left leaf)
; the least frequent symbol is in the "deepest" right leaf, so the encode it we need first to scan n-1 elements, then n-2, then n-3... and in the end 1 element
; this gives a n^2 complexity.