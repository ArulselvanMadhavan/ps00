;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |9|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;PRoblem 9
;> (remainder 5 2)
;1
;> (modulo 5 2)
;1
;> (remainder 144 12)
;0
;> (modulo 144 12)
;0
;> (modulo 143 12)
;11
;
;Examples
;(iseven -10)
;(iseven -5)

;remainder
(define (iseven x)
  (cond
    [(= (remainder x 2) 0) true]
    [else false]
    )
  )