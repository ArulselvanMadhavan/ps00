;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |25|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))

(require rackunit)
(require rackunit/text-ui)
;;DATA DEFINITIONS
;;check_boolean ListofBoolean -> Boolean
;;Given: List of Boolean values
;;RETURNS: True  - If the list is full of 'True'
;;       : False - If atleast one of the values in the list is false.
;;Fetch the first element in list
;;Check if it is equal to true , if yes , proceed to next list
;;If no , return false

(define (ch_emp_lst lst)
  (if (empty? lst) false (check_boolean lst)))

(define (check_boolean lst)
   (cond
    [(empty? lst) true]
    [(and  (first lst) (check_boolean (rest lst)))  true]
    [else false]))
(define mylst (list true  true true true true))

(length mylst)
(check_boolean mylst)
     