#lang racket

#|1. Bubble sort
|#
(define (bubble-sort lst)
  (if (> (length lst) 1)
  (if (> (car lst) (cadr lst))
      (cons (car lst) (bubble-sort (cons (cadr lst) (cddr lst))))
      (cons (cadr lst) (bubble-sort (cons (car lst) (cddr lst))))
      )
  lst
  ))
(define (insert message)
  (display message)
  (read))
(define (bubble lst)
  (if (> (length lst) 1)
      (bubble-sort (cons (car lst) (bubble (cdr lst))))
      lst
      ))
(bubble (insert "Введите список для сортировки.\n Список вводится в круглых скобках"))
(newline)

#| Quick Sort
|#

(define (quick-sort lst)
  (cond
    [(< (length lst) 2) lst]
    [else (let ([pivot (car lst)] [rest (cdr lst)])
        (append
           (quick-sort (filter (lambda (x) (< x pivot)) rest))
           (list pivot)
           (quick-sort (filter (lambda (x) (>= x pivot)) rest))
        )
   )]))
(quick-sort (insert "Введите список для сортировки.\n Список вводится в круглых скобках"))
(newline)

#|
9. Lexer
|#
(require parser-tools/lex)
(require (prefix-in : parser-tools/lex-sre))
(define custom-lexer
  (lexer
   [(:: "define")
    (cons `(DEFINE ,(string->symbol lexeme))
          (custom-lexer input-port))]
   [(:+ (:or (char-range #\a #\z) (char-range #\A #\Z)))
    (cons `(ID ,(string->symbol lexeme))
          (custom-lexer input-port))]
   [(:: "#")
    (cons `(SHARP ,(string->symbol lexeme))
          (custom-lexer input-port))]
   [(:: (:? #\-) (:+ numeric))
    (cons `(INT ,(string->number lexeme))
          (custom-lexer input-port))]
   [whitespace
    (custom-lexer input-port)]
   [(eof)
    '()]))
(define (my-lang-lexer value)
    (let ([input (open-input-string value)]) (custom-lexer input))
)
;(custom-lexer (insert "Введите команду: "))
;(newline)

(my-lang-lexer "#define x 15")
