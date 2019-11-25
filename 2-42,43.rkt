#lang sicp

(define (from a b)
  (if (> a b) nil
      (cons a (from (+ 1 a) b))))

(define (accumulate combine init items)
  (if (null? items) init
      (combine (car items)
               (accumulate combine init (cdr items)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (filter keep? items)
  (cond ((null? items) nil)
        ((keep? (car items))
         (cons (car items) (filter keep? (cdr items))))
        (else (filter keep? (cdr items)))))


; representation of set of board positions:
; list of row indexes of placed queens
(define (queens board-size)
  (define empty-board nil)
  (define (adjoin-position row rest)
    (cons row rest))
  (define (safe? positions)
    (define (conflict? r1 r2 dist)
      (or (= r1 r2)
          (= r1 (+ r2 dist))
          (= r1 (- r2 dist))))
    (define (iter i rest)
      (if (null? rest) #t
          (and (not (conflict? (car positions) (car rest) i))
               (iter (+ 1 i) (cdr rest)))))
    (iter 1 (cdr positions)))
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         safe?
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row rest-of-queens))
                 (from 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (repeat action n)
  (map (lambda (x) (action)) (from 1 n)))

(define (size items) (accumulate + 0 (map (lambda (x) 1) items)))

(define (print board)
  (define (print-empty-square) (display "_"))
  (define (print-queen) (display "X"))
  (define (print-row i)
    (repeat print-empty-square (- i 1))
    (print-queen)
    (repeat print-empty-square (- (size board) i))
    (newline))
  (foreach print-row board)
  (newline))

(define (foreach action items)
  (cond ((not (null? items))
         (action (car items))
         (foreach action (cdr items)))))

(define (pretty-queens size)
  (foreach print (queens size)))

; ex 2.43: interchanging the order of the nested mappings is slower because
; the recursive (queen-cols (- k 1)) call will happen board-size times at
; each level of recursion. So while the original solution for 8-queens has
; 8 recursive calls, Louis's solution will have like 8^8. idk dude, it's
; gonna be slower tho. internet says 500x slower.