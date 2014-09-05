;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;Ex 2: Write an expression that returns true if the result of 100/3 is greater than the result of (100 + 3) / (3 + 3) and false otherwise.

;;DATA DEFINITIONS: NONE
;;Number Number -> Boolean
;;GIVEN  : Input Number #1 : 100/3
;;       : Input Number #2 : (100 + 3) / (3 + 3)
;;RETURNS: true  , if Input Number #1 > Input Number #2
;;       : false , if Input Number #1 < Input Number #2
;;EXAMPLE#1: (> (/ 100 3) (/ (+ 100 3) (+ 3 3))) => true
;;DESIGNSTRATEGY: Domain Knowledge

(> (/ 100 3) (/ (+ 100 3) (+ 3 3)))

;TESTS
(check-equal? (> (/ 100 3) (/ (+ 100 3) (+ 3 3))) true "Error: The expected output is: true")