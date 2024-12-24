#lang racket
(define (find-list-length lst)
  (if (empty? lst)
      0
  (+ 1 (find-list-length (cdr lst)))))

(define (print-insert-result x lst n)
  ;; write logic here
  (if (empty? lst)
      '()
  (let ((first-element (car lst))
            (rest-of-list (cdr lst)))
    (if (list? first-element)
        (if (< (find-list-length first-element) n)
            (cons (cons x (print-insert-result x first-element n))
                  (print-insert-result x rest-of-list n))
            (cons (print-insert-result x first-element n)
                  (print-insert-result x rest-of-list n)))
        (cons first-element (print-insert-result x rest-of-list n))))))
        
  

(define (main)
  (define x (read))
  (define lst (read))
  (define n (read))
  (print-insert-result x lst n))

(main)
 