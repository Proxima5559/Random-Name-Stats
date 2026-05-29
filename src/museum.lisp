(in-package :cl-user)

(defpackage :armenian-names.museum
  (:use :cl :hunchentoot :cl-who :armenian-names.data)
  (:export :museum-page :museum-filter))

(in-package :armenian-names.museum)

(defun render-names-list (names &key (next-offset 9) era status gender)
  (with-html-output-to-string (s nil :indent t)
    (if (null names)
        nil 
        (let ((total-items (length names)))
          (loop for entry in names
                for idx from 1
                do (let ((is-last (= idx total-items)))
                     (htm 
                      (:div :class "col"
                            :hx-get (when is-last 
                                      (format nil "/museum/filter?offset=~A&era=~A&status=~A&gender=~A" 
                                              next-offset (or era "all") (or status "all") (or gender "all")))
                            :hx-trigger (when is-last "revealed")
                            :hx-target (when is-last "this")
                            :hx-swap (when is-last "afterend")
                            :hx-indicator (when is-last "#museum-spinner")
                       (:div :class "card name-card p-4 h-100 d-flex flex-column"
                        (:div :class "d-flex justify-content-between align-items-start mb-2"
                         (:div
                          (:h3 :style "color: #f1faee; margin-bottom: 2px;" (str (getf entry :arm)))
                          (:h6 :class "text-muted mb-0" (str (getf entry :lat))))
                         (:span :class "badge bg-dark border border-info text-info badge-era text-uppercase" 
                                (str (getf entry :era))))
                        
                        (:div :class "mb-3"
                         (:span :class "badge bg-primary me-1" (str (getf entry :status)))
                         (:span :class "badge border border-secondary" (str (getf entry :origin))))
                        
                        (:p :style "font-size: 0.9rem; color: #ced4da;" (str (getf entry :desc)))
                        
                        (when (getf entry :diminutives)
                          (htm (:div :class "text-start mb-2 px-2"
                                     (:small :class "text-uppercase fw-bold" :style "color: #4361ee;" "Diminutives: ")
                                     (:small :style "color: #e0e1dd;" (str (format nil "~{~A~^, ~}" (getf entry :diminutives)))))))
                        
                        (:div :class "text-start px-2 mt-2 mb-3"
                         (dolist (tag (getf entry :tags))
                           (htm (:span :class "badge rounded-pill border border-secondary me-1" 
                                       :style "font-size: 0.7rem; color: #8d99ae;"
                                       (str tag)))))
                        
                        (when (getf entry :famous-people)
                          (htm (:div :class "mt-auto p-3 rounded" :style "background: rgba(255,255,255,0.05);"
                                     (:h6 :class "text-start text-info" "Notable Figures")
                                     (:ul :class "text-start list-unstyled mb-0" :style "font-size: 0.9rem;"
                                       (dolist (person (getf entry :famous-people))
                                         (htm (:li "• " (str person)))))))))))))))))

(define-easy-handler (museum-page :uri "/museum") ()
  (setf (content-type*) "text/html")
  (with-html-output-to-string (s nil :prologue t :indent t)
    (:html :lang "hy"
     (:head
      (:meta :charset "utf-8")
      (:meta :viewport "width=device-width, initial-scale=1")
      (:title "Անունների Թանգարան — Museum")
      (:link :rel "stylesheet" :href "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css")
      (:script :src "https://unpkg.com/htmx.org@1.9.10")
      (:style "
        body { background: #1b263b; color: #e0e1dd; font-family: 'Segoe UI', Tahoma, sans-serif; }
        .name-card { 
            background: rgba(255, 255, 255, 0.03); 
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 12px;
            transition: transform 0.2s, border-color 0.2s;
        }
        .name-card:hover { transform: translateY(-4px); border-color: #4361ee; }
        .filter-section { background: rgba(0, 0, 0, 0.15); padding: 24px; border-radius: 12px; border: 1px solid rgba(255,255,255,0.05); }
        .badge-era { font-size: 0.65rem; letter-spacing: 0.5px; }
        .form-select, .form-select:focus { background-color: #0d1b2a; color: #e0e1dd; border-color: rgba(255,255,255,0.2); }
        .htmx-indicator { display: none; }
        .htmx-request.htmx-indicator { display: flex; justify-content: center; }
      "))
     (:body :class "container py-5"
      (:div :class "d-flex justify-content-between align-items-center mb-5"
       (:div
        (:h1 :class "fw-bold mb-1" "Անունների Թանգարան")
        (:p :class "text-muted mb-0" "Explore the complete collection of Armenian names"))
       (:a :href "/" :class "btn btn-outline-light px-4" "← Գլխավոր էջ"))

      (:div :class "filter-section mb-5"
       (:form :hx-get "/museum/filter" 
              :hx-target "#names-grid" 
              :hx-trigger "change" 
              :class "row g-3"
        (:div :class "col-md-4"
         (:label :class "form-label small text-uppercase text-muted" "Ժամանակաշրջան (Era)")
         (:select :name "era" :class "form-select"
          (:option :value "all" "Բոլոր ժամանակաշրջանները")
          (:option :value "ancient" "Հին (Ancient)")
          (:option :value "medieval" "Միջնադարյան (Medieval)")
          (:option :value "modern" "Ժամանակակից (Modern)")))
        
        (:div :class "col-md-4"
         (:label :class "form-label small text-uppercase text-muted" "Կարգավիճակ (Status)")
         (:select :name "status" :class "form-select"
          (:option :value "all" "Բոլորը")
          (:option :value "Պատմական" "Պատմական")
          (:option :value "Դասական" "Դասական")
          (:option :value "Ավանդական" "Ավանդական")
          (:option :value "Ժամանակակից" "Ժամանակակից")))

        (:div :class "col-md-4"
         (:label :class "form-label small text-uppercase text-muted" "Սեռ (Gender)")
         (:select :name "gender" :class "form-select"
          (:option :value "all" "Բոլորը")
          (:option :value "male" "Արական (Male)")
          (:option :value "female" "Իգական (Female)")))))

      (:div :id "names-grid" :class "row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4"
       (str (render-names-list (armenian-names.data:filter-names :offset 0 :limit 9) 
                               :next-offset 9)))
       
       (:div :id "museum-spinner" :class "htmx-indicator my-5 w-100"
            (:div :class "spinner-border text-info" :role "status"
                  (:span :class "visually-hidden" "Բեռնվում է...")))
             ))))

(define-easy-handler (museum-filter :uri "/museum/filter") (era status gender offset)
  (setf (content-type*) "text/html")
  (let* ((current-offset (if offset (parse-integer offset :junk-allowed t) 0))
         (next-offset (+ current-offset 9))
         (names (armenian-names.data:filter-names 
                 :era era :status status :gender gender 
                 :offset current-offset :limit 9)))
    (render-names-list names 
                       :next-offset next-offset 
                       :era era 
                       :status status 
                       :gender gender)))