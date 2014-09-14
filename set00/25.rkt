;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |25|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;;Ex25: Design a function that, given a list of booleans, returns true if all 
;;booleans in the list are true. Write down contract, purpose statement and 
;;examples, and test your function.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require rackunit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;DATA DEFINITIONS
;;List Representation
;; A List of Booleans(LOB) is one of 
;; -- empty                     interp: The List is empty
;; -- cons true LOB             interp: The List contains Boolean values
;;Example: (list true false) => (cons true (cons false empty))
;;CONSTRUCTOR 
;; (list Boolean Boolean Boolean)
;; (list Number Number Number)
;;DESTRUCTOR
;; (first list) => Returns the first element in the list
;; (rest list) => Returns the all elements except the first element
;;template:
;; list-fn : List -> ??
    ; (define (list-fn lst)
    ;   (cond
    ;     [(empty? lst) ...]
    ;     [else (... (first lst) (list-fn (rest lst)))]))

;;check-boolean ListofBoolean -> Boolean
;;Given: List of Boolean values
;;RETURNS: True  - If the list is full of 'True'
;;       : False - If atleast one of the values in the list is false 
;;                 or if the list is empty
;; 
;;EXAMPLES: check-boolean (list true true true) =>  true
;;          check-boolean (list true true false) =>  false
;;Strategy: Functional Composition

(define (check-boolean lst)
  (if (empty? lst) 
      false 
      (test-boolean-list lst)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;test-boolean ListofBoolean -> Boolean
;;Given: List of Boolean values
;;RETURNS: True  - If the list is full of 'True'
;;       : False - If atleast one of the values in the list is false.
;;EXAMPLES: check-boolean (list true true true) =>  true
;;          check-boolean (list true true false) =>  false
;;Strategy: Structural Decomposition
(define (test-boolean-list lst)
   (cond
    [(empty? lst) true]
    [(and  (first lst) (test-boolean-list (rest lst)))  true]
    [else false]))

;;TESTS
;;TEST CONSTANTS
(define mylst (list true true true true true))
(define mylst2 (list true true false))
(check-equal? (check-boolean mylst) true "Error:Expected Output is True")
(check-equal? (check-boolean mylst2) false "Error:Expected Output is False")
(check-equal? (check-boolean (list)) false "Error: Expected Output is false")
     
