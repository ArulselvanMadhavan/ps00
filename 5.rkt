;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;Ex 5: Define a function called sq that computes the square of a number. 
;Write the contract, purpose statement, examples and definition of this function. Follow the examples of contracts and purpose statements above.

;; DATA DEFINITIONS: none
;sqar: Number -> Number
;;GIVEN - Number of any kind (int,decimal) for which its square value needs to be computed
;;Output - Squared value of the input number
;;Examples#1: (sqar -3)  => 9
;;Examples#2: (sqar 1.8) => 3.24

(define (sqar x)
  (* x x)
  )
;;TESTS
(check-equal? (sqar -3) 9 "Error:Expected Output is 9")
(check-equal? (sqar -1.8) 3.24 "Error:Expected Output is 3.24")