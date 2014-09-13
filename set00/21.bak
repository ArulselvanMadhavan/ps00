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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;CONTRACT
;;person-img person -> Image
;;GIVEN   : A person
;;RETURNS : An Image proportional to the height and width of the person
;;EXAMPLES: person-img(person) => Image
;;DESIGN STRATEGY: Functional Composition

(define (person-img prsn)
  (final_image (person-height prsn) (person-weight prsn) ))

(define (final_image height weight)
  (overlay/xy (left-leg height weight) (- 0 (lf_leg_x_pos height weight)) (- 0 (rt_leg_y_pos height weight)) ( head_chst_rt_lg height weight))
  )

(define (head_chst_rt_lg height weight)
  (overlay/xy (right-leg  height weight) (- 0 (rt_leg_x_pos height weight)) (- 0 (rt_leg_y_pos height weight)) ( head_chest_hands height weight))
  )

(define ( head_chest_hands height weight)
  (beside (right-hand height weight) (head_over_chest height weight) (left-hand height weight))
  )

(define (head_over_chest height weight)
  (above (head height weight) (chest height weight))
  )

(define (head height weight)
  (circle (head_radius height weight) "outline" "blue")
  )

(define (head_radius height weight)
  
  (/ (/ (/ (+ (* height 2.5 ) (* weight 2.5)) 2) 4.8) 2)
  
  )
(define (chest height weight)
  
  (rectangle (/ (* weight 2.5) 3)( / (* height 2.5) 2.15) "outline" "blue")
  
  )

(define (right-hand height weight) 
  (ellipse (/ (* weight 2.5) 3.25) (/ (* height 2.5) 10.5) "outline" "blue")
  )

(define (left-hand height weight) 
  (ellipse (/ (* weight 2.5) 3.25) (/ (* height 2.5) 10.5) "outline" "blue")
  )

(define (rt_leg_y_pos height weight)
  (image-height (head_chest_hands height weight))
  )
(define (rt_leg_x_pos height weight)
  (- (+ (image-width (right-hand height weight)) (/ (image-width (chest height weight)) 4)) (/ (image-width (left-leg height weight)) 2))
  )

(define (lf_leg_x_pos height weight)
  (+ (rt_leg_x_pos height weight)  (/ (image-width (chest height weight)) 2))
  )

(define (right-leg height weight)
  (rectangle  (/ (* weight 2.5) 16.2) (/ (* height 2.5)  3) "outline" "blue")
  )

(define (left-leg height weight)
  (rectangle (/ (* weight 2.5) 16.2) (/ (* height 2.5)  3) "outline" "blue")
  )
