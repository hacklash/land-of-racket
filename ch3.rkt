#lang racket
(require rackunit)

(define (square n)
  (* n n))

; Racket has three equivalence tests: eq?, eqv? and equal?
; you probably want equal?
(check-not-eq? 'fooo 'FoOo)
(check-not-eqv? 'fooo 'FoOo)
(check-not-equal? 'fooo 'FoOo)
; Symbols in Racket are case-sensitive, unlike Common Lisp

(check-equal? (+ 1 1.0) 2.0)

(check-equal? (expt 53 53)
              24356848165022712132477606520104725518533453128685640844505130879576720609150223301256150373)

(/ 4 6)  ; will print 2/3
(/ 4.0 6); will print 0.6666666666666666

(displayln "Tutti Frutti"); Tutti Frutti
; Racket print functions: write, print, display, displayln and fprintf
; do not return strings
(displayln "He yelled \"Stop that thief!\" from the busy street.")

(expt 2 3)
'(expt 2 3)

; The rest of the chapter works almost exactly like the book
; except that Racket prints the quote and case matters
(check-equal? (cons 'chicken 'cat) 
              '(chicken . cat))
(check-equal? (cons 'chicken empty) 
              '(chicken))
(check-equal? (cons 'chicken empty) 
              (cons 'chicken '() ))
(check-equal? (cons 'pork '(beef chicken))
              '(pork beef chicken))
(check-equal? (cons 'beef (cons 'chicken '()))
              '(beef chicken))
(check-equal? (cons 'pork (cons 'beef (cons 'chicken empty)))
              '(pork beef chicken))
(check-equal? (car '(beef chicken))
              'beef)
(check-equal? (cdr '(pork beef chicken))
              '(beef chicken))

(check-equal? (car (cdr '(pork beef chicken)))
              'beef)
(check-equal? (car (cdr '(pork beef chicken)))
              (cadr '(pork beef chicken)))

(check-equal? (list 'pork 'beef 'chicken)
              '(pork beef chicken))


(check-equal? (car '((peas carrots tomatoes)(pork beef chicken)))
              '(peas carrots tomatoes))
(check-equal? (cdr '(peas carrots tomatoes))
              '(carrots tomatoes))
(check-equal? (cdr (car '((peas carrots tomatoes)(pork beef chicken))))
              '(carrots tomatoes))
(check-equal? (cdr (car '((peas carrots tomatoes)(pork beef chicken))))
              (cdar '((peas carrots tomatoes)(pork beef chicken))))

; cddr, caddr, addar, cadadr and more all work like Common Lisp's