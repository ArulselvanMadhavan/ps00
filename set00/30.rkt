;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |30|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;;Ex30: Design a function that, given a list of booleans,returns a list with
;;each boolean reversed.
;;(e.g. (neg-list (list true false true)) => (list false true false))
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
;; list-fn : LOB -> ??
    ; (define (list-fn LOB)
    ;   (cond
    ;     [(empty? LOB) ...]
    ;     [else (... (first LOB) (list-fn (rest LOB)))]))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;neg-list LOB -> LOB
;;Given: List of Booleans
;;Returns: A List with all the boolean values reversed
;;Example:
;;(neg-list (list true false true))=>(cons false (cons true (cons false empty)))
;;Strategy: Structural Decomposition


(define (neg-list lst)
  (cond 
    [(empty? lst) empty]
    [(cons? lst) (cons (false? (first lst)) (neg-list (rest lst)))]))

;;TESTS
;;TEST CONSTANTS
(define lst-of-booleans (list true false true false))
;(define lst-of-booleans-answer (cons false (cons true (cons false (cons true empty)))))
(neg-list lst-of-booleans)

(neg-list (list false))
(neg-list empty)

(check-equal? (neg-list (list false)) (cons true empty) 
              (string-append "Error:Expected Output is"
                             "(cons true empty)" ))
              