#lang racket

(define (print-dfs-result graph start-node)
  (define (get-neighbors node graph)
    (cond
      [(null? graph) '()]
      [(eq? (car (car graph)) node) (cadr (car graph))]
      [else (get-neighbors node (cdr graph))]))

  (define (dfs node visited)
    (if (member node visited)
        visited
        (let* ([neighbors (get-neighbors node graph)]
               [updated-visited (cons node visited)])
          (foldl (lambda (neighbor acc)
                   (dfs neighbor acc))
                 updated-visited
                 neighbors))))

  (define result (reverse (dfs start-node '())))
  (displayln result))

(define (main)
  (define graph (read))
  (define start-node (read))
  (print-dfs-result graph start-node))

(main)
