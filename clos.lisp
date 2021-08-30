;; 1. dynamic typed language
;; 2. multiple dispatch & multiple inheritance
;; 3. introspection

(defclass person ()
  ((name
    :initarg :name
    :accessor name)
   (lisper
    :initform nil
    :accessor lisper)))

(defvar pl (make-instance 'person :name "me"))

(name pl)
(lisper pl)

(setf (lisper pl) t)

(defclass child (person)
  ())

(defclass child (person)
  ((can-walk-p
    :accessor can-walk-p
    :initform t)))

(defvar cl (make-instance 'child :name "kids"))

(can-walk-p (make-instance 'child))

(defun make-person (name &key lisper)
  (make-instance 'person :name name :lisper lisper))

;; info

(find-class 'person)
(class-name (find-class 'person))
(class-of pl)

;; multiple inheritance
(defclass baby (child person)
  ())

;; generic functions
(defmethod greet (obj)
  (format t "Are you a person ? You are a ~a.~&" (type-of obj)))

(greet pl)

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
  
;; specializers



