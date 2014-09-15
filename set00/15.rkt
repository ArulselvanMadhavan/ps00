;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |15|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;;Ex15: Write down reasonable comments for the definition of the type Student 
;;from Ex14 that define the types of the fields and their interpretation.
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

