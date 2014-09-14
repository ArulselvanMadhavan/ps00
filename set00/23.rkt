;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |22|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;Ex 22: Write down an expression whose value is the list of numbers from 1 to 5.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require rackunit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Data Definitions: 
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

(define listofbooleans (list true false true false true))

;(cons true (cons false (cons true (cons false (cons true empty)))))

(check-equal? listofbooleans 
              (cons true (cons false (cons true (cons false (cons true empty)))))
              "Error: Expected output is (cons true (cons false (cons true (cons false (cons true empty)))))")
