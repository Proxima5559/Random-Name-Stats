(defpackage :armenian-names.persistence
  (:use :cl)
  (:export :*name-history* :load-history :update-history :clear-history))

(in-package :armenian-names.persistence)

(defvar *name-history* '())
(defvar *history-file* "history.txt")

(defun load-history ()
  (if (probe-file *history-file*)
      (with-open-file (in *history-file*) (setf *name-history* (read in)))
      (setf *name-history* '())))

(defun update-history (name)
  (unless (member name *name-history* :test #'string=)
    (push name *name-history*)
    (when (> (length *name-history*) 8) (setf *name-history* (butlast *name-history*)))
    (with-open-file (out *history-file* :direction :output :if-exists :supersede :if-does-not-exist :create)
      (print *name-history* out))))

(defun clear-history ()
  (setf *name-history* '())
  (delete-file *history-file*))