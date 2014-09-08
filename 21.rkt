;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |21|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")))))
(require rackunit)
(require rackunit/text-ui)
(require 2htdp/image)

;; DATA DEFINITIONS: none
;; human-img string string Number Number -> Image    
;; GIVEN: First name, last name, height and weight of a person 
;; RETURNS: Returns an image propotional to the height and weight.
;; EXAMPLES: (human-img Arulselvan Madhavan 180 165) => Image
;; DESIGN STRATEGY: Domain Knowledge

;(define (human-img FN LN ht wt)
;  
;  
;  )
;(define ht 168)
;(define wt 162)
(define-struct person (first-name last-name age height weight))


(define-struct image-dimensions (final_img_ht final_img_wid))



(define (human-img FN LN age ht wt)
   (head (compute-image-dimensions ht wt))
  )

(define (compute-image-dimensions ht wt)
  (make-image-dimensions (* ht 2.5) (* wt 2.5))
  )
;(define (calc_ht ht)
;  (* ht 2.5)
;  )
;(define (calc_wt wt)
;  (* wt 2.5)
;  )
;(define final_img_ht (calc_ht (person-height (make-person FN LN age ht wt))))
;(define final_img_wid (calc_wt (person-weight (make-person FN LN age ht wt))))

(define (head_radius image-dimensions)
  (/ (/ (/ (+ (image-dimensions-final_img_ht ) (image-dimensions-final_img_wid)) 2) 4.8) 2)
)

(define (head image-dimensions)
  (circle (head_radius image-dimensions) "outline" "blue")
  )

;(define chest_ht
;  ( / final_img_ht 2.15)
;  )
;
;(define chest_wt
;  (/ final_img_wid 3)
;  )
;
;(define chest
;  (rectangle chest_wt chest_ht "outline" "blue")
;  )
;
;
;(define lg_ht
;  (/ final_img_ht 3)
;  )
;(define lg_wt
;  (/ final_img_wid 16.2)
;  )
;
;(define right-leg
;  (rectangle lg_wt lg_ht "outline" "blue")
;  )
;
;(define left-leg
;  (rectangle lg_wt lg_ht "outline" "blue")
;  )
;
;(define hnd_ht
;  (/  final_img_ht 10.5)
;  )
;
;(define hnd_wt
;  (/ final_img_wid 3.25)
;  )
;
;(define right-hand
;  (ellipse hnd_wt hnd_ht "outline" "blue")
;  )
;
;(define left-hand
;  (ellipse hnd_wt hnd_ht "outline" "blue")
;  )
;
;(define head_over_chest
;  (above head chest)
;  )
;
;(define head_chest_hands
;  (beside right-hand head_over_chest left-hand)
;  )
;
;(define rt_leg_x_pos (+ (image-width right-hand) (/ (image-width chest) 4)))
;(define rt_leg_y_pos (image-height head_chest_hands))
;(define head_chst_rt_lg 
;  (overlay/xy right-leg (- 0 rt_leg_x_pos) (- 0 rt_leg_y_pos) head_chest_hands)
;  )
;
;(define lf_leg_x_pos (+ rt_leg_x_pos (/ (image-width chest) 2) ))
;;(define lf_leg_y_pos (image-height head_chest_hands))
;;(define (human-img FN LN age ht wt)
;;  
;;  (final-image(head_chst_rt_lg(
;;  )
;;(define final-image
;;(overlay/xy left-leg (- 0 lf_leg_x_pos) (- 0 rt_leg_y_pos) head_chst_rt_lg)
;;  )
;
;;(define (human-img FN LN age ht wt)
;;  )
;;
;;(define set-img-ht-wt
;;  ( calc_ht (ht)) 
