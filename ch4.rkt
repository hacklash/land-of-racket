#lang racket
(require rackunit)

; As mentioned in the book, Racket, like Scheme, treats the empty list differently than Common Lisp
; The only false value is #f which can also be written false

; Also remember that () and nil are not allowed in Racket
; '() is the same as empty and 'nil is not a special identifier like it is in Lisp

(define (my-length list)
  (if (empty? list)
      0
      (add1 (my-length (rest list)))))

(define (is-true? b)
  (if b 'yup 'nope))

(check-equal? (is-true? (= (+ 1 2) 3))
              'yup)
(check-equal? (is-true? (= (+ 1 2) 4))
              'nope)

(define (describe-list l)                                      
  (if (empty? l) 'the-list-is-empty 'the-list-has-stuff-in-it))
; can also be written as
(define (describe-list-alt l)
  (if (cons? l) 'the-list-has-stuff-in-it 'the-list-is-empty))

(check-equal? (describe-list '(1)) 'the-list-has-stuff-in-it)
(check-equal? (describe-list '()) 'the-list-is-empty)

(check-equal? (if (odd? 5)
                  'odd-number
                  'even-number)
              'odd-number)
(check-equal? (if (odd? 5)
                  'odd-number
                  (/ 1 0))
              'odd-number)
; Notice that if we evaluated the false branch, this test would fail
; because of a divide by zero exception

(define number-was-odd empty)
(check-equal? (if (odd? 5)
                  (begin (set! number-was-odd 't)
                         'odd-number)
                  'even-number)
              'odd-number)
(check-equal? number-was-odd 't)

(define number-is-odd empty)
(check-equal? (when (odd? 5)
                (set! number-is-odd 't)
                'odd-number)
              'odd-number)
(check-equal? number-is-odd 't)
(check-equal? (unless (odd? 4)
                (set! number-is-odd empty)
                'even-number)
              'even-number)
(check-equal? number-is-odd empty)


; to be continued
