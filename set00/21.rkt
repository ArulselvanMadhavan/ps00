;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |21|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Ex 21:
;Here is a struct definition:
;(define-struct person (first-name last-name age height weight))
;Write down a reasonable comment part of that data definition that specifies 
;types and interpretations of the fields. Then write the function person-image 
;that takes a person and returns an image like the ones in Ex20, but in a way 
;that the height and width of this image is related to the height of the person 
;(i.e. if one person is twice the size of another person, the image for the 
;first person should be twice as high and wide as the image of the second person)

(require rackunit)
(require 2htdp/image)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;DATA DEFINITIONS
;;PERSON REPRESENTATION
(define-struct person (first-name last-name age height weight))
;;CONSTRUCTOR TEMPLATE 
;;A person is a (make-person String String PosInt PosInt PosInt)
;;first-name is the first-name of the person given as string input.
;;last-name is the last-name of the person given as string input.
;;age is the age of the person , given in Positive Integer form
;;height is the height of the person , given in cms
;;weight is the weight of the person , given in lbs

;;DESTRUCTOR TEMPLATE
;;person-fn : person -> ??
;
;;(define (person-fn prsn)
;;  (...
;;      
;;      (person-first-name prsn)
;;      (person-last-name prsn)))

;;EXAMPLES
;;(define person-fn (make-person "Arul" "Selvan" 24 170 180))
;;(define person-fn (make-person "Alan" "Turing" 23 220 240))


;;ARBITRARY CONSTANTS
(define IMAGE-ARB-CONST 2.5)
(define LEG-WT-ARB-CONST 16.2)
(define LEG-HT-ARB-CONST 3)
(define IMAGE-MODE "outline")
(define IMAGE-COLOR "blue")
(define HAND-WT-ARB-CONST 3.25)
(define HAND-HT-ARB-CONST 10.5)
(define CHEST-WT-ARB-CONST 3)
(define CHEST-HT-ARB-CONST 2.15)
(define HEAD-ARB-CONST1 2)
(define HEAD-ARB-CONST2 4.8)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;person-img person -> Image
;;GIVEN   : A person
;;RETURNS : An Image proportional to the height and width of the person
;;EXAMPLES: person-img(person) => Image
;;DESIGN STRATEGY: Functional composition

(define (person-image prsn)
  (final-image (person-height prsn) (person-weight prsn)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; final-image : PosInt PosInt -> Image
;; GIVEN   : Height of the person in cms and Weight of the person in lbs
;; RETURNS : Human Image with 
;; EXAMPLES: 
;;          (final-image 170 180) => Image
;;          (final-image 220 150) => Image
;; STRATEGY:  Functional Composition

(define (final-image height weight)
  (overlay/xy (left-leg height weight) 
              (- 0 (left-leg-x height weight)) 
              (- 0 (right-leg-y height weight)) 
              ( head-chst-rt-lg height weight)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; head-chst-rt-lg : PosInt PosInt -> Image
;; GIVEN   : Height of the person in cms and Weight of the person in lbs
;; RETURNS : Human Image with a head,chest,right hand, left hand and Right leg
;; EXAMPLES: 
;;          (head-chst-rt-lg 170 180) => Image
;;          (head-chst-rt-lg 220 150) => Image
;; STRATEGY:  Functional Composition


(define (head-chst-rt-lg height weight)
  (overlay/xy (right-leg  height weight) 
              (- 0 (right-leg-x height weight))
              (- 0 (right-leg-y height weight)) 
              ( head-chest-hands height weight)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; head-chest-hands : PosInt PosInt -> Image
;; GIVEN   : Height of the person in cms and Weight of the person in lbs
;; RETURNS : Human Image with a head,chest ,right and left hands
;; EXAMPLES: 
;;          (head-chest-hands 170 180) => Image
;;          (head-chest-hands 220 150) => Image
;; STRATEGY:  Functional Composition

(define (head-chest-hands height weight)
  (beside (right-hand height weight) 
          (head-over-chest height weight) 
          (left-hand height weight)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;head-over-chest : PosInt PosInt -> Image
;; GIVEN   : Height of the person in cms and Weight of the person in lbs
;; RETURNS : Human Image with a head and chest
;; EXAMPLES: 
;;          (head-over-chest 170 180) => Image
;;          (head-over-chest 220 150) => Image
;; STRATEGY:  Functional Composition

(define (head-over-chest height weight)
  (above (head height weight) (chest height weight)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; head : PosInt PosInt -> Image
;; GIVEN   : Height of the person in cms and Weight of the person in lbs
;; RETURNS : Image resembling the head of a human
;; EXAMPLES: 
;;          (head-over-chest 170 180) => Image
;;          (head-over-chest 220 150) => Image
;; STRATEGY:  Domain Knowledge

(define (head height weight)
  (circle (head-radius height weight) IMAGE-MODE IMAGE-COLOR))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; head-radius : PosInt PosInt -> Number
;; GIVEN   : Height of the person in cms and Weight of the person in lbs
;; RETURNS : Radius used to draw the human head
;; EXAMPLES: 
;;          (head-radius 170 180) => 45.57
;;          (head-radius 220 150) => 48.17
;; STRATEGY:  Domain Knowledge

(define (head-radius height weight) 
  (/ (/ (/ (+ (* height IMAGE-ARB-CONST ) (* weight IMAGE-ARB-CONST)) HEAD-ARB-CONST1) HEAD-ARB-CONST2) 2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; chest: PosInt PosInt -> Image
;; GIVEN   : Height of the person in cms and Weight of the person in lbs
;; RETURNS : Image resembling the human chest
;; EXAMPLES: 
;;          (head-radius 170 180) => Image
;;          (head-radius 220 150) => Image
;; STRATEGY:  Domain Knowledge

(define (chest height weight)
  (rectangle (/ (* weight IMAGE-ARB-CONST) CHEST-WT-ARB-CONST)( / (* height IMAGE-ARB-CONST) CHEST-HT-ARB-CONST) IMAGE-MODE IMAGE-COLOR))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; right-hand: PosInt PosInt -> Image
;; GIVEN   : Height of the person in cms and Weight of the person in lbs
;; RETURNS : Image resembling the human hand
;; EXAMPLES: 
;;          (head-radius 170 180) => Image
;;          (head-radius 220 150) => Image
;; STRATEGY:  Domain Knowledge

(define (right-hand height weight) 
  (ellipse (/ (* weight IMAGE-ARB-CONST) HAND-WT-ARB-CONST) (/ (* height IMAGE-ARB-CONST) HAND-HT-ARB-CONST) IMAGE-MODE IMAGE-COLOR))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; left-hand: PosInt PosInt -> Image
;; GIVEN   : Height of the person in cms and Weight of the person in lbs
;; RETURNS : Image resembling the human hand
;; EXAMPLES: 
;;          (head-radius 170 180) => Image
;;          (head-radius 220 150) => Image
;; STRATEGY:  Domain Knowledge

(define (left-hand height weight) 
  (ellipse (/ (* weight IMAGE-ARB-CONST) HAND-WT-ARB-CONST) (/ (* height IMAGE-ARB-CONST) HAND-HT-ARB-CONST) IMAGE-MODE IMAGE-COLOR))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; right-leg-y: PosInt PosInt -> Number
;; GIVEN   : Height of the person in cms and Weight of the person in lbs
;; RETURNS : y-Position in the Image, where the right leg is to be placed
;; EXAMPLES: 
;;          (head-radius 170 180) => Image
;;          (head-radius 220 150) => Image
;; STRATEGY:  Functional Composition

(define (right-leg-y height weight)
  (image-height (head-chest-hands height weight)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; right-leg-x: PosInt PosInt -> Number
;; GIVEN   : Height of the person in cms and Weight of the person in lbs
;; RETURNS : x-Position in the Image, where the right leg is to be placed
;; EXAMPLES: 
;;          (head-radius 170 180) => Image
;;          (head-radius 220 150) => Image
;; STRATEGY:  Functional Composition

(define (right-leg-x height weight)
  (- (+ (image-width (right-hand height weight)) 
        (/ (image-width (chest height weight)) 4))
     (/ (image-width (left-leg height weight)) 2)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; left-leg-x: PosInt PosInt -> Number
;; GIVEN   : Height of the person in cms and Weight of the person in lbs
;; RETURNS : x-Position in the Image, where the left leg is to be placed
;; EXAMPLES: 
;;          (head-radius 170 180) => Image
;;          (head-radius 220 150) => Image
;; STRATEGY:  Functional Composition
(define (left-leg-x height weight)
  (+ (right-leg-x height weight)  (/ (image-width (chest height weight)) 2)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; right-leg: PosInt PosInt -> Image
;; GIVEN   : Height of the person in cms and Weight of the person in lbs
;; RETURNS : Image of the Right leg
;; EXAMPLES: 
;;          (head-radius 170 180) => Image
;;          (head-radius 220 150) => Image
;; STRATEGY:  Domain Knowledge

(define (right-leg height weight)
  (rectangle  (/ (* weight IMAGE-ARB-CONST) LEG-WT-ARB-CONST) (/ (* height IMAGE-ARB-CONST)  LEG-HT-ARB-CONST) IMAGE-MODE IMAGE-COLOR))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; left-leg: PosInt PosInt -> Image
;; GIVEN   : Height of the person in cms and Weight of the person in lbs
;; RETURNS : Image of the Right leg
;; EXAMPLES: 
;;          (head-radius 170 180) => Image
;;          (head-radius 220 150) => Image
;; STRATEGY:  Domain Knowledge

(define (left-leg height weight)
  (rectangle (/ (* weight IMAGE-ARB-CONST) LEG-WT-ARB-CONST) (/ (* height IMAGE-ARB-CONST)  LEG-HT-ARB-CONST) IMAGE-MODE IMAGE-COLOR))


;;TESTS 
(define img-ht-personA 431)
(define img-ht-personB 215)
(check-equal? (image-height (person-image (make-person "A" "L" 23 170 180))) 431 "Error: Expected Image height is 431")
(check-equal? (image-height (person-image (make-person "B" "L" 23 85 90))) 215 "Error: Expected Image height is 215")