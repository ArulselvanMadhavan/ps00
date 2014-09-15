;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |13|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")))))
;Ex13: What will happen if you type (make-point true false)? 
;what is the result of (point-x (make-point true false))?
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
;Ex13: What will happen if you type (make-point true false)? 
;A object of structure Point will get created. 

;what is the result of (point-x (make-point true false))?
;It will return 'true'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
