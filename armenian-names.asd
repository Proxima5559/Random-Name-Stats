(asdf:defsystem "armenian-names"
  :description "Armenian Name Generator with HTMX"
  :author "Proxima5559"
  :depends-on (:hunchentoot :cl-who) 
  :components ((:file "data") 
               (:file "persistence")      
               (:file "server")))    