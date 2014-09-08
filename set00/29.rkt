;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |29|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
(require rackunit)
(require rackunit/text-ui)


;Ex29: Look up the beside/align function on the Racket Help Desk. 
;Use it to design a function that takes a list of people (as defined in Ex21)
;and uses the function from Ex21 to draw these people, 
;placing them beside each other to form some kind of a group photo.


(define-struct person [first-name last-name age height weight])
(define-struct image-dimensions [ht wt])
;(define (person-img first-name last-name age height weight)
; (final_image height weight) 
;)

(define (person-img prsn)
  (final_image (person-height prsn) (person-weight prsn)))

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




