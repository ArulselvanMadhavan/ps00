;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |26|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))

;Design a function that takes a list of Points and draws a solid blue circle
;with radius 10 at every Point in that list into a 300x300 scene.

;;DATA DEFINITIONS
;;Circle_from_list ListofPoints -> Image
;;GIVEN: List consisting of points
;;RETURNS:Circle of radius 10 with those points as the center in a 300X300scene

(define lst_of_pts (list (make-posn 150 150) (make-posn 100 100) (make-posn 295 295) (make-posn 0 0) ))
(define empty_lst (list))
(define MY_CIRCLE (circle 10 "outline" "blue"))
(define MT_SCENE (empty-scene 300 300))

(define (Circles_from_list_pts lst_of_pts)
  (cond
    [(empty? lst_of_pts) MT_SCENE]
    [(cons? lst_of_pts)
     (place-image MY_CIRCLE 
                  (posn-x (first lst_of_pts))
                  (posn-y (first lst_of_pts))
                  (Circles_from_list_pts (rest lst_of_pts)))]))


(Circles_from_list_pts lst_of_pts)
(Circles_from_list_pts empty_lst)