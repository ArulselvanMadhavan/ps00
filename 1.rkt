;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;Ex 1: Write an expression whose value s the number of seconds in a leap year (a leap year has 366 days). Next, write 2 more expressions that have the same value.

;Expression that gives the number of seconds in a leap year -(* 366 24 60 60)
;Answer: 31622400

;Aliter Expressions
;#1 => (* (* 366 24) (* 60 60))
;#2 => (* (* 366 24 60) 60)

;;DATA DEFINITIONS: NONE
;;Secondsinayear: Number -> Numbers
;;GIVEN:  Leap Year - 366 days
;;RETURNS: Number of seconds in a leap year
;;EXAMPLE#1: (yeartoseconds 366) => 31622400
;;EXAMPLE#2: (yeartoseconds 365) => 31536000
;;DESIGNSTRATEGY: Domain Knowledge
(require rackunit)
(require rackunit)
(require rackunit/text-ui)

(define (yeartoseconds days)
  (* days 24 60 60)
  )

;;TESTS 
(check-equal?(yeartoseconds 366) 31622400 "Error:Expected output is 31622400")