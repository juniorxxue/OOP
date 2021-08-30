;; ---------------------------------------
;; Data Abstraction
;; ---------------------------------------

(defclass person ()
  ())

;; class recreation
(defclass person ()
  ((name
    :initarg :name
    :accessor name)
   (lisper
    :initform nil
    :accessor lisper)))

(defvar pl (make-instance 'person :name "me"))

;; accessor
(name pl)
(lisper pl)

(setf (lisper pl) t)

;; ---------------------------------------
;; Inheritance
;; ---------------------------------------

(defclass child (person)
  ((can-walk-p
    :accessor can-walk-p
    :initform t)))

(defvar cl (make-instance 'child :name "kids"))

(can-walk-p (make-instance 'child))

;; multiple inheritance
(defclass baby (child person)
  ())

;; ---------------------------------------
;; Dynamically typed
;; ---------------------------------------

(find-class 'person)
(class-name (find-class 'person))
(class-of pl)

;; ---------------------------------------
;; Opertaion Abstraction
;; ---------------------------------------
(defgeneric greet (obj)
  (:documentation "say hello"))

(greet pl)

;; dispatching
(defmethod greet ((obj person))
  (format t "Hello ~a ! ~&" (name obj)))

(defmethod greet ((obj child))
  (format t "ur so cute~&"))

(greet pl)
(greet cl)
  
;; multiple dispatching
(defgeneric hug (a b)
   (:documentation "Hug between two persons."))

(defmethod hug ((a person) (b person))
  :person-person-hug)

(defmethod hug ((a child) (b child))
  :person-child-hug)

(hug pl pl)
(hug cl cl)

;; principles
;; 1. compute the list of applicable methods
;; 2. if no method is applicable then signal an error
;; 3. sort the applicable methods in order of specificity
;; 4. invoke the most specific method.

;; specializers
(defgeneric feed (obj meal-type)
  (:method (obj meal-type)
    (declare (ignorable meal-type))
    (format t "eating~&")))

(defmethod feed (obj (meal-type (eql :dessert)))
    (declare (ignorable meal-type))
    (format t "mmh, dessert !~&"))

(feed cl :dessert)
;; mmh, dessert !

(defmethod feed ((obj child) (meal-type (eql :soup)))
    (declare (ignorable meal-type))
    (format t "bwark~&"))

(feed pl :soup)
;; eating
(feed cl :soup)
;; bwark
