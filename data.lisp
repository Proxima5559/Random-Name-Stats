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
                     :desc "Կրակի և պատերազմի հին հայկական աստվածը, վիշապաքաղ։")
                (:id 4
                     :gender "male"
                     :arm "Աբգար"
                     :lat "Abgar"
                     :origin "Հայկական/Ասորական"
                     :status "Պատմական"
                     :era "ancient"
                     :diminutives nil
                     :famous-people ("Աբգար Իսահակյան" "Աբգար Դպիր")
                     :related-names ("Ավագ")
                     :tags ("թագավորական" "քրիստոնեություն" "ավանդական")
                     :desc "Աբգար Ե-ն եղել է հայոց թագավոր, ով ըստ ավանդույթի առաջինն է ընդունել քրիստոնեությունը:")
                (:id 5
                     :gender "male"
                     :arm "Աբրահամ"
                     :lat "Abraham"
                     :origin "Եբրայական"
                     :status "Դասական"
                     :era "ancient"
                     :diminutives ("Աբո" "Աբրահ")
                     :famous-people ("Աբրահամ Ալիխանով" "Աբրահամ Լինքոլն")
                     :related-names ("Աբրամ")
                     :tags ("աստվածաշնչյան")
                     :desc "Եբրայական անուն, որը նշանակում է «բազմության հայր»։")
                (:id 6
                     :gender "male"
                     :arm "Ազատ"
                     :lat "Azat"
                     :origin "Հայկական/Պարսկական"
                     :status "Ժամանակակից"
                     :era "medieval/modern"
                     :diminutives nil
                     :famous-people ("Ազատ Շերենց" "Ազատ Վշտունի")
                     :related-names ("Ազատուհի")
                     :tags ("ազատություն" "անկախություն")
                     :desc "Նշանակում է «ազատ», «անկախ»։ Հայերի մեջ տարածված անուն է։")
                (:id 7
                     :gender "male"
                     :arm "Ալբերտ"
                     :lat "Albert"
                     :origin "Գերմանական"
                     :status "Ժամանակակից"
                     :era "modern"
                     :diminutives ("Բերտ" "Ալբ")
                     :famous-people ("Ալբերտ Այնշտայն" "Ալբերտ Ազարյան")
                     :related-names ("Ադալբերտ")
                     :tags ("ազնվական" "փայլուն")
                     :desc "Գերմանական ծագմամբ անուն, որը նշանակում է «ազնվափայլ»։")
                (:id 8
                     :gender "male"
                     :arm "Ալեքսանդր"
                     :lat "Aleksandr"
                     :origin "Հունական"
                     :status "Պատմական"
                     :era "ancient"
                     :diminutives ("Ալիկ" "Սաշ")
                     :famous-people ("Ալեքսանդր Մակեդոնացի" "Ալեքսանդր Թամանյան" "Ալեքսանդր Սպենդիարյան")
                     :related-names ("Ալեքսան" "Ալեքս")
                     :tags ("պաշտպան" "զորավար" "ճարտարապետ")
                     :desc "Հունական անուն, որը նշանակում է «մարդկանց պաշտպան»։")))

(defun pick-random-by-gender (gender)
  (let ((filtered (remove-if-not (lambda (x) (string= (getf x :gender) gender)) *names*)))
    (if filtered
        (nth (random (length filtered)) filtered)
        nil)))