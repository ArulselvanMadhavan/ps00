;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |17|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require 2htdp/image)

(define rect_2x4
(rectangle 2 4 "outline" "blue")
 )

(define rect_4x8
(rectangle 4 8 "outline" "blue")
 )

(define rect_8x16
(rectangle 8 16 "outline" "blue")
 )

(define rect_16x32
(rectangle 16 32 "outline" "blue")
 )

(define tower
  (above rect_2x4 rect_4x8 rect_8x16 rect_16x32)
  )
