;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |20|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")))))
;;Ex20: Try to assemble a human shape from circles and rectangles using the 
;;image functions above. It does not need to look fancy, just imagine a head, 
;;a chest and arms and feet. 
;;Then use the stepper to see how DrRacket assembles your image.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require rackunit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DATA DEFINITIONS: none
;; human-image-> Image    
;; GIVEN: None 
;; RETURNS: An image that resembles a human shape
;; EXAMPLES: (human) => <Image of a human>
;; DESIGN STRATEGY: Domain Knowledge
;; GLOBAL CONSTANTS

(define HMN-HEAD-RADIUS 42.5)
(define HMN-CHEST-HEIGHT 195)
(define HMN-CHEST-WIDTH 155)
(define LEG-HEIGHT 140)
(define LEG-WIDTH 25)
(define HAND-HEIGHT 40)
(define HAND-WIDTH 125)
(define HMN-IMG-COLOR "blue")
(define HMN-IMG-MODE "outline")

;Head of the Human image
(define HEAD (circle HMN-HEAD-RADIUS HMN-IMG-MODE HMN-IMG-COLOR))

;Chest of the Human image
(define CHEST (rectangle HMN-CHEST-WIDTH HMN-CHEST-HEIGHT
                         HMN-IMG-MODE HMN-IMG-COLOR))

;Right leg of the Human image
(define RIGHT-LEG (rectangle LEG-WIDTH LEG-HEIGHT HMN-IMG-MODE HMN-IMG-COLOR))

;Left leg of the Human image
(define LEFT-LEG (rectangle LEG-WIDTH LEG-HEIGHT HMN-IMG-MODE HMN-IMG-COLOR))

;Right hand of the Human image
(define RIGHT-HAND (ellipse HAND-WIDTH HAND-HEIGHT HMN-IMG-MODE HMN-IMG-COLOR))

;Left hand of the Human image
(define LEFT-HAND (ellipse HAND-WIDTH HAND-HEIGHT HMN-IMG-MODE HMN-IMG-COLOR))

;Human image with head and chest
(define HEAD-OVER-CHEST (above HEAD CHEST))

;Human image with head,chest and hands
(define HEAD-CHEST-HANDS (beside RIGHT-HAND HEAD-OVER-CHEST LEFT-HAND))

;X Position of the Right leg in the image
(define RT-LEG-X-POS (- (+ (image-width RIGHT-HAND) (/ (image-width CHEST) 4))
                        (/ (image-width LEFT-LEG) 2)))

;X Position of the Left leg in the image
(define LF-LEG-X-POS (+ RT-LEG-X-POS (/ (image-width CHEST) 2) ))

;Y Position of the Legs in the Image
(define LEG-Y-POS (image-height HEAD-CHEST-HANDS))


;Place the Right leg on the computed x,y positions over the image constructed 
;with head,chest and hands
(define HEAD-CHEST-RT-LG (overlay/xy RIGHT-LEG (- 0 RT-LEG-X-POS)
                                     (- 0 LEG-Y-POS) HEAD-CHEST-HANDS))

;Place the Left leg on the computed x,y positions over the image constructed 
;with head,chest,hands and right leg . This action completes the human image.

(define HUMAN (overlay/xy LEFT-LEG (- 0 LF-LEG-X-POS) 
                          (- 0 LEG-Y-POS) HEAD-CHEST-RT-LG))

;;TESTS
;;TEST CONSTANTS
(define HUMAN-HEIGHT (+ (image-height HEAD) (image-height CHEST)
                        LEG-HEIGHT))
(define HUMAN-WIDTH (+ HAND-WIDTH (image-width CHEST) HAND-WIDTH))

(check-equal? (image-height HUMAN) HUMAN-HEIGHT (string-append "Error:Expected Output is" (number->string HUMAN-HEIGHT)))
(check-equal? (image-width HUMAN) HUMAN-WIDTH (string-append "Error:Expected Output is" (number->string HUMAN-WIDTH)))
