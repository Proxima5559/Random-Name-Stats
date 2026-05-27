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
                     :desc "Հունական անուն, որը նշանակում է «մարդկանց պաշտպան»։")
                (:id 9
                    :gender "female"
                    :arm "Ազատուհի"
                    :lat "Azatuhi"
                    :origin "Հայկական"
                    :status "Ավանդական"
                    :era "medieval/modern"
                    :diminutives ("Ազատ" "Ազո")
                    :famous-people nil
                    :related-names ("Ազատ")
                    :tags ("ազատություն" "անկախություն")
                    :desc "Ազատ անվան իգական տարբերակը, նշանակում է «ազատ կին»։")
                (:id 10
                    :gender "female"
                    :arm "Աիդա"
                    :lat "Aida"
                    :origin "Արաբական/Իտալական"
                    :status "Ժամանակակից"
                    :era "modern"
                    :diminutives ("Աիդկա" "Իդա")
                    :famous-people ("Աիդա Պապիկյան" "Աիդա Սարգսյան")
                    :related-names ("Իդա")
                    :tags ("օպերա" "արքայադուստր")
                    :desc "Հանրաճանաչ է դարձել Վերդիի համանուն օպերայից հետո։ Նշանակում է «հյուր» կամ «վերադարձող»։")
                (:id 11
                    :gender "female"
                    :arm "Ալեքսանդրա"
                    :lat "Alexandra"
                    :origin "Հունական"
                    :status "Միջազգային"
                    :era "ancient"
                    :diminutives ("Ալյա" "Սաշա" "Սանդրա")
                    :famous-people ("Ալեքսանդրա Գրիգորյան")
                    :related-names ("Ալեքսանդր" "Ալեքս")
                    :tags ("պաշտպան" "թագավորական")
                    :desc "Ալեքսանդր անվան իգական ձևը, որը նշանակում է «մարդկանց պաշտպան»։")
                (:id 12
                    :gender "female"
                    :arm "Ալինա"
                    :lat "Alina"
                    :origin "Գերմանական/Սլավոնական"
                    :status "Ժամանակակից"
                    :era "modern"
                    :diminutives ("Ալյա" "Ալինկա")
                    :famous-people ("Ալինա Օրլովա" "Ալինա Մարտիրոսյան-Արայան" "Ալինա Փաշ")
                    :related-names ("Ադելինա" "Ալիսա")
                    :tags ("ազնվական" "լուսավոր")
                    :desc "Ծագում է գերմանական «ազնվական» կամ սլավոնական «գեղեցիկ/լուսավոր» բառերից։")
                (:id 13
                    :gender "female"
                    :arm "Ալվարդ"
                    :lat "Alvard"
                    :origin "Հայկական"
                    :status "Ավանդական"
                    :era "medieval"
                    :diminutives ("Ալո" "Վարդ")
                    :famous-people ("Ալվարդ Պետրոսյան")
                    :related-names ("Վարդուհի" "Ալվինա")
                    :tags ("ծաղիկ" "կարմիր" "գեղեցկություն")
                    :desc "Կազմված է «ալ» (վառ կարմիր) և «վարդ» բառերից՝ նշանակելով «կարմիր վարդ»։")

                (:id 14
                    :gender "female"
                    :arm "Աղավնի"
                    :lat "Aghavni"
                    :origin "Հայկական"
                    :status "Ավանդական"
                    :era "ancient/medieval"
                    :diminutives ("Աղուն" "Աղավնիկ")
                    :famous-people ("Աղավնի Մեսրոպյան")
                    :related-names ("Աստղիկ")
                    :tags ("թռչուն" "խաղաղություն" "մաքրություն")
                    :desc "Հայկական անուն, որը բառացի նշանակում է «աղավնի թռչուն»՝ խորհրդանշելով խաղաղություն և մաքրություն։")))

(defun pick-random-by-gender (gender)
  (let ((filtered (remove-if-not (lambda (x) (string= (getf x :gender) gender)) *names*)))
    (if filtered
        (nth (random (length filtered)) filtered)
        nil)))