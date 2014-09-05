;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |7|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;Ex 7: Define a function called circumference that computes the circumference of a circle. The contract, purpose statement, and usage of circumference are:
;;DATA DEFINITIONS: None
;;circumference : Number -> Number
;; GIVEN: the radius r of a circle 
;; RETURNS: its circumference, using the formula 2 * pi * r.
;; Examples:
    ; (circumference 1)  =>  6.283185307179586 
    ; (circumference 0)  =>  0
    ; (circumference 4)  =>  25.132741228718345
    ; (circumference 6)  =>  37.69911184307752
; NO need to define pi as a constant variable. IT is already defined.

(define (circumference r)
  (* 2 pi r)
  )

;;TESTS
(check-= (circumference 1) 6.283185307179586 0.1 "Error: Expected Output is ")
(check-equal? (circumference 0) 0  "Error: Expected Output is Zero")
(check-= (circumference 4) 25.132741228718345 0.1  "Error: Expected Output is 25.132741228718345")
(check-= (circumference 6) 37.69911184307752 0.1  "Error: Expected Output is 37.69911184307752")
