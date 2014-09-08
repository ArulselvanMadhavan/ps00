;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;Purpose of the file: To write an expression whose value is 
;;the number of seconds in a leap year (a leap year has 366 days). 
;;Also, write 2 more expressions that have the same value.
;;How to Run the Program: (yeartoseconds <Input days>)
;;Require Statements
(require rackunit)
(require rackunit/text-ui)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;DATA DEFINITIONS: NONE
;;secondsinayear: number -> number
;;GIVEN:  LeapYear = 366 days
;;RETURNS: Number of seconds in a leap year
;;GLOBAL CONSTANTS
(define HOURS-IN-A-DAY 24)
(define MINUTES-IN-A-HOUR 60)
(define SECONDS-IN-A-MINUTE 60)
;;EXAMPLE#1: (yeartoseconds 366) => 31622400
;;EXAMPLE#2: (yeartoseconds 365) => 31536000
;;DESIGNSTRATEGY: Domain Knowledge

(define (yeartoseconds days)
  (* days HOURS-IN-A-DAY MINUTES-IN-A-HOUR SECONDS-IN-A-MINUTE)
  )

;;TEST
(check-equal?(yeartoseconds 366) 31622400 "Error:Expected output is 31622400")

;Aliter Expressions
;#1 => (* (* 366 24) (* 60 60))
;#2 => (* (* 366 24 60) 60)