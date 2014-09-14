;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |28|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
;;Ex28: Design a function that takes a list of lists of strings as an argument 
;;that treats each of the lists of strings as a line (assembled like in Ex27) 
;;in a text and renders the whole text as an image.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require rackunit)
(require rackunit/text-ui)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;DATADEFINITIONS
;;List Representation
;; A List of Strings(LOS) is one of 
;; -- empty                     interp: The List is empty
;; -- cons Number LOS           interp: List with Strings as its elements
;;CONSTRUCTOR TEMPLATE
;;(list "Arul" "Selvan")

;;Example: (list "Arul" "Selvan") => (cons "Arul" (cons "Selvan" empty))

;;DESTRUCTOR
;; (first list) => Returns the first element in the list
;; (rest list) => Returns the all elements except the first element

;;template:
;; list-fn : LOS -> ??
;;(define (list-fn LOS)
;;   (cond
;;        [(empty? LOS) ...]
;;        [else (... (first LOS) (list-fn (rest LOS)))]))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; List of List of Strings Representation
;; A List Of List Of Strings(LOLOS) is one of 
;; -- empty                     interp: The List is empty
;; -- cons Number LOLOS           interp: List with LOS as its elements
;;CONSTRUCTOR TEMPLATE
;;(list (list "Arul" "Selvan")
;;      (list "Alan" "Turing"))

;;Example:(list (list "Arul" "Selvan") 
;;              (list "Alan" "Turing"))=>(cons (cons "Arul"(cons "Selvan" empty)) 
;;                                       (cons (cons "Alan"(cons "Turing" empty))
;;                                       empty))

;;DESTRUCTOR
;; (first list) => Returns the first element in the list
;; (rest list) => Returns the all elements except the first element

;;template:
;; list-fn : LOLOS -> ??
;;(define (list-fn LOLOS)
;;   (cond
;;        [(empty? LOLOS) ...]
;;        [else (... (first LOLOS) (list-fn (rest LOLOS)))]))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;list-of-str-lsts List -> Image
;;Given  : List of List of strings
;;Returns: An Image of the strings composed as a text and 
;;placed one over the other.
;;Example: (list-of-str-lsts(list (list "Arul" "Selvan") 
;;                         (list "Alan" "Turing")) => Image 
;;Strategy: Functional Composition
;;GLOBAL CONSTANTS
(define WHT-SPC (text " " 24 "blue"))

(define (list-of-str-lsts lst)
  (cond
    [(empty? lst) WHT-SPC]
    [(cons? lst) (above/align "left"
                              (string-text(first lst)) 
                              (list-of-str-lsts (rest lst)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;string-text List -> Image
;;Given  : List of strings
;;Returns: An Image of the strings composed as a text.
;;Example: (string-text(list (list "Arul" "Selvan") => Image 
;;Strategy: Functional Composition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (string-text lst-of-strg)
  (cond
    [(empty? lst-of-strg) WHT-SPC]
    [(cons? lst-of-strg)  (beside 
                           (text (first lst-of-strg) 24 "blue")
                           WHT-SPC (string-text (rest lst-of-strg)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;TESTS
;;TEST CONSTANTS
(define 1st-sntnce (list "My" "Name" "is" "Arulselvan"))
(define 2nd-sntnce (list "I" "like" "Computer" "Science"))
(define 3rd-sntnce (list "I" "am" "doing" "Masters" "in" "Computer" "Science"))
(define 4th-sntnce (list "Thank" "You"))
(define sntncs-list (list 1st-sntnce 2nd-sntnce 3rd-sntnce 4th-sntnce))
(list-of-str-lsts sntncs-list)

