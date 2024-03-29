;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |19|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "htdp")))))
;;Ex19: Design the following function:
;; rel-rec-sequence: Number Number -> Rectangle
;; Takes two numbers and returns a solid blue rectangle, where the first 
;; number is the width of the rectangle, and the second number is the 
;; proportion of width and height of the rectangle to be produced 
;;(i.e. height = width * proportion).

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require rackunit)
(require rackunit/text-ui)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; DATA DEFINITIONS: none
;; rel-rec-sequence: Number Number -> Image   
;; GIVEN:Width of the Rectangle and Proportion of height to width
;; RETURNS: Image of a Rectangle with dimensions height * width
;; EXAMPLES: (rel-rec-sequence 10 4)=> Rectangle with width 10 and height 40
;; DESIGN STRATEGY: Functional Composition

(define ( rel-rec-sequence w p)
  (rectangle w (* w p) "solid" "blue")
  )

;;TESTS
(check-equal? (image-height (rel-rec-sequence 10 4))
               40 "Error:Expected Output is 40") 