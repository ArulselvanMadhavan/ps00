;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |27|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))

(require rackunit)
(require rackunit/text-ui)

;Design a function that takes a list of strings 
;and draws the combined text of those strings, separated by spaces.

;;DATA DEFINITIONS
;string_text ListofStrings -> Image
;Given  : A List with String values as its elements
;Returns: An image combining all the string elements of the given list

(define string_list (list "My" "Name" "is" "Arulselvan"))

(define (string_text lst_of_strg)
  (cond
    [(empty? lst_of_strg) ""]
    [(cons? lst_of_strg) 
     (string-append (first lst_of_strg) " " (string_text(rest lst_of_strg)))]))

(string_text string_list)
(string_text empty)