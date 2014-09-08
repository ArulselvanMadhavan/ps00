;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |8|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;Purpose of the file: To Compute the area included in a circle of radius r
;;How to run the program: (circle-area <radius of the circle>)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;DATA DEFINITIONS: None
;;circle-area Number -> Number
;;Given    : Radius of the Circle
;;Returns  : Area of the circle
;;Example#1:(circle-area 2.5) => 19.634954084936208
;;Example#2:(circle-area 7)   => 153.93804002589985

(define (circle-area r)
  (* pi (sqar r)))
;;TESTS
(check-= (circle-area 2.5) 19.634954084936208 0.1  "Error: Expected Output is 19.634954084936208")
(check-= (circle-area 7) 153.93804002589985 0.1 "Error: Expected Output is 19.634954084936208")