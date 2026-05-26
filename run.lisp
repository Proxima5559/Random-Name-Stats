(in-package :cl-user)

(push (uiop:getcwd) asdf:*central-registry*)

(ql:quickload :armenian-names)

(lisp-htmx-app::start-app)

(format t "~%🚀 Application started successfully!~%")
