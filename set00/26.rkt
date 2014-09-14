;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |26|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;;Ex:26 - Design a function that takes a list of Points and draws a solid blue
;;circle with radius 10 at every Point in that list into a 300x300 scene.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;DATA DEFINITIONS
;;posn representation
;;(define-struct posn x y)
;;CONSTRUCTOR TEMPLATE
;; A posn is a (make-posn x y)
;; x represents the position of the point in the x-axis(Horizontal)
;; y represents the position of the in the y-axis(vertical)
;; DESTRUCTOR TEMPLATE
;; posn-fn: posn -> ??
;(define (posn-fn pos)
;  (...
;      (posn-x pos)
;      (posn-y pos)))
;;EXAMPLES: 
;;(define posn-fn (make-posn x y))


;;List Representation
;; A List of Posn(LOP) is one of 
;; -- empty               interp: The List is empty
;; -- cons true LOP       interp: The List contains Posn values as its elements
;;Example: (list (make-posn 4 5) 
;;               (make-posn 6 7))=>(cons (make-posn 4 5) 
;;                                       (cons (make-posn 6 7) empty))
;;CONSTRUCTOR 
;; (list Boolean Boolean Boolean)
;; (list Number Number Number)
;;DESTRUCTOR
;; (first list) => Returns the first element in the list
;; (rest list) => Returns the all elements except the first element
;;template:
;; list-fn : List -> ??
    ; (define (list-fn lst)
    ;   (cond
    ;     [(empty? lst) ...]
    ;     [else (... (first lst) (list-fn (rest lst)))]))



;;END DATA DEFINITIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;circle-from-list ListofPosn -> Image
;;GIVEN: List consisting of posns
;;RETURNS:Circle of radius 10 with those points as the center in a 300X300scene
;;EXAMPLE:
;;(circle-from-list-pts (list (make-posn 15 15) (make-posn 5 5))=>Image
;;STRATEGY: Functional Composition
;;GLOBAL CONSTANTS
(define EMPTY-LIST (list))
(define MY-CIRCLE (circle 10 "outline" "blue"))
(define MT-SCENE (empty-scene 300 300))

(define (circle-from-list-pts lst-of-pts)
  (cond
    [(empty? lst-of-pts) MT-SCENE]
    [(cons? lst-of-pts)
     (place-image MY-CIRCLE 
                  (posn-x (first lst-of-pts))
                  (posn-y (first lst-of-pts))
                  (circle-from-list-pts (rest lst-of-pts)))]))

;;TESTS
;;TEST CONSTANTS
(define lst-of-pts (list (make-posn 150 150) 
                         (make-posn 100 100) 
                         (make-posn 295 295) 
                         (make-posn 0 0)))

(circle-from-list-pts lst-of-pts)
(circle-from-list-pts EMPTY-LIST)