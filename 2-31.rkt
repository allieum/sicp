#lang sicp

(define (square x) (* x x))

(define (tree-map mapper tree)
  (map (lambda (subtree)
         (if (pair? subtree)
             (tree-map mapper subtree)
             (mapper subtree)))
       tree))

(define (square-tree tree) (tree-map square tree))