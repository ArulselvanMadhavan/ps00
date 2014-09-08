;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |10|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;Purpose of the file: To define a function that takes 3 numbers as arguments
;;and returns the sum of the two larger numbers.
;;How to run the Program: (findthelowestno <number1> <number2> <number3>)
;;Require Statements
(require rackunit)
(require 2htdp/universe)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;DATA DEFINTIONS: none
;;sumofmaxnos Number Number Number  -> Number
;;Given   : 3 Integer Numbers x y z
;;Returns : Sum of the largest 2 Integer numbers within x y z
;;Examples: 
;;(sumofmaxnos 10 2 5) => 15
;;(sumofmaxnos 8 3 12) => 20
;;Design Strategy: Domain Knowledge

(define (findthelowestno x y z)
  (cond
    [(< x y) (cond
               [(< x z) x]
               [else z])]
    [else (cond 
            [(< y z) y]
            [else z])]))



(define (sumofmaxnos x y z)
  (- (+ x y z) (findthelowestno x y z)))

;Tests
(check-equal? (sumofmaxnos -8 -5 -2) -7 "Error:Expected Output is -7")
(check-equal? (sumofmaxnos -80 50 22) 72 "Error:Expected Output is 72")
(check-equal? (sumofmaxnos 80 50 22) 130 "Error:Expected Output is 130")
(check-equal? (sumofmaxnos 2.5 0.5 0.55) 3.05 "Error:Expected Output is 3.05")
(check-equal? (sumofmaxnos 0.4 0.5 0.3) 0.9 "Error:Expected Output is 0.9")