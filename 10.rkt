;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |10|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;Problem 10
(require rackunit)
(require 2htdp/universe)
; DATA DEFINTIONS: none
;sumofmaxnos Number Number Number  -> Number
;Given: 3 Integer Numbers x y z
;Returns: Sum of the largest 2 Integer numbers within x y z
;Examples: 
;(sumofmaxnos 10 2 5) => 15
;(sumofmaxnos 8 3 12) => 20
;Design Strategy: Domain Knowledge
;(define sumofmaxnos(x y z) 
;  (- (+ x y z) (min x y z))
;  )
;;
;TESTS
;(check-equal? (sumofmaxnos -8 -3 -2) -5 "Error: Expected output is -5")




; DATA DEFINTIONS: none
;findthelowestno Number Number Number -> Number
;Given: 3 Integer Numbers x y z
;Returns: Least of the given 3 Integer Numbers
;Examples: 
;(findthelowestno 10 2 5) => 2
;(findthelowestno 8 3 12) => 3
;Design Strategy: Domain Knowledge
;Template

(define (findthelowestno x y z)
  (cond
    [(< x y) 
     (cond
       [(< x z) x]
       [else z]
       )
    ]
    [else 
     (cond
       [(< y z) y]
       [else z]
       )
     ]
    )
  )
     
    

(define (sumofmaxnos x y z)
  (- (+ x y z) (findthelowestno x y z)
  )
)
;(define (lrg x y z)
;  (cond
;    [(> x y) (cond 
;             [(> x z) x]
;             [else z])]
;    [else (> y 
;           
;
;(define (lrg x y z)
;  (cond
;    [(< x y) 