; (ql:quickload '(:hunchentoot :cl-who))

(defpackage :lisp-htmx-app
  (:use :cl :hunchentoot :cl-who))

(in-package :lisp-htmx-app)

(defvar *server-instance* nil)
(defun start-app ()
  (unless *server-instance*
    (setf *server-instance* (make-instance 'easy-acceptor :port 4242))
    (start *server-instance*))
  (format t "Server started on http://localhost:4242~%"))


(define-easy-handler (home-page :uri "/") ()
  (with-html-output-to-string (s nil :prologue t :indent t)
    (:html
     (:head
      (:title "Armenian Names Generator")
      (:link :rel "stylesheet" :href "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css")
      (:script :src "https://unpkg.com/htmx.org@1.9.10")
      (:style "
        body { 
          background: radial-gradient(circle at center, #1a1a2e 0%, #16213e 100%); 
          color: #fff; 
          min-height: 100vh;
          display: flex; align-items: center; justify-content: center;
        }
        .ui-monster-card {
          background: rgba(255, 255, 255, 0.05);
          backdrop-filter: blur(10px);
          border: 1px solid rgba(255, 255, 255, 0.1);
          border-radius: 20px;
          box-shadow: 0 15px 35px rgba(0,0,0,0.5);
          overflow: hidden;
          transition: transform 0.3s ease;
        }
        .ui-monster-card:hover { transform: translateY(-5px); }
        .card-header {
          background: linear-gradient(90deg, #d90429 0%, #ef233c 100%);
          border-bottom: none;
          font-weight: bold;
          text-transform: uppercase;
          letter-spacing: 2px;
          padding: 20px;
        }
        .btn-check:checked + .btn-outline-primary { background-color: #4361ee; border-color: #4361ee; color: #white; }
        .btn-check:checked + .btn-outline-danger { background-color: #d90429; border-color: #d90429; color: #white; }
        .btn-dark {
          background: #4361ee;
          border: none;
          padding: 12px;
          font-weight: bold;
          transition: all 0.3s;
        }
        .btn-dark:hover { background: #3f37c9; box-shadow: 0 0 20px rgba(67, 97, 238, 0.4); }
        #display { min-height: 150px; display: flex; align-items: center; justify-content: center; }
        .name-display { animation: fadeIn 0.5s ease-out; }
        @keyframes fadeIn { from { opacity: 0; transform: scale(0.9); } to { opacity: 1; transform: scale(1); } }
      "))
     (:body
      (:div :class "card ui-monster-card mx-auto" :style "width: 450px;"
       (:div :class "card-header text-center" "Հայկական անունների թնագարան")
       (:div :class "card-body p-4"
        (:div :class "text-center mb-4"
         (:p :style "color: #8d99ae;" "Ընտրեք սեռը և ուսումնասիրեք անունների պատտմությունը"))
        
        (:div :class "d-flex justify-content-center mb-4"
         (:div :class "btn-group w-100" :role "group"
          (:input :type "radio" :name "gender" :value "male" :id "m" :class "btn-check" :checked t)
          (:label :for "m" :class "btn btn-outline-primary py-2" "ԱՅՐ (Male)")
          (:input :type "radio" :name "gender" :value "female" :id "f" :class "btn-check")
          (:label :for "f" :class "btn btn-outline-danger py-2" "ԿԻՆ (Female)")))
        
        (:div
         (:button :class "btn btn-dark w-100 mb-2"
                  :hx-post "/generate"
                  :hx-include "[name=gender]" 
                  :hx-target "#display"
                  :hx-indicator "#loading"
                  "Ցույց տալ պատահական անուն"))

        (:div :id "display" :class "text-center rounded mt-2 d-flex flex-column align-items-center justify-content-center" 
          :style "background: rgba(0,0,0,0.2); padding: 20px; min-height: 150px;"
          
          (:div :id "loading" :class "htmx-indicator mb-3"
                (:div :class "spinner-border text-primary" :role "status"
                      (:span :class "visually-hidden" "Ներբեռնվում է․․․")))
          
          (:p :class "text-muted m-0" "Մի քիչ սպասեք"))))))))

(define-easy-handler (generate :uri "/generate") (gender)
  (setf (content-type*) "text/html")
  (let ((entry (armenian-names.data:pick-random-by-gender gender)))
    (if entry
        (with-html-output-to-string (s nil :indent t)
          (:div :class "name-display text-center"
           (:h2 :class "display-3 mb-0" :style "color: #f1faee;" (str (getf entry :arm)))
           (:h4 :class "text-muted mb-3" (str (getf entry :lat)))
           
           (:div :class "mb-3"
            (:span :class "badge bg-primary me-2" (str (getf entry :origin)))
            (:span :class "badge bg-warning text-dark" (str (getf entry :status))))

           (:p :class "text-start border-top border-secondary pt-3 px-2" 
               :style "font-style: italic; color: #ced4da;"
               (str (getf entry :desc)))

           (when (getf entry :diminutives)
             (htm (:div :class "text-start mb-2 px-2"
                    (:small :class "text-uppercase fw-bold" :style "color: #4361ee;" "Diminutives: ")
                    (str (format nil "~{~A~^, ~}" (getf entry :diminutives))))))

           (:div :class "text-start px-2 mt-3"
            (dolist (tag (getf entry :tags))
              (htm (:span :class "badge rounded-pill border border-secondary me-1" 
                          :style "font-size: 0.7rem; color: #8d99ae;"
                          (str tag)))))

           (when (getf entry :famous-people)
             (htm (:div :class "mt-4 p-3 rounded" :style "background: rgba(255,255,255,0.05);"
                    (:h6 :class "text-start text-info" "Notable Figures")
                    (:ul :class "text-start list-unstyled mb-0" :style "font-size: 0.9rem;"
                      (dolist (person (getf entry :famous-people))
                        (htm (:li "• " (str person))))))))))
        "No names found.")))