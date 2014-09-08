;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |9|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;Purpose#1 of the file: To Find out what the operator remainder does
;;by typing it in the definitions window, highlighting it, and pressing F1.
;;How to run the program: N/A
;;Require Statements: N/A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Typing remainder or any other function name and pressing F1 
;;after highlighting thw word(blue color) will launch the helpdesk 
;;with the highlighted word as the search keyword \
;;and will return the search results

;;Example#1 (remainder 5 2)=>1
;;Example#2 (modulo 5 2)=>1
;;Inference: Applying modulo and remainder to positive integers yields 
;;identical results
;;Example#3 (remainder -5 2)=> -1
;;Example#4 (modulo -5 2)=>1
;;Inference: Applying modulo and remainder to negative integers yields 
;; different results
;Reason: Remainder function is designed to apply the denominator to the 
;;numerator and provide a "result" that when added with the divisor yields 
;;the Dividend whereas a modulo function tells us how much the dividend is 
;;offset from a multiple of the divisor.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Purpose#2 of the file: Illustrate the difference between remainder and modulo
;;with the help of examples. 
;;How to run the program: (chk-even <input the number to be tested>)
;;Require Statements 
(require rackunit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;DATA DEFINITIONS: None
;;chk-even: number -> boolean
;;GIVEN: The number to be tested for even quality
;;RETURN: True if the number is even and false if it is not
;;EXAMPLE#1:(chk-even -10)
;;EXAMPLE#1:(chk-even -5)
;;DESIGN STRATEGY: Domain Knowledge

(define (chk-even x)
  (cond
    [(= (remainder x 2) 0) true]
    [else false]
    )
  )

;TESTS
(check-equal? (chk-even 95) false "Error:Expected Output is false")
(check-equal? (chk-even -42) true "Error:Expected Output is true")
