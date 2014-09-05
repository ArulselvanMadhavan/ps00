;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |4|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;Ex 4: Define a function called tip that takes two arguments
;a number representing the amount of a bill in dollars.
;a decimal number between 0.0 and 1.0, representing the percentage of tip one wants to give (e.g. 0.15 = 15%). 
;tip should return the amount of the tip in dollars.

;; DATA DEFINITIONS: none
;;tip - Non-negativenumber Number[0.0,1.0] -> number
;;GIVEN#1 - Amount of Bill in dollars
;;GIVEN#2 - Percentage of tip
;;RETURNS - Amount of tip in dollars
;;EXAMPLE#1 - (tip 10 0.03) => 0.3
;;EXAMPLE#2 - (tip 10 0.2)  => 2
;;DESIGN STRATEGY: Domain Knowledge

(define (tip x y)
  (cond 
    [(and (> y 0.0) (< y 1.0)) (* x y)]
    [else "Invalid Tip percentage entered. Try again with a valid input"]
  )
  )

;;TESTS
(check-equal? (tip 10 0.03) 0.3 "Error:Expected Tip amount is 0.3$")
(check-equal? (tip 10 0.2) 2 "Error:Expected Tip amount is 2$")
(check-equal? (tip 10 1.5) "Invalid Inou Try again with a invalid input" "Error:Expected Output is: Invalid Tip percentage entered. Try again with a valid input")
