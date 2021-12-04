#lang racket
; AVISO: Este codigo no es mantenible en el tiempo :| jsjs
; power consumption = Gama * Epsylon
(define (transform list)
  (map(lambda(x)(string->list x))(map(lambda(x)(number->string x))list)))

(define (len lista cont)
  (if (empty? lista)
      cont
      (len (cdr lista)(+ cont 1))))
(define (todasLargo5? lista)
  (null? (filter(lambda(x)(not(eqv? 5 (len x 0))))lista)))

(define (complete lista)
  (if (todasLargo5? lista)
      lista
      (complete (append (filter(lambda(x)(eqv?(len x 0)5))lista) (map(lambda(x)(append (list #\0) x ))(filter(lambda(x)(not(eqv?(len x 0)5)))lista))))))

(define (a lista)
  (list (map(lambda(x)(car x))lista)
        (map(lambda(x)(cadr x))lista)
        (map(lambda(x)(caddr x))lista)
        (map(lambda(x)(cadddr x))lista)
        (map(lambda(x)(car(cddddr x)))lista)))

(define (a2 lista)
  (list (map(lambda(x)(car x))lista)
        (map(lambda(x)(cadr x))lista)
        (map(lambda(x)(caddr x))lista)
        (map(lambda(x)(cadddr x))lista)
        (map(lambda(x)(car(cddddr x)))lista)
        (map(lambda(x)(cadr(cddddr x)))lista)
        (map(lambda(x)(caddr(cddddr x)))lista)
        (map(lambda(x)(cadddr(cddddr x)))lista)
        (map(lambda(x)(car(cddddr(cddddr x))))lista)
        (map(lambda(x)(cadr(cddddr(cddddr x))))lista)
        (map(lambda(x)(caddr(cddddr(cddddr x))))lista)
        (map(lambda(x)(cadddr(cddddr(cddddr x))))lista)))

(define (gamma lista1 lista2 l)
  (if (empty? lista1)
      l
      (if (>= (car lista1)(car lista2))
          (gamma (cdr lista1)(cdr lista2)(append l (list 1)))
          (gamma (cdr lista1)(cdr lista2)(append l (list 0))))))

(define (epsylon gamma)
  (if (empty? gamma)
      null
      (if (eqv? 1 (car gamma))
          (cons 0 (epsylon (cdr gamma)))
          (cons 1 (epsylon (cdr gamma))))))
; GAMMA
; DELTA

(define (decimalToBinary lista r binario)
  (if (empty? lista)
      r
      (if (eqv? 1 (car lista))
          (decimalToBinary (cdr lista) (+ r (expt 2 (car binario)))(cdr binario))
          (decimalToBinary (cdr lista) r (cdr binario)))))

(define (final eje22)
  (*(decimalToBinary (gamma
                    (map(lambda(miniLista2)(len miniLista2 0))(map (lambda(miniLista) (filter(lambda(elemento)(eqv? #\1 elemento))miniLista))eje22))
                    (map(lambda(miniLista2)(len miniLista2 0))(map (lambda(miniLista) (filter(lambda(elemento)(eqv? #\0 elemento))miniLista))eje22))
                    null) 0 (list 4 3 2 1 0))
  (decimalToBinary(epsylon
                   (gamma
                    (map(lambda(miniLista2)(len miniLista2 0))(map (lambda(miniLista) (filter(lambda(elemento)(eqv? #\1 elemento))miniLista))eje22))
                    (map(lambda(miniLista2)(len miniLista2 0))(map (lambda(miniLista) (filter(lambda(elemento)(eqv? #\0 elemento))miniLista))eje22))
                    null)) 0 (list 4 3 2 1 0))))

(define eje2 (final (a (complete(transform (list 00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010))))))

eje2


(define(mostCommon list1 list2)(gamma list1 list2 null))
(define(mostCommon2 list1 list2)(epsylon(gamma list1 list2 null)))

(define mostCommonEx
  (mostCommon (map(lambda(miniLista2)(len miniLista2 0))(map (lambda(miniLista) (filter(lambda(elemento)(eqv? #\1 elemento))miniLista))(a (complete(transform (list 00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010))))))
              (map(lambda(miniLista2)(len miniLista2 0))(map (lambda(miniLista) (filter(lambda(elemento)(eqv? #\0 elemento))miniLista))(a (complete(transform (list 00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010))))))))
; MOST COMMON



(define listo(a (complete(transform (list 00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010)))))

(define commonf(map(lambda(x)(if(eqv? x 1)#\1 #\0))mostCommonEx))

(filter(lambda(x)(eqv? (car(cddddr commonf))(car(cddddr x))))
 (filter(lambda(x)(eqv? (cadddr commonf) (cadddr x)))
       (filter(lambda(x)(eqv? (caddr commonf)(caddr x)))
              (filter(lambda(x)(eqv? (cadr commonf)(cadr x)))
                     (filter(lambda(x)(eqv? #\1 (car x)))(complete(transform (list 00100
                                                                                   11110
                                                                                   10110
                                                                                   10111
                                                                                   10101
                                                                                   01111
                                                                                   00111
                                                                                   11100
                                                                                   10000
                                                                                   11001
                                                                                   00010
                                                                                   01010))))))))


