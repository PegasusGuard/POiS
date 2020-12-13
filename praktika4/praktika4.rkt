#lang racket

#|
21. Реверсия
|#
(define (insert message)
  (display message)
  (read))
(define (reverse_list data)
  (if (null? data)
      null
      (append (reverse_list (cdr data)) (list (car data)))
      ))
(define (reverselistres data)
  (if (null? data)
      null
      (append (reverse_list data) (reverselistres (cdr data)))))
(display "Введите список. Список вводится в круглых скобках")(newline)
(reverselistres (insert "Введите список:"))(newline)


#|
23. Сумма
|#

(define (count lst sum)
   (if(null? lst)
     sum
   (if (list? (car lst))
       (count(cdr lst) (+ sum (count(car lst) 0)))
    (count(cdr lst) (+ sum (car lst))))))
(display "Введите список. Список вводится в круглых скобках")(newline)
(count (insert "Введите список:") 0 )(newline)

#|
23. Произведение
|#

(define (multiply lst mult)
   (if(null? lst)
     mult
   (if (list? (car lst))
       (multiply(cdr lst) (* mult (count(car lst) 0)))
    (multiply(cdr lst) (* mult (car lst))))))
(define (append-element lst elem)
  (append lst (list elem)))
(define (glue list1)
  (if (null? list1)
      list1
      (if (list? list1)
           (cons (multiply list1 1) (glue(cdr list1 )))
           list1)))
(display "Введите список. Список вводится в круглых скобках")(newline)
(glue (insert "Введите список:"))(newline)