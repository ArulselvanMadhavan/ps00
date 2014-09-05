;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |8|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;Ex 8: The area included in a circle of radius r is given by the formula pi * r^2.
;Using the interaction window of DrRacket as a calculator, compute the area included in circles of radius 1, 5, and 7.
;;DATA DEFINITIONS: None
;;circle-area Number -> Number
;;Given: Radius of the Circle
;;Returns : Area of the circle
;;Example#1:(circle-area 2.5) => 19.634954084936208
;;Example#2:(circle-area 7)   => 153.93804002589985

(define (circle-area r)
  (* pi (sqar r)))
;;TESTS
(check-= (circle-area 2.5) 19.634954084936208 0.1  "Error: Expected Output is 19.634954084936208")
(check-= (circle-area 7) 153.93804002589985 0.1 "Error: Expected Output is 19.634954084936208")


;Ex 9: Find out what the operator remainder does by typing it in the definitions window, highlighting it, and pressing F1.

;;remainder
Typing remainder in definitions window and pressing F1 after highlighting it , opens the search manual in the default browser.

;Try applying remainder on some examples to make sure you understand what it does. (what is its difference with modulo?)
;;Example#1: (remainder 5 4) =>1