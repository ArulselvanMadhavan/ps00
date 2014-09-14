;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |31|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;;Ex31: Design a function that, given a list of Numbers,
;;returns a list of Images,where each image is a circle
;;that has a radius based on a number of the input list.

;;DATA DEFINITIONS
;;List Representation
;; A List of Numbers(LON) is one of 
;; -- empty                     interp: The List is empty
;; -- cons true LON             interp: The List contains Numbers
;;Example: (list 5 32) => (cons 5 (cons 32 empty))
;;CONSTRUCTOR 
;; (list 5 32)
;; (list 2 87 26)
;;DESTRUCTOR
;; (first list) => Returns the first element in the list
;; (rest list) => Returns the all elements except the first element
;;template:
;; list-fn : LON -> ??
    ; (define (list-fn LON)
    ;   (cond
    ;     [(empty? LON) ...]
    ;     [else (... (first LON) (list-fn (rest LON)))]))

;;listcfcircles: ListOfNumbers -> ListOfImages
;;GIVEN   : A List consisting of Numbers
;;RETURNS : A List of images of circles 
;           whose radii value is taken from the input list
;;Example : (listofcircles (list 5 15)) => Image of circles
;;Strategy: Structural Decomposition

(define (listcfcircles lst)
  (cond
    [(empty? lst) empty]
    [(cons? lst) (cons (circle (first lst) "outline" "blue") 
                       (listcfcircles (rest lst)))]))

;;TESTS
;;TEST CONSTANTS
(define circles-set1 (list 15 0 5 32 1 60))
(listcfcircles circles-set1)