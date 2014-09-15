;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |14|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;Ex14: Which functions will Racket create when we execute the below line
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require rackunit)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;DATA DEFINITIONS
;;STUDENT REPRESENTATION
(define-struct student (id name major))
;;CONSTRUCTOR TEMPLATE
;; A student is a (make-student Number String String)
;; id is the Student Identification Number assigned to Student
;; name is the Name of the Student
;; major is the field in which the student will major / have majored already.
;;DESTRUCTOR TEMPLATE
;;student-fn student -> ??
;(define (student-fn student)
;  (...
;      (student-id student)
;      (student-name student)
;      (Student-major student)))

;;EXAMPLES
;;EXAMPLE#1:
;(make-student 00177625 "Arulselvan" "CS")=>(make-student 177625 "Arulselvan" "CS")
;;EXAMPLE#2:
;;(student? (make-student 177625 "Arulselvan" "CS"))=>true
;;EXAMPLE#3:
;;(student-id (make-student 177625 "Arulselvan" "CS"))=>177625
;;EXAMPLE#4:
;;(student-name (make-student 177625 "Arulselvan" "CS"))=>"Arulselvan"
;;EXAMPLE#4:
;;(student-major (make-student 177625 "Arulselvan" "CS"))=>"CS"

;;Functions that racket will create when the above command is executed are:

;;make-student-A new instance of the student type with arguments as id,name and major.
;;student? -Takes any argument as input and returns true if the argument is a valid student.
;;student-id - Returns the id attribute of a valid student type.
;;student-name - Returns the name attribute of a valid student type. 
;;student-major - Returns the major attribute of a valid student type.
