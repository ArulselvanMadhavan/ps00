;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |20|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")))))
(require rackunit)
(require rackunit/text-ui);(require htdp/image)

;; DATA DEFINITIONS: none
;; human-img -> Image    
;; GIVEN: None 
;; RETURNS: Returns an image resembling human shape
;; EXAMPLES: (human)=>
;; DESIGN STRATEGY: Domain Knowledge


(define head
  (circle 42.5 "outline" "blue")
  )

(define chest
  (rectangle 155 195 "outline" "blue")
  )

(define right-leg
  (rectangle 25 140 "outline" "blue")
  )
   
(define left-leg
  (rectangle 25 140 "outline" "blue")
  )

(define right-hand
  (ellipse 125 40 "outline" "blue")
  )

(define left-hand
  (ellipse 125 40 "outline" "blue")
  )

(define head_over_chest
  (above head chest)
  )

(define head_chest_hands
  (beside right-hand head_over_chest left-hand)
  )

(define rt_leg_x_pos (+ (image-width right-hand) (/ (image-width chest) 4)))
(define rt_leg_y_pos (image-height head_chest_hands))
(define head_chst_rt_lg 
  (overlay/xy right-leg (- 0 rt_leg_x_pos) (- 0 rt_leg_y_pos) head_chest_hands)
  )

(define lf_leg_x_pos (+ rt_leg_x_pos (/ (image-width chest) 2) ))
;(define lf_leg_y_pos (image-height head_chest_hands))
(define human
  (overlay/xy left-leg (- 0 lf_leg_x_pos) (- 0 rt_leg_y_pos) head_chst_rt_lg)
  )