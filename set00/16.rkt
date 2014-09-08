;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |16|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

(require 2htdp/image)

(define my-image (bitmap "rocket-s.jpg"))
(define empty_space (bitmap "Empty_Space.jpg"))

(define v-img (above my-image my-image my-image))
(define h-img (beside my-image my-image my-image))
;Letter T
(define T
(above h-img v-img )
)
;Letter L

(define offset-width (/ (image-width h-img) 2) )
(define offset-height (+ (/ (image-height v-img) 2)(/ (image-height h-img) 2)))
(define L
(overlay/offset h-img (- 0 offset-width) (- 0 offset-height) v-img)
)
;Letter I
(define I
(above h-img my-image my-image h-img)
)
;Word TILT

(define TILT
  (beside T empty_space I empty_space L empty_space T)
  )

