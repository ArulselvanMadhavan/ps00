;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |18|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "htdp")))))

;;Purpose of the file#1:To Write down a formula that describes the 
;;n-th element in this sequence. 
;;nth element in the rectange sequence will have dimensions (2^n x 2^(n+1))

;;Purpose of the file#2:To give the dimensions of the next 2 rectangles
;;in the sequence. 
;;Purpose of the file#3:To Write down a formula that describes the n-th element
;;in this sequence. nth element in the rectange sequence will have dimensions (2^n x 2^(n+1))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require rackunit)
(require rackunit/text-ui)
;; DATA DEFINITIONS: none
;; rectangle-seq Number -> Image
;; GIVEN: The Nth Element in the rectangle sequence
;; RETURNS: Nth Element Rectange from the rectange sequence
;; EXAMPLES: (rectangle-seq 4) => Rectangle with dimensions(x y)=16 32
;; DESIGN STRATEGY: Domain Knowledge
;;(define n 4)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (rectangle-seq n)
  (rectangle (expt 2 n) (expt 2 (+ n 1)) "outline" "blue")
  )
  
;;TEST
(check-equal? (image-height (rectangle-seq 4)) 32 "Error:Expected Output is 32")
(check-equal? (image-width (rectangle-seq 4)) 16 "Error:Expected Output is 16")