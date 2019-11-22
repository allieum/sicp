#lang sicp

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define left-branch car)
(define right-branch cadr)
(define branch-length car)
(define branch-structure cadr)

(define (weight branch)
  (let ((structure (branch-structure branch)))
    (if (number? structure) structure
        (total-weight structure))))

(define (total-weight mobile)
  (+ (weight (left-branch mobile))
     (weight (right-branch mobile))))

(define (torque branch)
  (let ((length (branch-length branch))
        (weight (weight branch)))
    (* length weight)))

(define (balanced? mobile)
  (if (not (list? mobile)) #t
      (let ((left-substructure (branch-structure (left-branch mobile)))
            (right-substructure (branch-structure (right-branch mobile))))
        (and (= (torque (left-branch mobile)) (torque (right-branch mobile)))
             (balanced? left-substructure)
             (balanced? right-substructure)))))

(define balanced-mobile (make-mobile (make-branch 2 6) (make-branch 3 4)))
(define inbalanced-mobile (make-mobile (make-branch 2 3) (make-branch 10 2)))
(define nested-balanced-mobile (make-mobile (make-branch 2 10)
                                            (make-branch 2 balanced-mobile)))

; if we change the constructors to use cons instead of list, i would only need
; to change right-branch and branch-structure to be cdr instead of cadr.