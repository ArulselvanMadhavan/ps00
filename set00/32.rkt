;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |32|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;Ex32: Design a function that takes a list of Points 
;and returns the sum of all distances of that Points from (0,0).
;You should write a helper function to calculate the distance.
;For simplicity, you can use the Manhattan distance measure (distance = x + y)

;;DATA DEFINITIONS

;;posn representation
;;(define-struct posn x y)
;;CONSTRUCTOR TEMPLATE
;; A posn is a (make-posn x y)
;; x represents the position of the point in the x-axis(Horizontal)
;; y represents the position of the in the y-axis(vertical)
;; DESTRUCTOR TEMPLATE
;; posn-fn: posn -> ??
;(define (posn-fn pos)
;  (...
;      (posn-x pos)
;      (posn-y pos)))
;;EXAMPLES: 
;;(define posn-fn (make-posn x y))


;;List Representation
;; A List of Posn(LOP) is one of 
;; -- empty               interp: The List is empty
;; -- cons true LOP       interp: The List contains Posn values as its elements
;;Example: (list (make-posn 4 5) 
;;               (make-posn 6 7))=>(cons (make-posn 4 5) 
;;                                       (cons (make-posn 6 7) empty))
;;CONSTRUCTOR 
;; (list Boolean Boolean Boolean)
;; (list Number Number Number)
;;DESTRUCTOR
;; (first list) => Returns the first element in the list
;; (rest list) => Returns the all elements except the first element
;;template:
;; list-fn : LOP -> ??
; (define (list-fn LOP)
;   (cond
;     [(empty? LOP) ...]
;     [else (... (first LOP) (list-fn (rest LOP)))]))



;;END DATA DEFINITIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;manhattan-dist ListOfPoints -> Number
;;GIVEN   : A List of Points
;;RETURNS : Sum of Manhattan distances of all the points in the list.
;;Examples: (manhattan-dist (make-posn 4 5) (make-posn 2 3)) => 14
;;Strategy: Functional Composition
(define (manhattan-dist lst)
  (cond
    [(empty? lst) 0]
    [(cons? lst) (+ (dist-helper (first lst)) (manhattan-dist (rest lst)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;dist-helper Posn -> Number
;;GIVEN   : An input of structure Posn
;;RETURNS : Sum of the x and y values of the Posn.
;;Examples: (dist-helper (make-posn 4 5)) => 9
;;Strategy: Domain Knowledge

(define (dist-helper pt)
  (+ (posn-x pt) (posn-y pt)))

;;TESTS
;;TEST CONSTANTS
(define ListOfPoints (list (make-posn 2 3) (make-posn 5 10) (make-posn 50 0)))
(manhattan-dist ListOfPoints)
(manhattan-dist (list (make-posn 0 3) (make-posn -5 10) (make-posn 50 0)))
