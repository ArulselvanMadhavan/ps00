;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |28|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
(require rackunit)
(require rackunit/text-ui)

;Design a function that takes a list of lists of strings as an argument
;that treats each of the lists of strings as a line (assembled like in Ex27)
;in a text and renders the whole text as an image.

;;DATADEFINITIONS
;; string_to_text List -> Image
;;Given  : List of List of strings
;;Returns: An Image of the strings composed as a text.

(define 1st_sntnce (list "My" "Name" "is" "Arulselvan"))
(define 2nd_sntnce (list "I" "like" "Computer" "Science"))
(define 3rd_sntnce (list "I" "am" "doing" "Masters" "in" "Computer" "Science"))
(define 4th_sntnce (list "Thank" "You"))

(define sntncs_list (list 1st_sntnce 2nd_sntnce 3rd_sntnce 4th_sntnce))

(define WHT_SPC (text " " 24 "blue"))

(define (string_text lst_of_strg)
  (cond
    [(empty? lst_of_strg) WHT_SPC]
    [(cons? lst_of_strg)  (beside 
                           (text (first lst_of_strg) 24 "blue")
                           WHT_SPC (string_text (rest lst_of_strg)))]))

(define (list_of_str_lsts lst)
  (cond
    [(empty? lst) WHT_SPC]
    [(cons? lst) (above/align "left"
                              (string_text(first lst)) 
                              (list_of_str_lsts (rest lst)))]))



(list_of_str_lsts sntncs_list)


