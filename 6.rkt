;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |6|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 6: One of the solutions of the quadratic equation is given by the formula:
;;DATA DEFINITIONS: None
;;rootsofquadratic_fn: Number Number Number -> Number
;;GIVEN - Co-efficients of the Quadratic Function
;;RETURNS - Root that solves the quadratic function
;;Example#1 - (rootsofquadratic_fn 1 1 -6) => 2
;;DESIGN STRATEGY: Domain Knowledge

(define (rootsofquadratic_fn a b c)
  (/ (+ ( - 0 b) (sqrt (- (sqar b) (* 4 a c)))) (* 2 a)))

;(define (num a b c)
;	(+ ( - 0 b) (sqrt (- (sqar b) (* 4 a c)))))


;;TESTS
;(Check-equal? (rootsofquadratic_fn 1 1 -6) 2 "Error:Expected Output is 2")