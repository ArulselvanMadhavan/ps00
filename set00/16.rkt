;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |16|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;Purpose of the file: TO get to know about the various image functions that 
;;racket offers. 
;;How to run the Program:N/A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 2htdp/image)
(require rackunit)

;;The contract, purpose statement and examples for this function are:

;;Data definitions: None
;;tilt   : N/A -> Image 
;;GIVEN  : N/A
;;RETURNS: Image constructed to represent the word tilt.
;;Example: tilt => Image
;:DESIGN STRATEGY: Functional Composition
;;GLOBAL CONSTANTS:
(define MY-IMAGE (bitmap "rocket-s.jpg"))
;;Interpretation: An image chosen arbitrarily to construct the word TILT.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define EMPTY_SPACE (bitmap "Empty_Space.jpg"))
;;Interpretation: Space used to seperate the letters for clarity
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define VERTICAL-IMG (above MY-IMAGE MY-IMAGE MY-IMAGE))
;;Interpretation: Image placed one over the other
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define HORIZONTAL-IMG (beside MY-IMAGE MY-IMAGE MY-IMAGE))
;;Interpretation: Images lined up horizontally
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Letter T
(define T (above HORIZONTAL-IMG VERTICAL-IMG ))
;;Interpretation: Letter T contructed using Images.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Letter L
(define L-HELPER-WIDTH (/ (image-width HORIZONTAL-IMG) 2) )
(define L-HELPER-HEIGHT (+ (/ (image-height VERTICAL-IMG) 2)(/ (image-height HORIZONTAL-IMG) 2)))
(define L (overlay/offset HORIZONTAL-IMG (- 0 L-HELPER-WIDTH) (- 0 L-HELPER-HEIGHT) VERTICAL-IMG))
;;Interpretation: Images used to contruct the letter L
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Letter I
(define I (above HORIZONTAL-IMG MY-IMAGE MY-IMAGE HORIZONTAL-IMG))
;;Interpretation: 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Word TILT

(define tilt
  (beside T EMPTY_SPACE I EMPTY_SPACE L EMPTY_SPACE T))

;;TESTS
(check-equal? (image-height tilt) 168 "Error:Expected output is 168")
