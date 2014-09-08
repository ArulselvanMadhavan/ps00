;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |6|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;Purpose of the file: To Compute the roots of the Quadratic function
;;How to Run the Program: 
;;(rootsofquadratic_fn <Co-efficient of (x^2)> <Co-efficient of x> <constant>)
;;Require Statements
(require rackunit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;DATA DEFINITIONS: None
;;rootsofquadratic_fn: Number Number Number -> Number
;;GIVEN     : Co-efficients of the Quadratic Function
;;RETURNS   : Root that solves the quadratic function
;;Example#1 : (rootsofquadratic_fn 1 1 -6) => 2
;;DESIGN STRATEGY: Domain Knowledge

(define (rootsofquadratic_fn a b c)
  (/ (+ ( - 0 b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a)))

;;TESTS
(check-equal? (rootsofquadratic_fn 1 1 -6) 2 "Error:Expected Output is 2")