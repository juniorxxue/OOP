#lang racket
;; --------------------------------
;; First-class classes
;; --------------------------------

(define person%
  (class object%
    ;; data abstraction
    (init-field name lisper)
    (super-new)
    ;; method
    (define/public (greet)
      "say hello")))

(define pl (new person% (name "Xu") (lisper #t)))
(send pl greet)

;; --------------------------------
;; Inheritance
;; --------------------------------
(define child%
  (class person%
    (super-new)
    (define/override (greet)
      "ur so cute")))

(define cl (new child% (name "kid xu") (lisper #t)))
(send cl greet)

;; --------------------------------
;; Mixins
;; --------------------------------
(define (ready-mixin cls%)
  (class cls%
    (super-new)
    (define/override (greet)
      (string-append "NEW!!! " (super greet)))))

(define person-ready% (ready-mixin person%))
(send (new person-ready% (name "XU") (lisper #t)) greet)

;; --------------------------------
;; Interface
;; --------------------------------

(define hug-interface
  (interface () hug))


(define kid%
  (class* person% (hug-interface)
    (super-new)
    (define/public (hug)
      "hugging")))

(send (new kid% (name "XU") (lisper #t)) hug)