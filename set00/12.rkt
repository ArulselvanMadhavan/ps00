;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |12|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")))))
;Ex12: What are the values of the following expressions? Be sure to predict 
;the answers in your head before trying the expressions.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;DATA DEFINITIONS
(define-struct point (x y))
;; (point) -> signature
;; (point-x p) -> any
;; p is an object of datatype point.
;; (point-y p) -> any
;; p is an object of datatype point.
;; (point? p) -> Boolean
;; Returns true if 'p' is of Point datatype
;;CONSTRUCTOR TEMPLATE 
;; A Point is a (make-point Number Number)
;;x is the position of the point on the x-axis(horizontal)
;;y is the position of the point on the y-axis(vertical)

;;DESTRUCTOR TEMPLATE
;(define (point-fn point)
;  (...
;      (point-x point)
;;      (point-y point)))      

;;EXAMPLES
;;To make an object with point structure - (make-point 5 6)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(make-point 5 3) - An object of Point structure will get created.
;Point-x=5 and Point-y = 3
;(point? 5) - False
;(point? true) - False
;(point? (make-point 2 1)) - True
;(point-x (make-point 8 5)) -  8
;(point-y (make-point 42 15)) - 15