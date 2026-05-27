; (ql:quickload '(:hunchentoot :cl-who))

(defpackage :lisp-htmx-app
  (:use :cl :hunchentoot :cl-who))

(in-package :lisp-htmx-app)

(defvar *server-instance* nil)
(defun start-app ()
  (armenian-names.persistence:load-history)
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
          margin: 0; padding: 0;
        }
        .app-container {
          display: flex;
          flex-direction: column;
          align-items: center;
          padding: 5vh 20px; /* Space at top and sides */
        }

        .ui-monster-card {
          background: rgba(255, 255, 255, 0.05);
          backdrop-filter: blur(10px);
          border: 1px solid rgba(255, 255, 255, 0.1);
          border-radius: 20px;
          box-shadow: 0 15px 35px rgba(0,0,0,0.5);
          width: 100%;
          max-width: 450px;
          transition: transform 0.3s ease;
        }

        .history-vault {
          width: 100%;
          max-width: 450px;
          margin-top: 25px;
          background: rgba(0,0,0,0.2);
          border-radius: 15px;
          padding: 20px;
          border: 1px solid rgba(255,255,255,0.05);
        }

        #history-list {
          display: flex;
          flex-wrap: wrap;
          gap: 10px;
          justify-content: center;
          padding: 0;
          list-style: none;
        }

        .history-item { 
          animation: slideUp 0.3s ease-out; 
          background: rgba(67, 97, 238, 0.15); 
          border: 1px solid rgba(67, 97, 238, 0.3);
          padding: 6px 12px;
          border-radius: 50px;
          font-size: 0.85rem;
          color: #fff;
        }

        @keyframes slideUp { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: translateY(0); } }
        
        .card-header {
          background: linear-gradient(90deg, #d90429 0%, #ef233c 100%);
          font-weight: bold;
          text-transform: uppercase;
          letter-spacing: 2px;
          padding: 20px;
          border-radius: 20px 20px 0 0;
        }

        .htmx-indicator { display: none; }
        .htmx-request.htmx-indicator, .htmx-request #loading.htmx-indicator { display: block !important; }
        .htmx-request#display { opacity: 0.15; transition: opacity 0.2s ease; }

        .btn-dark { background: #4361ee; border: none; padding: 12px; font-weight: bold; }
        .btn-dark:hover { background: #3f37c9; }
      "))
     (:body
      (:div :class "app-container"
       
       (:div :class "card ui-monster-card"
         (:div :class "card-header text-center" "Հայկական անունների թանգարան")
         (:div :class "card-body p-4"
          (:div :class "text-center mb-4"
           (:p :style "color: #8d99ae;" "Ընտրեք սեռը և ուսումնասիրեք անունների պատմությունը"))
          
          (:div :class "d-flex justify-content-center mb-4"
           (:div :class "btn-group w-100" :role "group"
            (:input :type "radio" :name "gender" :value "male" :id "m" :class "btn-check" :checked t)
            (:label :for "m" :class "btn btn-outline-primary py-2" "Արական")
            (:input :type "radio" :name "gender" :value "female" :id "f" :class "btn-check")
            (:label :for "f" :class "btn btn-outline-danger py-2" "Իգական")))
          
          (:div
           (:button :class "btn btn-dark w-100 mb-2"
                    :hx-post "/generate"
                    :hx-include "[name=gender]" 
                    :hx-target "#display"
                    :hx-indicator "#loading"
                    "Ցույց տալ պատահական անուն"))

          (:div :class "mt-2" :style "position: relative; min-height: 200px;"
                (:div :id "loading" :class "htmx-indicator position-absolute top-50 start-50 translate-middle"
                      :style "z-index: 10;"
                      (:div :class "spinner-border text-primary" :role "status"
                            (:span :class "visually-hidden" "Ներբեռնվում է․․․")))

                (:div :id "display" :class "text-center rounded d-flex flex-column align-items-center justify-content-center"
                      :style "background: rgba(0,0,0,0.2); padding: 20px; min-height: 200px;"
                      (:p :class "text-muted m-0" "Այստեղ ցուցաբերվելու է անունը")))))

       (:div :class "history-vault"
             (:div :class "d-flex justify-content-between align-items-center mb-3 px-1"
                   (:h6 :class "text-info m-0" "ՎԵՐՋԻՆ ԱՆՈՒՆՆԵՐԸ")
                   (:button :hx-post "/clear-history"
                            :hx-target "#history-list"
                            :class "btn btn-sm btn-outline-secondary border-0"
                            :style "font-size: 0.7rem;" "ՋՆՋԵԼ"))

             (:ul :id "history-list"
                  (dolist (name armenian-names.persistence:*name-history*)
                    (htm (:li :class "history-item" (str name)))))))))))

(define-easy-handler (generate :uri "/generate") (gender)
  (setf (content-type*) "text/html")
  (let ((entry (armenian-names.data:pick-random-by-gender gender)))
    (if entry
        (let ((name-arm (getf entry :arm)))
          (armenian-names.persistence:update-history name-arm)
          
          (with-html-output-to-string (s nil :indent t)
            (:div :class "name-display text-center"
             (:h2 :class "display-3 mb-0" :style "color: #f1faee;" (str name-arm))
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
                              (htm (:li "• " (str person)))))))))

           
            (:ul :id "history-list" :hx-swap-oob "innerHTML"
                 (dolist (h armenian-names.persistence:*name-history*)
                   (htm (:li :class "p-2 mb-2 rounded history-item" (str h)))))))
        "Չկա, հի՞նչ անիմ։")))

(define-easy-handler (clear-history :uri "/clear-history") ()
  (setf (content-type*) "text/html")
  (armenian-names.persistence:clear-history)
  "")