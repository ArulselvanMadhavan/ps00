;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |27|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;;Ex27: Design a function that takes a list of strings and draws the combined text of those strings, separated by spaces.

(require rackunit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Data Definitions: 
;;List Representation
;; A List of Strings(LOS) is one of 
;; -- empty                     interp: The List is empty
;; -- cons Number LOS           interp: List with Strings as its elements
;;CONSTRUCTOR TEMPLATE
;;(list "Arul" "Selvan")

;;Example: (list "Arul" "Selvan") => (cons "Arul" (cons "Selvan" empty))

;;DESTRUCTOR
;; (first list) => Returns the first element in the list
;; (rest list) => Returns the all elements except the first element

;;template:
;; list-fn : LOS -> ??
;;(define (list-fn LOS)
;;   (cond
;;        [(empty? LOS) ...]
;;        [else (... (first LOS) (list-fn (rest LOS)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;string_text ListofStrings -> Image
;Given  : A List with String values as its elements
;Returns: An image combining all the string elements of the given list
;Example; string_text (list "Arul" "Selvan") => Image
;Strategy: Structural Decomposition

(define (string_text lst_of_strg)
  (cond
    [(empty? lst_of_strg) ""]
    [(cons? lst_of_strg) 
     (string-append (first lst_of_strg) " " (string_text(rest lst_of_strg)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;TESTS
;;TEST CONSTANTS
(define string_list (list "My" "Name" "is" "Arulselvan"))
(check-equal? (string_text string_list) "My Name is Arulselvan " 
              "Error: Expected Output is My Name is Arulselvan ")
(check-equal? (string_text empty) "" "Error:Expected Output is  ")
