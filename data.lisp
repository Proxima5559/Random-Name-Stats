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
                     :desc "Հայկական անուն, որը բառացի նշանակում է «աղավնի թռչուն»՝ խորհրդանշելով խաղաղություն և մաքրություն։")
                (:id 15
                     :gender "male"
                     :arm "Անաստաս"
                     :lat "Anastas"
                     :origin "Հունական"
                     :status "Պատմական"
                     :era "ancient/modern"
                     :diminutives nil
                     :famous-people ("Անաստաս Միկոյան" "Անաստաս Ա կաթողիկոս")
                     :related-names ("Անաստասիա")
                     :tags ("հարություն" "վերածնունդ")
                     :desc "Հունական ծագմամբ անուն, որը նշանակում է «հարություն առած» կամ «վերածնված»։")
                (:id 16
                     :gender "male"
                     :arm "Անդրանիկ"
                     :lat "Andranik"
                     :origin "Հայկական"
                     :status "Ավանդական"
                     :era "medieval/modern"
                     :diminutives ("Անդո" "Անդուշ")
                     :famous-people ("Զորավար Անդրանիկ (Օզանյան)" "Անդրանիկ Մարգարյան")
                     :related-names ("Անդրե")
                     :tags ("առաջնեկ" "զորավար" "ազգային")
                     :desc "Հայկական անուն, որը բառացի նշանակում է «ընտանիքի անդրանիկ/ավագ զավակ»։")
                (:id 17
                     :gender "male"
                     :arm "Անուշավան"
                     :lat "Anushavan"
                     :origin "Հայկական"
                     :status "Պատմական"
                     :era "ancient"
                     :diminutives ("Անուշ" "Անո")
                     :famous-people ("Անուշավան Սոսանվեր" "Անուշավան Դանիելյան")
                     :related-names ("Անուշ")
                     :tags ("առասպելաբանական" "անմահ" "սոսյաց անտառ")
                     :desc "Հին հայկական անուն։ Ըստ Մովսես Խորենացու՝ Հայկ նահապետի տոհմից Արա Գեղեցիկի թոռն է, ում կոչում էին «Սոսանվեր»։ Նշանակում է «անմահ հոգի»։")
                (:id 18
                     :gender "male"
                     :arm "Ապետ"
                     :lat "Apet"
                     :origin "Հայկական"
                     :status "Հազվադեպ"
                     :era "medieval"
                     :diminutives ("Ապո")
                     :famous-people nil
                     :related-names ("Ապետնակ")
                     :tags ("իշխանական" "պատվավոր")
                     :desc "Հին հայկական անուն, որը ծագում է «ապետ» (իշխան, պետ, ազնվական) տիտղոսից։")
                (:id 19
                     :gender "male"
                     :arm "Արամ"
                     :lat "Aram"
                     :origin "Հայկական"
                     :status "Դասական"
                     :era "ancient"
                     :diminutives ("Արամիկ" "Արո")
                     :famous-people ("Արամ Խաչատրյան" "Արամ Մանուկյան" "Արամ Աշխարհակալ")
                     :related-names ("Արամազդ" "Արամե")
                     :tags ("նահապետ" "արքայական" "վեհություն")
                     :desc "Հայկական առասպելաբանության և պատմության մեջ հանրահայտ անուն։ Արամ նահապետի անվան հետ է կապվում Հայաստանի «Արմենիա» անվանումը։")
                (:id 20
                     :gender "male"
                     :arm "Արամայիս"
                     :lat "Aramayis"
                     :origin "Հայկական"
                     :status "Պատմական"
                     :era "ancient"
                     :diminutives ("Մայիս" "Արամ")
                     :famous-people ("Արամայիս Սահակյան" "Արամայիս Երզնկյան")
                     :related-names ("Արամ" "Արմենակ")
                     :tags ("նահապետ" "հիմնադիր" "Արմավիր")
                     :desc "Հին հայկական անուն։ Ըստ Խորենացու՝ Հայկ նահապետի թոռն է (Արամանյակի որդին), ով կառուցել է Արմավիր քաղաքը և անվանել իր անունով։")

                (:id 21
                     :gender "male"
                     :arm "Արարատ"
                     :lat "Ararat"
                     :origin "Հայկական"
                     :status "Դասական"
                     :era "ancient/modern"
                     :diminutives ("Արատ" "Արո")
                     :famous-people ("Արարատ Միրզոյան" "Արարատ Ղարիբյան")
                     :related-names ("Ուրարտու")
                     :tags ("սրբազան լեռ" "խորհրդանիշ" "հայրենիք")
                     :desc "Ծագում է աստվածաշնչյան և պատմական Արարատ լեռան անունից, որը հայ ժողովրդի գլխավոր խորհրդանիշն է։")

                (:id 22
                     :gender "male"
                     :arm "Արեգ"
                     :lat "Areg"
                     :origin "Հայկական"
                     :status "Ժամանակակից"
                     :era "ancient/modern"
                     :diminutives ("Արեգիկ")
                     :famous-people ("Արեգ Նազարյան" "Արեգ Գալստյան")
                     :related-names ("Արև" "Արեգնազ")
                     :tags ("արև" "լույս" "աստվածություն")
                     :desc "Հին հայկական դիցաբանության մեջ արևի, կրակի ու լույսի աստվածն է կամ հենց Արեգակը։ Հանդիսանում է նաև հին հայկական տոմարի ամսվա 1-ին օրվա անունը։")

                (:id 23
                     :gender "male"
                     :arm "Արեն"
                     :lat "Aren"
                     :origin "Հայկական"
                     :status "Ժամանակակից"
                     :era "modern"
                     :diminutives ("Արենիկ")
                     :famous-people ("Արեն Մկրտչյան")
                     :related-names ("Արենի")
                     :tags ("սուրբ" "հնագույն" "բնություն")
                     :desc "Ժամանակակից հանրահայտ անուն, որը հաճախ կապվում է հնագույն բնակավայր և գինեգործական կենտրոն հանդիսացող «Արենի» տարածքի հետ։")

                (:id 24
                     :gender "male"
                     :arm "Արկադի"
                     :lat "Arkadi"
                     :origin "Հունական"
                     :status "Ժամանակակից"
                     :era "ancient/modern"
                     :diminutives ("Արկադ" "Ադո")
                     :famous-people ("Արկադի Տեր-Թադևոսյան (Կոմանդոս)" "Արկադի Ղուկասյան")
                     :related-names ("Արկադիա")
                     :tags ("երջանիկ" "զորավար" "խաղաղ կյանք")
                     :desc "Հունական ծագմամբ անուն (Արկադիոս), որը թարգմանաբար նշանակում է «Արկադիայի բնակիչ» (Հունաստանի պատմական շրջան, որը խորհրդանշում է երջանիկ ու հովվերգական կյանք)։")
                (:id 25
                     :gender "male"
                     :arm "Արնո"
                     :lat "Arno"
                     :origin "Գերմանական/Հայկական"
                     :status "Ժամանակակից"
                     :era "modern"
                     :diminutives ("Առնո")
                     :famous-people ("Առնո Բաբաջանյան")
                     :related-names ("Առնոլդ")
                     :tags ("երաժշտություն" "արծիվ")
                     :desc "Թեև ունի գերմանական արմատներ (նշանակում է «արծիվ»), հայերի մեջ այն սերտորեն կապված է կոմպոզիտոր Առնո Բաբաջանյանի անվան հետ։")

                (:id 26
                     :gender "male"
                     :arm "Արսեն"
                     :lat "Arsen"
                     :origin "Հունական"
                     :status "Դասական"
                     :era "ancient/modern"
                     :diminutives ("Արսենիկ" "Արս")
                     :famous-people ("Արսեն Ջուլֆալակյան" "Արսեն Պետրոսյան")
                     :related-names ("Արսենիոս")
                     :tags ("տղամարդկային" "ամուր")
                     :desc "Հունական ծագմամբ անուն, որը նշանակում է «տղամարդկային», «ամուր» կամ «առնական»։")

                (:id 27
                     :gender "male"
                     :arm "Արշակ"
                     :lat "Arshak"
                     :origin "Պարսկական/Հայկական"
                     :status "Պատմական"
                     :era "ancient"
                     :diminutives ("Արշակիկ" "Արշո")
                     :famous-people ("Արշակ Բ թագավոր" "Արշակ Չոպանյան")
                     :related-names ("Արշավիր" "Արշակունի")
                     :tags ("արջ" "արքայական" "Արշակունյաց հարստություն")
                     :desc "Նշանակում է «արջուկ»։ Հայոց պատմության մեջ հայտնի է որպես Արշակունյաց հարստության հիմնադիրների և արքաների անուն։")

                (:id 28
                     :gender "male"
                     :arm "Արտակ"
                     :lat "Artak"
                     :origin "Հայկական"
                     :status "Դասական"
                     :era "ancient/modern"
                     :diminutives ("Արտակիկ" "Արտ")
                     :famous-people ("Արտակ Դավթյան" "Արտակ Ալեքսանյան")
                     :related-names ("Արտաշես")
                     :tags ("արագ" "ճարպիկ" "թեթև")
                     :desc "Հին հայկական անուն, որը նշանակում է «արագաշարժ» կամ «ճարպիկ»։")

                (:id 29
                     :gender "male"
                     :arm "Արտավազդ"
                     :lat "Artavazd"
                     :origin "Հայկական"
                     :status "Պատմական"
                     :era "ancient"
                     :diminutives ("Արտո" "Վազդ")
                     :famous-people ("Արտավազդ Բ թագավոր" "Արտավազդ Փելեշյան")
                     :related-names ("Արտակ")
                     :tags ("արդարություն" "հարատև" "արքայական")
                     :desc "Նշանակում է «հարատև արդարություն»։ Հայտնի է որպես հայոց աստվածների ու թագավորների (հատկապես ողբերգակ Արտավազդ Բ-ի) անուն։")
                (:id 30
                     :gender "male"
                     :arm "Արտաշես"
                     :lat "Artashes"
                     :origin "Հայկական"
                     :status "Պատմական"
                     :era "ancient"
                     :diminutives ("Արտաշ" "Արտո")
                     :famous-people ("Արտաշես Ա թագավոր" "Արտաշես Թումանյան")
                     :related-names ("Արտավազդ" "Արտակ")
                     :tags ("հիմնադիր" "աշխարհակալ" "Արտաշիսյան հարստություն")
                     :desc "Նշանակում է «լույսի կամ արդարության տիրակալ»։ Հայոց մեծագույն թագավորներից մեկի՝ Արտաշես Ա Բարեպաշտի անունն է, ով հիմնադրեց Արտաշատ մայրաքաղաքը։")

                (:id 31
                     :gender "male"
                     :arm "Արթուր"
                     :lat "Arthur"
                     :origin "Կելտական"
                     :status "Միջազգային"
                     :era "ancient/modern"
                     :diminutives ("Արթուրիկ" "Արթ")
                     :famous-people ("Արթուր Աբրահամ" "Արթուր Մեսչյան" "Արթուր Ալեքսանյան")
                     :related-names ("Արտուր")
                     :tags ("արջ" "արքա" "ուժեղ")
                     :desc "Կելտական ծագմամբ անուն, որը նշանակում է «արջ-տղամարդ» կամ «արծվի քար»։ Չափազանց տարածված և սիրված անուն է հայերի մեջ։")

                (:id 32
                     :gender "male"
                     :arm "Ասատուր"
                     :lat "Asatur"
                     :origin "Հայկական"
                     :status "Ավանդական"
                     :era "medieval"
                     :diminutives ("Ասո")
                     :famous-people ("Ասատուր Մնացականյան")
                     :related-names ("Աստվածատուր")
                     :tags ("աստվածատուր" "նվեր")
                     :desc "«Աստվածատուր» հին հայկական անվան կրճատ, ժողովրդական տարբերակն է, որը բառացի նշանակում է «Աստծո տված նվեր»։")

                (:id 33
                     :gender "male"
                     :arm "Աշոտ"
                     :lat "Ashot"
                     :origin "Հայկական"
                     :status "Պատմական"
                     :era "medieval"
                     :diminutives ("Աշոտիկ" "Աշո")
                     :famous-people ("Աշոտ Ա Երկաթ" "Աշոտ Ողորմած" "Աշոտ Բագրատունի")
                     :related-names ("Աշոտիկ")
                     :tags ("արքայական" "Բագրատունյաց հարստություն" "ամուր")
                     :desc "Հին հայկական անուն, որը նշանակում է «աշխարհի տիրակալ» կամ «կրակ»։ Բագրատունյաց հարստության բազմաթիվ հայտնի արքաների անունն է։")

                (:id 34
                     :gender "male"
                     :arm "Ավետիք"
                     :lat "Avetik"
                     :origin "Հայկական"
                     :status "Դասական"
                     :era "medieval/modern"
                     :diminutives ("Ավետ" "Ավո")
                     :famous-people ("Ավետիք Իսահակյան" "Ավետիք Չալաբյան")
                     :related-names ("Ավետիս")
                     :tags ("բարի լուր" "ավետիս")
                     :desc "Ծագում է հայերեն «ավետիս» բառից, որը նշանակում է «բարի լուր», «ուրախալի լուր»։")
                (:id 35
                     :gender "female"
                     :arm "Ամալյա"
                     :lat "Amalya"
                     :origin "Գերմանական"
                     :status "Ժամանակակից"
                     :era "modern"
                     :diminutives ("Ամալ" "Ամկա")
                     :famous-people ("Ամալյա Հովհաննիսյան")
                     :related-names ("Ամալիա")
                     :tags ("աշխատասեր" "պաշտպան")
                     :desc "Գերմանական ծագմամբ անուն (Amalia), որը թարգմանաբար նշանակում է «աշխատասեր» կամ «արդյունավետ»։")

                (:id 36
                     :gender "female"
                     :arm "Անահիտ"
                     :lat "Anahit"
                     :origin "Հայկական"
                     :status "Դասական"
                     :era "ancient"
                     :diminutives ("Անահիտկա" "Անո")
                     :famous-people ("Անահիտ Տարոնեցի" "Անահիտ Սահինյան")
                     :related-names ("Անի")
                     :tags ("դիցաբանական" "մայրություն" "պտղաբերություն")
                     :desc "Հին հայկական դիցաբանության մեջ պտղաբերության, արգասավորության ու մայրության գլխավոր աստվածուհին (Անահիտ մայր)։")

                (:id 37
                     :gender "female"
                     :arm "Անաստասիա"
                     :lat "Anastasia"
                     :origin "Հունական"
                     :status "Միջազգային"
                     :era "ancient/modern"
                     :diminutives ("Նաստյա" "Ասյա" "Տասյա")
                     :famous-people ("Անաստասիա Գրիգորյան")
                     :related-names ("Անաստաս")
                     :tags ("հարություն" "վերածնունդ")
                     :desc "Անաստաս անվան իգական տարբերակը, որը հունարենից թարգմանաբար նշանակում է «հարություն առած» կամ «հարուցյալ»։")

                (:id 38
                     :gender "female"
                     :arm "Անի"
                     :lat "Ani"
                     :origin "Հայկական"
                     :status "Դասական"
                     :era "medieval/modern"
                     :diminutives ("Անիկ" "Անուշ")
                     :famous-people ("Անի Լուպե" "Անի Քրիստի")
                     :related-names ("Անահիտ")
                     :tags ("մայրաքաղաք" "պատմական" "1001 եկեղեցիներ")
                     :desc "Ծագում է Բագրատունյաց հռչակավոր մայրաքաղաք Անիի անունից։ Չափազանց սիրված և տարածված անուն է հայերի մեջ։")

                (:id 39
                     :gender "female"
                     :arm "Աննա"
                     :lat "Anna"
                     :origin "Եբրայական"
                     :status "Միջազգային"
                     :era "ancient"
                     :diminutives ("Անուշ" "Աննկա" "Անյա")
                     :famous-people ("Աննա Ավստրիացի" "Աննա Մայիլյան" "Աննա Հակոբյան")
                     :related-names ("Անահիտ")
                     :tags ("շնորհ" "ողորմություն" "աստվածաշնչյան")
                     :desc "Եբրայական անուն (Hannah), որը նշանակում է «շնորհալի», «բարեհաճ» կամ «աստծո ողորմություն»։")

                (:id 40
                     :gender "female"
                     :arm "Անուշ"
                     :lat "Anush"
                     :origin "Հայկական"
                     :status "Դասական"
                     :era "ancient/modern"
                     :diminutives ("Անուշիկ" "Անո")
                     :famous-people ("Անուշ Ասլիբեկյան" "Անուշ դուստր (Հայկազն)")
                     :related-names ("Անուշավան")
                     :tags ("քաղցր" "գրականություն" "Թումանյան")
                     :desc "Բառացի նշանակում է «քաղցրահամ», «անուշահոտ» կամ «հաճելի»։ Հայտնի է նաև Հովհաննես Թումանյանի համանուն պոեմից։")

                (:id 41
                     :gender "female"
                     :arm "Աշխեն"
                     :lat "Ashkhen"
                     :origin "Իրանական/Հայկական"
                     :status "Պատմական"
                     :era "ancient"
                     :diminutives ("Աշխո")
                     :famous-people ("Աշխեն թագուհի")
                     :related-names ("Աշխենիկ")
                     :tags ("թագուհի" "քրիստոնեություն" "սուրբ")
                     :desc "Նշանակում է «մուգ երկնագույն» կամ «կապուտաչյա»։ Տրդատ Գ Մեծ թագավորի կինն է՝ Աշխեն թագուհին, ով աջակցել է քրիստոնեության ընդունմանը։")))

(defun pick-random-by-gender (gender)
  (let ((filtered (remove-if-not (lambda (x) (string= (getf x :gender) gender)) *names*)))
    (if filtered
        (nth (random (length filtered)) filtered)
        nil)))

(defun filter-names (&key era status gender (offset 0) (limit 9)) 
  (let ((filtered (remove-if-not
                   (lambda (name)
                     (let ((n-era (getf name :era))
                           (n-status (getf name :status))
                           (n-gender (getf name :gender)))
                       (and (or (not era) (string-equal era "all") 
                                (search (string-downcase era) (string-downcase (or n-era ""))))
                            (or (not status) (string-equal status "all") 
                                (string-equal n-status status))
                            (or (not gender) (string-equal gender "all") 
                                (string-equal n-gender gender)))))
                   *names*)))
    (let* ((start (or offset 0))
           (end (min (length filtered) (+ start (or limit 9)))))
      (if (>= start (length filtered))
          nil
          (subseq filtered start end)))))
(export 'filter-names)