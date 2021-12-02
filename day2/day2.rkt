#lang racket
; There are just for take the number like a knowing variable, because the test inputs are to long to converts to strings
(define (forward)1)
(define (down)1)
(define (up)1)

; Day2 AoC
; Domain: list X int X int X int
; Range: int
(define (day2 lista)
  (define (p2 lista hori dep aim)
    (if (empty? lista)
        (* hori dep)
        (if (eqv?(car lista)down)
            (p2 (cdr(cdr lista)) hori dep (+ (cadr lista)aim))
            (if (eqv? (car lista)up)
                (p2 (cdr(cdr lista)) hori dep (- aim (cadr lista)))
                (p2 (cdr(cdr lista)) (+ hori (cadr lista)) (+(* (cadr lista) aim) dep)aim)))))(p2 lista 0 0 0))

; TEST
(day2 (list forward 5 down 5 forward 8 up 3 down 8 forward 2))