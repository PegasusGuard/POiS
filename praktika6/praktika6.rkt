#lang racket

#|
1. Rings
|#

(define (round_prec value prec)
    (let ([mult (expt 10 prec)])
        (/ (round (* value mult)) mult)))
(display "Вычисление площади кольца.\n")
(display "Введите исходные данные:\n")
(display "Радиус кольца (см) => ")
(define radius-ring (read (current-input-port)))
(display "Радиус отверстия (см) => ")
(define radius-hole (read (current-input-port)))
(if (radius-hole . >= . radius-ring)
    (display "Ошибка! Радиус отверстия не может быть больше радиуса кольца.\n")
    ((lambda (ring hole)
        (let ([result (pi . * . ((expt radius-ring 2) . - . (expt radius-hole 2)))])
            (printf "Площадь кольца: ~a кв.см.\n" (round_prec result 5)))) radius-ring radius-hole))

#|
3. Список из максимальных и минимальных элементов
|#
(define (insert message)
  (display message)
  (read))
(define (generate_list_from_min_max sample)
  (define temp (car sample))                             
  (define min
    (let get_min_elem ((sample sample) (temp temp) (n (length sample)))
       (if (= n 0) temp
         (if (< (abs (car sample)) (abs temp))
             (get_min_elem (cdr sample) (car sample) (- n 1))
             (get_min_elem (cdr sample) temp (- n 1))))))  
  (define max
    (let get_max_elem ((sample sample) (temp temp) (n (length sample)))
      (if (= n 0) temp
        (if (> (abs (car sample)) (abs temp))
          (get_max_elem (cdr sample) (car sample) (- n 1))
          (get_max_elem (cdr sample) temp (- n 1))))))  
  (if (and (integer? min) (integer? max)) (list min max)
      (/ (+ min max) 2)))
(generate_list_from_min_max (insert "Введите список.\n Список вводится в круглых скобках"))
(newline)

((lambda (arg)
   (list
   (if (>= arg 0) "+" "-")
   (abs arg)
   (round arg)
   )) -5.5)