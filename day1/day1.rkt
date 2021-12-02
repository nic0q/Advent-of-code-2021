#lang racket

; Reduce: My version of reduce
(define (reduce op acum lista)
  (if (empty? lista)
      acum
      (reduce op (op acum (car lista)) (cdr lista))))

; Day1 AoC
; Domain: list
; Range: int

(define (ej1p1 lista)
  (define (ej1p1r lista)
    (if (null? (cdr lista))
        null
        (if (<(car lista)(car(cdr lista)))
            (cons 2 (ej1p1r (cdr lista)))
            (cons 1 (ej1p1r (cdr lista))))))
  (reduce + 0 (map(lambda(x)1)(filter(lambda(x)(eqv? x 2))(ej1p1r lista)))))

(ej1p1 (list 199 200 208 210 200 207 240 269 260 263))

(define (ej1p2 lista)
  (define (ej1p2r li)
    (if (or(null?(cddr li))) 
        null
        (cons (+(car li)(car(cdr li))(car(cddr li)))(ej1p2r (cdr li)))
        ))
  (ej1p1(ej1p2r lista)))

; TEST
(ej1p2 (list 199 200 208 210 200 207 240 269 260 263))