#lang sicp

; in Luis's program (queen-cols k) calls (queen-cols (- k 1)) board-size times instead of just calling it once, as in the original procedure. 
; so, for a board-size of 8, this means that the time T is increased by a factor of 8^8 
