;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |22|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require rackunit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Data Definitions: 
;;List Representation
;; A List of Numbers(LON) is one of 
;; -- empty                     interp: The List is empty
;; -- cons Number LON           interp: List with Numbers as its elements
;;Example: (list 2 3) => (cons 2 (cons 3 empty))
;;CONSTRUCTOR 
;; (list 2 3 4)
;;DESTRUCTOR
;; (first list) => Returns the first element in the list
;; (rest list) => Returns the all elements except the first element
;;template:
;; list-fn : List -> ??
; (define (list-fn lst)
;   (cond
;     [(empty? lst) ...]
;     [else (... (first lst) (list-fn (rest lst)))]))

(define numbers-1to5 (list 5 4 3 2 1 ))

;;TESTS
;;TEST CONSTANTS
(define listresult (cons 5 (cons 4 (cons 3 (cons 2 (cons 1 empty))))))
(check-equal? numbers-1to5 listresult "Error:List doesn't contain numbers 1 to 5")
