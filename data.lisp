(defpackage :armenian-names.data
  (:use :cl)
  (:export :*names* :pick-random-by-gender)) 

(in-package :armenian-names.data)

(defparameter *names*
  '((:id 1 
     :gender "male" 
     :arm "Արման" 
     :lat "Arman" 
     :origin "Պարսկական"
     :status "լայնատարած" 
     :era "modern"
     :diminutives ("Արմանչիկ" "Արմ")
     :famous-people ("Արման Մանուկյան" "Արման Նշանյան")
     :related-names ("Արմեն" "Արամ")
     :tags ("հայտնի" "ավանդական")
     :desc "Առաջացել է պարսկերենից, որը նշանակում է «ցանկություն» կամ «նպատակ»։")
    (:id 2 
     :gender "female" 
     :arm "Անահիտ" 
     :lat "Anahit" 
     :origin "Հայկական / Իրանական"
     :status "կլասիկ" 
     :era "ancient"
     :diminutives ("Անո" "Անահիտկա")
     :famous-people ("Անահիտ Ցիցիկյան" "Անահիտ Սահինյան")
     :related-names ("Աննա" "Անի")
     :tags ("աստվածուհի" "դասական")
     :desc "Իմաստության, արգասաբերության և ջրի հին հայկական աստվածուհին։")
    (:id 3 
     :gender "male" 
     :arm "Վահագն" 
     :lat "Vahagn" 
     :origin "Հայկական"
     :status "Պատմական" 
     :era "ancient"
     :diminutives ("Վահ" "Վահագ")
     :famous-people ("Վահագն Դավթյան" "Վահագն Խաչատուրյան")
     :related-names ("Վահան" "Վահե")
     :tags ("պատերազմ" "ուժ" "առասպելաբանական")
     :desc "Կրակի և պատերազմի հին հայկական աստվածը, վիշապաքաղ։")))

(defun pick-random-by-gender (gender)
  (let ((filtered (remove-if-not (lambda (x) (string= (getf x :gender) gender)) *names*)))
    (if filtered
        (nth (random (length filtered)) filtered)
        nil)))