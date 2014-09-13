;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |17|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;Purpose of the file: Create some solid blue rectangles with the following dimensions:
;;2x4
;;4x8
;;8x16
;;16x32
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 2htdp/image)
(require rackunit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;The contract, purpose statement and examples for this function are:
;;Data definitions: None
;;tower   : N/A -> Image 
;;GIVEN  : N/A
;;RETURNS: Image constructed to represent the word tilt.
;;Example: tilt => Image
;:DESIGN STRATEGY: Functional Composition
;;GLOBAL CONSTANTS:

;; A rectangle with dimensions 2 x 4
(define RECT_2x4 (rectangle 2 4 "outline" "blue") )
;; A rectangle with dimensions 4 x 8
(define RECT_4x8 (rectangle 4 8 "outline" "blue") )
;; A rectangle with dimensions 8 x 16
(define RECT_8x16 (rectangle 8 16 "outline" "blue") )
;; A rectangle with dimensions 16 x 32
(define RECT_16x32 (rectangle 16 32 "outline" "blue") )
;; An image constructed using image-functions
(define tower (above RECT_2x4 RECT_4x8 RECT_8x16 RECT_16x32))

