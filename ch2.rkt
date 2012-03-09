#lang racket
(require rackunit); so we can write tests

(define small 1)
(define big 100)

(define (guess-my-number)
  (arithmetic-shift (+ small big) -1) ; the way it is in the book, but the next two also work
  #;(quotient (+ small big) 2)        ; btw: #; comments out until the matching paren
  #;(truncate (/ (+ small big) 2)))   ; ';' to the end of the line

(check-equal? (guess-my-number) 50)

(define (smaller)
  (set! big (sub1 (guess-my-number)))
  (guess-my-number))

(define (bigger)
  (set! small (add1 (guess-my-number)))
  (guess-my-number))

(check-equal? (bigger) 75)
(check-equal? (smaller) 62)
(check-equal? (smaller) 56)

(define (start-over)
  (set! small 1)
  (set! big 100)
  (guess-my-number))

(check-equal? (start-over) 50)

(check-equal? (let ([a 5] ; don't have to do square brackets
                    [b 6]); (let ((a 5)(b 6)) (+ a b)) is the exact same
                (+ a b))
              11)

(check-equal? (let ([f (lambda (n) ; the book will explain lambda in a bit
                       (+ n 10))]) ; Racket doesn't have a function like flet
                (f 5))
              15)

(check-equal? (letrec ([a (lambda (n) (+ n 5))]     ; rec, for recursive.
                       [b (lambda (n) (+ (a n) 6))]); See the last bullet in the chapter
                (b 10))
              21)
              