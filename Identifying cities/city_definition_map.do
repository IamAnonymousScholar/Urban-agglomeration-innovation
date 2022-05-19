

import delimited D:\Research\WEBS\Geo_data\city_map\All.csv, varnames(1) encoding(UTF-8) clear
forvalues x = 0(1)5   { 
  ren name_`x' name`x'
}

keep fid name0 name1 name2 name3 name4 name5

sort name0 name1 name2 name3 name4 name5
foreach var of varlist name1 name2 name3 name4 name5  {
  egen code_`var' = group(`var')
}

drop if fid==.
save "D:\Research\WEBS\Geo_data\all_map_code.dta", replace



use "D:\Research\WEBS\Geo_data\all_map_code.dta", clear

gen city =""


*Djibouti (DJI): Djibouti City
replace city =name2 if name0 =="Djibouti" & name2=="Djibouti"

*Estonia (EST): Tallinn
replace city =name2 if name0=="Estonia" & name2=="Tallinn"

*Latvia (LVA): Rīga
replace city =name2 if name0=="Latvia" & name2=="Riga"

*Macedonia (MKD): Čair, Aerodrom, Butel, Centar, Gazi Baba, Gjorče Petrov, Karpoš, Kisela Voda, Šuto Orizari, might include rural municipality
replace city = "Skopje" if name0=="Macedonia" & (code_name1 ==2224 | code_name1 ==20  | code_name1 ==319 | code_name1 ==375 | code_name1 ==625 | code_name1 ==639 | code_name1 ==900 | code_name1 ==968 | code_name1 ==2245)

*Slovenia (SVN): Ljubljana
replace city =name2 if name0=="Slovenia" & name2=="Ljubljana"

*Gambia (GMB): Serekunda, part of Kanifing
replace city = name2 if name0=="Gambia" & name2 =="Kanifing"

*Namibia (NAM): Windhoek, in Khomas, rural is excluded
replace city = "Windhoek" if name0=="Namibia" & (name2 =="Windhoek East" | name2 =="Windhoek West")

*Lithuania (LTU): Vilnius (district mulnicipality)
replace city = name2 if name0=="Lithuania" & name2 =="Vilniaus"

*Albania (ALB): Tirana, other admin units within the same district are rural
replace city = "Tirana" if name0=="Albania" & code_name3 ==77507

*Armenia (ARM): Yerevan
replace city = name1 if name0=="Armenia" & name1 =="Erevan"

*Mongolia (MNG): Ulan Bator (Ulaanbaatar)
replace city = name2 if name0=="Mongolia" & name2=="Ulan Bator"

*Bosnia and Herzegovina (BIH): Sarajevo, look at canton/metro because the city itself does not have >300k people
replace city = name2 if name0=="Bosnia and Herzegovina" & name2 =="Sarajevo"

*Uruguay (URY): Montevideo
replace city = name1 if name0=="Uruguay" & name1 =="Montevideo"

*Georgia (GEO): Tbilisi 
replace city = name2 if name0=="Georgia" & name2=="Tbilisi"

*Croatia (HRV): Zagreb
replace city =name2 if name0=="Croatia" & name2=="Zagreb"

*Panama (PAN): Panama City, no clear definition of the city but most of the corregimientos in the district are within the urban centre of the city
replace city = "Panama City" if name0=="Panama" & code_name2==16554

*Mauritania (MRT): Nouakchott, department
replace city = name2 if name0=="Mauritania" & name2 =="Nouakchott"

*Palestine (PSE): Gaza City, goverate     
replace city = name2 if name0=="Palestina" & name2=="Gaza"

*Central African Republic (CAF): Bangui
replace city = name2 if name0=="Central African Republic" & name2=="Bangui"

*Liberia (LBR): Monrovia 
replace city = name3 if name0=="Liberia" & name3=="Monrovia"

*Costa Rica (CRI): San José, Canton
replace city = "San Jose" if name0=="Costa Rica" & code_name2==19266

*Slovakia (SVK): Bratislava
gen subname_svk= substr(name2,1,10)
replace city = "Bratislava" if name0=="Slovakia" & subname_svk =="Bratislava"

*El Salvador (SLV): San Salvador
replace city = name2 if name0=="El Salvador" & name2=="San Salvador"

*Kyrgyzstan (KGZ): Bishkek	
replace city = "Bishkek" if name0=="Kyrgyzstan" & code_name2==2913

*Nicaragua (NIC): Managua
replace city = name2 if name0=="Nicaragua" & name2 =="Managua"

*Lebanon (LBN): Beirut
replace city = name2 if name0=="Lebanon" & name2=="Beirut"

*Serbia (SRB): Belgrade, including rural mulnicipalities
replace city = "Belgrade" if name0=="Serbia" & name1=="Grad Beograd"

*Bulgaria (BGR): Sofia
replace city = "Sofia" if name0=="Bulgaria" & name2 =="Stolichna"

*Paraguay (PRV): Asunción
replace city = "Asuncion" if name0=="Paraguay" & code_name2 ==1439

*Laos (LAO): Vientiane (Capital)
replace city = "Vientiane" if name0=="Laos" & name1=="Vientiane [prefecture]"

*Sierra Leone (SLE): Freetown
replace city = "Freetown" if name0=="Sierra Leone" & name3=="Freetown1"

*Togo (TGO): Lomé
replace city = "Lome" if name0=="Togo" & code_name2 ==7583

*Israel (ISR): Tel Aviv, district
replace city =name1 if name0=="Israel" & name1=="Tel Aviv" 

*Tajikistan (TJK): Dushanbe
replace city = name1 if name0=="Tajikistan" & name1=="Dushanbe"

*Belarus (BLR): Minsk
replace city = name2 if name0=="Belarus" & name2=="Minsk"

*Honduras (HND): Tegucigalpa, in Francisco Morazán, twin cities with another one in the same central district
replace city = "Tegucigalpa" if name0=="Honduras" & name2=="Distrito Central"

*Hungary (HUN): Budapest
replace city = "Budapest" if name0=="Hungary" & name2=="Budapesti"

*Azerbaijan (AZE): Baku
replace city = "Baku" if name0=="Azerbaijan" & code_name2 ==1856

*Jordan (JOR): Amman
replace city = name2 if name0=="Jordan" & name2=="Amman"

*Portugal (PRT): Lisbon
replace city = "Lisbon" if name0=="Portugal" & name2=="Lisboa"

*Sweden (SWE): Stockholm (top population municipalities that do not include islands in metro area)
replace city = name2 if name0=="Sweden" & name2=="Stockholm"
replace city = "Stockholm" if name0=="Sweden" & name1=="Stockholm" & (code_name2 ==9647 | code_name2==20859 | code_name2==21319 | code_name2==23596 | name2=="Solna")


*Czech Republic (CZE): Prague	
replace city = name1 if name0=="Czech Republic" & name1 =="Prague"

*Greece (GRC): Athens, Athens urban including Greater Athens and Piraeus
replace city = name3 if name0=="Greece" & name3=="Athens"
*Greater Athens
replace city = "Athens" if name0=="Greece" & name2=="Attica" & (name3=="Dafni-Ymittos" | name3=="Ilioupoli"	| name3== "Vyronas"	| name3=="Kaisariani" | name3=="Zografou"| name3=="Galatsi"	| name3=="Filadelfeia-Chalkidona" | name3=="Nea Ionia" | name3=="Irakleio" | name3=="Metamorfosi" | name3=="Lykovrysi-Pefki" | name3=="Kifissia" | name3=="Penteli" | name3=="Marousi" | name3=="Vrilissia" | name3=="Agia Paraskevi" | name3=="Papagou-Cholargos" | name3=="Chalandri" | name3=="Filothei-Psychiko" | name3=="Glyfada" | name3=="Elliniko-Argyroupoli" | name3== "Alimos" | name3== "Agios Dimitrios"	| name3== "Nea Smyrni" | name3=="Palaio Faliro" | name3=="Kallithea" | name3=="Moschato-Tavros" | name3=="Egaleo" | name3=="Agia Varvara" | name3=="Chaidari" | name3=="Peristeri" | name3=="Petroupoli" | name3=="Ilion" | name3=="Agioi Anargyroi-Kamatero")
*Piraeus
replace city = "Athens" if name0=="Greece" & name2=="Attica" & (name3=="Keratsini-Drapetsona" | name3=="Korydallos" | name3=="Nikaia-Agios Ioannis Rentis" | name3=="Perama"  | name3=="Piraeus")


*Dominican Republic (DOM): Santo Domingo de Guzmán, in Distrito Nacional
replace city = "Santo Domingo" if name0=="Dominican Republic" & name2 =="Distrito Nacional"

*South Sudan (SSD): Juba, Juba county
replace city = name3 if name0=="South Sudan" & name3=="Juba"

*Bolivia (BOL): Santa Cruz de la Sierra
replace city = name3 if name0=="Bolivia" & name3=="Santa Cruz de La Sierra"

*Burundi (BDI): Bujumbura, excluding water body
gen subname_bdi= substr(name2,1,4)
replace city = "Bujumbura" if name0=="Burundi" & name1=="Bujumbura Mairie" & subname_bdi !="Lake"

*Tunisia (TUN): Tunis
replace city = "Tunis" if name0=="Tunisia" & name1=="Tunis"

*Benin (BEN): Cotonou
replace city = name2 if name0=="Benin" & name2=="Cotonou"

*Rwanda (RWA): Kigali, city is at the province level
replace city = "Kigali" if name0=="Rwanda" & name1 =="Umujyi wa Kigali"

*Guinea (GIN): Conakry, map no spatial information
replace city = name2 if name0=="Guinea" & name2=="Conakry"

*Zimbabwe (ZWE): Harare, metropolitan province
replace city = name2 if name0=="Zimbabwe" & name2=="Harare"

*Chad (TCD): N'Djamena
replace city = "NDjamena" if name3=="Ndjamena"

*Senegal (SEN): Dakar
replace city = name2 if name0=="Senegal" & name2 =="Dakar"

*Cambodia (KHM): Phnom Penh
replace city = name1 if name0=="Cambodia" & name1=="Phnom Penh"

*Guatemala (GTM): Guatemala City
gen subname_gtm= substr(name2,1,4)
replace city = "Guatemala City" if name0=="Guatemala" & subname_gtm =="ZONA"

*Ecuador (ECU): Guayaquil
replace city = name3 if name0=="Ecuador" & name3=="Guayaquil"

*Zambia (ZMB): Lusaka
replace city = name2 if name0=="Zambia" & name2=="Lusaka"

*Kazakhstan (KAZ): Almaty
replace city = "Almaty" if name0=="Kazakhstan" & code_name2==786

*Malawi (MWI): Lilongwe
replace city = name2 if name0=="Malawi" & name2=="Lilongwe City"

*Chile (CHL): Santiago, Santiago province
replace city = name3 if name0=="Chile" & name3=="Santiago"

*Romania (ROU): Bucharest
replace city = "Bucharest" if name0=="Romania" & name2=="Municipiul Bucuresti"

*Mali (MLI): Bamako
replace city = name2 if name0=="Mali" & name2=="Bamako"

*Niger (NER): Niamey, including some hinterland but majority is a city
replace city = name2 if name0=="Niger" & name2=="Niamey"

*Côte d'Ivoire (CIV): 1 Abidjan   region: Lagunes   2 Bouaké	region: Gbêkê
replace city = "Abidjan" if name0=="Côte d'Ivoire" & code_name4==164
replace city = "Bouake" if name0=="Côte d'Ivoire" & name4=="Bouake"

*Cameroon (CMR): 1	Douala	  2	Yaoundé, greater area
replace city = "Yaounde" if name0=="Cameroon" & name2=="Mfoundi"
replace city = "Douala" if name0=="Cameroon" & name2 =="Wouri"

*Madagascar (MDG): 1 Antananarivo in Analamanga, Antananarivo  2. Toamasina in Atsinanana, Toamasina
replace city = name4 if name0=="Madagascar" & name4=="Antananarivo"
replace city = name4 if name0=="Madagascar" & name4=="CU Toamasina"

*Venezuela (VEN): 1	Caracas, Capital District	2	Maracaibo, Zulia
*The city of Caracas occupies the entirety of the Libertador municipality of the Capital District and part of the state of Miranda, specifically the municipalities of Baruta, Chacao, El Hatillo and Sucre	
replace city = "Caracas" if name0=="Venezuela" & (name1=="Distrito Capital" | name2=="Baruta" | name2=="Chacao" | name2=="El Hatillo" | name2=="Sucre")
replace city = name2 if name0=="Venezuela" & name2=="Maracaibo"

*Nepal (NPL): 1	Kathmandu, in Kathmandu, Bagmati	2	Pokhara, in Kaski, Gandaki
replace city = "Kathmandu" if name0=="Nepal" & name4=="KathmanduN.P."
replace city = "Pokhara" if name0=="Nepal" & name4=="PokharaN.P."

*Yemen (YEM): 1 Sanaa  2 Aden
*Crater, the original port city; Ma'alla, the modern port; Tawahi, known as "Steamer Point" in the colonial period; and the resorts of Gold Mohur. Khormaksar, on the isthmus that connects Aden proper with the mainland, includes the city's diplomatic missions, the main offices of Aden University, and Aden International Airport (the former British Royal Air Force station RAF Khormaksar), Yemen's second biggest airport. On the mainland are the sub-centres of Sheikh Othman, a former oasis area; Al-Mansura, a town planned by the British; and Madinat ash-Sha'b (formerly Madinat al-Itihad)
replace city = "Sanaa" if name0=="Yemen" & code_name1==77
replace city = "Aden" if name0=="Yemen" & code_name1==2211 & (code_name2==486 | code_name2==506 | code_name2==1387 | code_name2==1535 | code_name2==5248 | code_name2==10618) 

*Mozambique (MOZ): 1	Matola	2	Maputo (including Matola). Alternative: Beira and/or Nampula 
replace city = "Maputo" if name0=="Mozambique" & name1=="Maputo City"
replace city = "Nampula" if code_name3==18368 | name3=="Anchilo" | name3== "Mutivaze" | name3== "Namaita" | name3== "Rapale"

*Ghana (GHA): 1. Accra		2. Kumasi
*Both are defined as metropolitan areas, but looks like cities
replace city = name2 if name0=="Ghana" & name2=="Accra"
replace city = name2 if name0=="Ghana" & name2=="Kumasi"

*Malaysia (MYS): 1	Kuala Lumpur	2	Seberang Perai and George Town: both in the Pinang province. Alternative: Kota Bharu
replace city = name2 if name0=="Malaysia" & name2 =="Kuala Lumpur"
replace city = "Seberang Perai" if name0=="Malaysia" & name1=="Pulau Pinang"

*Peru (PER): 1  Lima	2  Arequipa 
replace city = name2 if name0=="Peru" & name2=="Lima"
replace city = "Arequipa" if name0=="Peru" & name2 =="Arequipa" & (code_name3==1832 | code_name3== 3249 | code_name3== 16565 | code_name3== 16889 | code_name3== 31181 | code_name3== 31906 | code_name3== 45982 | code_name3== 48328 | code_name3== 58817 | code_name3== 66191 | code_name3== 66284 | code_name3== 71603 | code_name3== 76977 | code_name3== 84281)

*Uzbekistan (UZB): 1	Tashkent	2	Samarqand. Alternative: Namangan
replace city = "Tashkent" if name0=="Uzbekistan" & name2=="Tashkent City"
replace city = name2 if name0=="Uzbekistan" & name2=="Samarqand"


*Morocco (MAR): 1 Casablanca	in Casablanca-Settat	 2 Fez (or Fes) in Fès-Meknès. 
*Note: metro Rabat is also large but Rabat itself is small. Assume Rabat metro is Rabat, Sale and Temara according to wikipedia: https://simple.wikipedia.org/wiki/Rabat 
replace city = name2 if name0=="Morocco" & name2=="Casablanca"
replace city = "Fez" if name0=="Morocco" & code_name2 == 7091


*Poland (POL): 1 Warsaw	2 Kraków
replace city = "Warsaw" if name0=="Poland" & name3=="Warszawa"
replace city = "Krakov" if name0=="Poland" & code_name3==37350

*Afghanistan (AFG): 1 Kabul	2 Kandahar  
replace city = "Kabul" if name0=="Afghanistan" & name2=="Kabul City"
replace city = "Kandahar" if name0=="Afghanistan" & name2=="Kandahar City"

*Iraq (IRQ): 1 Baghdad	2 Basra. Alternative: Mosul
replace city = name1 if name0=="Iraq" & name1=="Baghdad"
replace city = name2 if name0=="Iraq" & name2=="Basrah"


*Sudan (SDN): 1 Khartoum	2 Omdurman
replace city = name2 if name0=="Sudan" & name2=="Khartoum"
replace city = name2 if name0=="Sudan" & name2=="Omdurman"

*Uganda (UGA): 1	Kampala	  2	Kira Town 
*Kira Town is a bedroom community for Kampala. An alternative: Nansana is supposed to be at the municipality level, but not in the map (only level 4). Should not be included.
replace city = name2 if name0=="Uganda" & name2=="Kampala"
replace city = name3 if name0=="Uganda" & name3=="Kira"

*Ukraine (UKR): 1 Kyiv	2 Kharkiv
replace city = "Kyiv" if name0=="Ukraine" & name1=="Kiev City"
replace city = "Kharkiv" if name0=="Ukraine" & code_name2 ==10507

*Argentina (ARG): 1 Buenos Aires	2 Cordoba
replace city ="Buenos Aires" if name0=="Argentina" & code_name1 ==432
replace city ="Buenos Aires" if name0=="Argentina" & name1=="Buenos Aires" & (code_name2==1565 | code_name2==7371 | code_name2== 12003 | code_name2==19250 | code_name2== 23011 | code_name2==24075)
replace city ="Cordoba" if name0=="Argentina" & code_name1==469 & name2=="Capital"



*Colombia (COL): 1	Bogotá,	 Capital District, 2	Medellín,	Antioquia	3	Santiago de Cali,  Valle del Cauca  
replace city = "Bogota" if name0=="Colombia" & code_name2==19698
replace city = "Medellin" if name0=="Colombia" & code_name2==13710
replace city = "Santiago de Cali" if name0=="Colombia" &  code_name2==19723

*Kenya (KEN): 1.	Nairobi 2.	Mombasa    3.	Kisumu. Alternative for 3: Nakuru
*Using county for Nairobi, Mombasa and Nakuru. Kisumu: try to be precise
replace city = name1 if name0=="Kenya" & name1=="Nairobi"
replace city = name1 if name0=="Kenya" & name1=="Mombasa"
gen subname_ken= substr(name2,1,6)
replace city = "Kisumu" if name0=="Kenya" & name1=="Kisumu" & subname_ken=="Kisumu" 


*Myanmar (MMR): 1 Yangon	 2 Mandalay	 3 Nay pyi daw
replace city ="Yangon" if name0=="Myanmar" & name1=="Yangon" & (name3=="Yangon (Rangoon)" | name3=="Syriam" | name3=="Insein")
replace city = name2 if name0=="Myanmar" & name2=="Mandalay"
replace city = "Nay  pyi daw" if name0=="Myanmar" & name1=="Naypyitaw"
 
*Tanzania (TZA): 1. Dar es Salaam   2. Mwanza	  3. Arusha
replace city = name1 if name0=="Tanzania" & name1=="Dar es Salaam"
replace city = "Mwanza" if name0=="Tanzania" & (name2=="Ilemela" | name2=="Nyamagana")
replace city = "Arusha" if name0=="Tanzania" & name2=="Arusha Urban"

*Italy (ITA): 1 Rome	in Lazio  2 Milan  in  Lombardy   3  Naples  in Campania
*Rome and Milan are okay. For Naples, using the province-level metropolitan city. But for Naples, exclude isolated islands
replace city = "Rome" if name0=="Italy" & name3=="Roma"
replace city = "Milan" if name0=="Italy" & name3=="Milano"
replace city = "Naples" if name0=="Italy" & name2=="Napoli"
replace city ="" if name0=="Italy" & name2=="Napoli" & (name3=="Procida" | name3=="Anacapri" | name3=="Capri" | name3=="Forio" | name3=="Lacco Ameno" | name3=="Casamicciola Terme" | name3=="Serrara Fontana" | name3=="Barano d' Ischia"  | name3=="Ischia")


*Thailand (THA): Bangkok, Bangkok
*Alternatively, including surrounding provinces into a Bangkok metropolitan region
replace city = "Bangkok" if name0=="Thailand" & name1=="Bangkok Metropolis"

*Turkey (TUR): 1 Istanbul	  2 Ankara      3 İzmir	
*Ankara: Altındağ, Çankaya, Etimesgut, Gölbaşı, Keçiören, Mamak, Pursaklar, Sincan, Yenimahalle
replace city = name1 if name0=="Turkey" & name1=="Istanbul"
replace city = "Ankara" if name0=="Turkey" & name1=="Ankara" & (code_name2==838 | code_name2== 6751  | code_name2== 8035  | code_name2== 10441  | code_name2== 13146  | code_name2== 20598  | code_name2== 24958  | code_name2== 25714)
replace city = "Izmir" if name0=="Turkey" & (code_name2==1981 | code_name2== 3185  | code_name2==3424  | code_name2==7276  | code_name2==8074  | code_name2==10210  | code_name2==11023  | code_name2==25750) 

*Democratic Republic of the Congo (COD): 1 Kinshasa	2 Lubumbashi	3 Mbuji-Mayi (Bakwanga)
replace city = name2 if name0=="Democratic Republic of the Congo" & name2=="Kinshasa"
replace city = name2 if name0=="Democratic Republic of the Congo" & name2=="Lubumbashi"
replace city = name2 if name0=="Democratic Republic of the Congo" & name2=="Mbuji-Mayi"

*Vietnam (VNM): 1 Ho Chi Min City   2 Hanoi	   3 Da Nang
*Alternatively, Haiphong
replace city = "Ho Chi Minh City" if name0=="Vietnam" & code_name1==764 & (code_name2 !=3753 & code_name2 !=5446 & code_name2 != 8653 & code_name2 !=15250) 
replace city = "Hanoi" if name0=="Vietnam" & code_name1==756 &(code_name2==1676 | code_name2==3799 | code_name2==5434  | code_name2==25880  | code_name2==8114  | code_name2==8636  | code_name2==8463  | code_name2==8464  | code_name2==12449  | code_name2==14913  | code_name2==23366  | code_name2==22469  | code_name2==21565)
replace city = "Da Nang" if name0=="Vietnam" & code_name1==2230 & code_name2 !=8651

*Egypt (EGY): 1 Cairo	Cairo	2 Alexandria	Alexandria	3 Giza	Giza	4 Shubra El Kheima	Qalyubia 5 Port Said	Port Said. Alternative: Suez as the fifth city and drop Shubra El Kheima	
*Because it is completely urbanized, the Cairo governorate is considered a city proper, and functions as a municipality. Along with Cairo, Port Said and Suez, Alexandria is one of four governorates in the country that are also municipalities. Pick up the urban places in those governorates.
replace city = "Cairo" if name0=="Egypt" & code_name1==55
replace city = "Alexandria" if name0=="Egypt" & code_name1==45
replace city = "Giza" if name0=="Egypt" & code_name1==49 & (code_name2==159 | code_name2==539  | code_name2==550  | code_name2==552  | code_name2==576  | code_name2==619  | code_name2==3551  | code_name2==8917  | code_name2==20259  | code_name2==20689  | code_name2==20690)
replace city = "Shubra El Kheima" if name0=="Egypt" & code_name1==56 & (code_name2== 20371 | code_name2==20372)
replace city = "Port Said" if name0=="Egypt" & code_name1== 310


*Philippines (PHL): 1 Quezon City	 2 Manila	 3 Davao City	4 Caloocan	5 Cebu City
*Note: 1 2 and 4 are in metro Manila
replace city = "Manila" if name0=="Philippines" & name1=="Metropolitan Manila"
replace city = name2 if name0=="Philippines" & name2=="Davao City"
replace city = name2 if name0=="Philippines" & name2=="Cebu City"


*Ethiopia (ETH): Addis Ababa
*The city is surrounded by the Special Zone of Oromia	
replace city = "Addis Ababa" if name0=="Ethiopia" & name1=="Addis Abeba"

*Mexico (MEX): 1 Mexico City, Mexico City    2 Tijuana, Baja California  3 Ecatepec, State of Mexico	4 León, Guanajuato  5 Puebla, Puebla. Some sources replace Tijuana and Leon with Ciudad Juarez and Guadalajara
replace city = "Mexico City" if name0=="Mexico" & name1=="Distrito Federal"
replace city = name2 if name0=="Mexico" & name2=="Tijuana"
replace city = "Ecatepec" if name0=="Mexico" & code_name2==6365
replace city = "Leon" if name0=="Mexico" & code_name2==12221
replace city = name2 if name0=="Mexico" & name2=="Puebla"


*Russia (RUS): 1 Moscow  2 Saint Petersburg   3 Novosibirsk, Novosibirsk Oblast, Siberia 4 Yekaterinburg, Sverdlovsk Oblast, Ural 5 Kazan, Republic of Tatarstan, Volga. Some sources replace Kazan with Nizhniy Novgorod
*Moscow: enlarged in 2012, https://en.wikipedia.org/wiki/Administrative_divisions_of_Moscow
replace city = "Moscow" if name0=="Russia" & name1=="Moscow City"
replace city = "Moscow" if name0=="Russia" & name1=="Moskva" & (code_name2==12163 | code_name2==14997 | code_name2==17349 | code_name2==20244 |name2=="Troitsk/Moskva")
replace city = "Moscow" if name0=="Russia" & name1=="Moskva" & (name2=="Mytishchinskiy rayon" | name2=="Balashikhinskiy rayon")
replace city = name1 if name0=="Russia" & name1=="City of St. Petersburg"
replace city = "Novosibirsk" if name0=="Russia" & name2=="Novosibirskiy rayon"
replace city = "Yekaterinburg" if name0=="Russia" & name2=="Ekaterinburg gorsovet"
replace city = "Kazan" if name0=="Russia" & (name2=="Laishevskiy rayon" | name2=="Vysokogorskiy rayon" | name2=="Verkhneuslonskiy rayon")



*Bangladesh (BGD): 1.  Dhaka Dhaka, Dhaka Division  2.  Chittagong Chittagong, Chittagong Division  3.  Khulna  Khulna, Khulna Division 4.  Rajshahi   Rajshahi, Rajshahi Division 5.  Gazipur. Some sources replace Gazipur with Comilla
*Dhaka district consist with Dhaka city, Keraniganj , Nababganj, Dohar, Savar and Dhamrai upazila. 
*https://www.citypopulation.de/en/bangladesh/chittagong/
*https://www.citypopulation.de/en/bangladesh/khulna/
replace city = "Dhaka" if name0=="Bangladesh" & name2=="Dhaka" & code_name3 != 21363 & code_name3 !=34521 & code_name3 !=69314 & name3 !="Nawabganj" & name3 !="Dohar"
replace city = "Chittagong" if name0=="Bangladesh" & name2=="Chittagong" & (code_name3==4804 | code_name3==8250  | code_name3==17171  | code_name3==17791  | code_name3==22403  | code_name3==27771  | code_name3==35179  | code_name3==37174  | code_name3==57014  | code_name3==57789  | code_name3==58701) 
replace city = "Khulna" if name0=="Bangladesh" & name2=="Khulna" & (code_name3==34690 | code_name3==34742  | code_name3==35178  | code_name3==71819 | name3=="Daulatpur")
replace city = "Rajshahi" if name0=="Bangladesh" & name2=="Rajshahi" & (code_name3==9907 | code_name3==64018 | code_name3==70164 | name3=="Matihar")
replace city = "Gazipur" if name0=="Bangladesh" & name2=="Gazipur" & code_name3==25632


*Nigeria (NGA): 1 Lagos,	 Lagos   2 Kano,	Kano   3 Ibadan,	Oyo  4 Kaduna, Kaduna   5 Port Harcourt, Rivers	 6 Benin City, Edo
*Lagos = Metro Lagos = 16 out of 20 LGA in Lagos State, https://en.wikipedia.org/wiki/Lagos
*Kano metro: https://en.wikipedia.org/wiki/Kano_State#Local_Government_Areas
*Ibadan metro: https://en.wikipedia.org/wiki/Ibadan#Administration, keep Ido, others are more like villages: https://en.wikipedia.org/wiki/Ido,_Nigeria
*The urban area (Port Harcourt metropolis), on the other hand, is made up of the local government area itself and parts of Obio-Akpor and Eleme accordingly.
*Benin metropolis: https://www.researchgate.net/figure/Map-of-Benin-city-showing-local-government-areas-and-borehole-water-sampling-locations_fig1_336257473. Too many rural areas in the three LGAs that are not selected in the do-file
replace city = "Lagos" if name0=="Nigeria" & name1=="Lagos" & (code_name2!=1741 & code_name2!=6636 & code_name2!= 8840 & name2!="Ibeju/Lekki")
replace city = "Kano" if name0=="Nigeria" & name1=="Kano" & (code_name2==6800 | code_name2==7994 | code_name2== 11465 | code_name2== 15024 | code_name2== 22010 | code_name2== 23549  | name2=="Dala" | name2=="Kano")
replace city = "Ibadan" if name0=="Nigeria" & name1=="Oyo" & (code_name2==8709 | code_name2==8710 | code_name2==8711 | code_name2==8712 | code_name2==8713 | code_name2==8756)
replace city = "Kaduna" if name0=="Nigeria" & (name2=="Kaduna North" | name2=="Kaduna South")
replace city = "Port Harcourt" if name0=="Nigeria" & name1=="Rivers" & (name2=="Port Harcourt" | code_name2==15791 | name2=="Eleme")
replace city = "Benin City" if name0=="Nigeria" & name1=="Edo" & (name2=="Oredo Edo" | name2=="Egor")


*Pakistan (PAK): 1 Karachi  2 Lahore	3 Faisalabad  4 Islamabad-Rawalpindi 5 Gujranwala  6 Peshawar. Some sources replace the last two with Multan and Hyderabad
replace city = "Karachi" if name0=="Pakistan" & name2=="Karachi" & name3 !="Malir"
replace city = "Lahore" if name0=="Pakistan" & name2=="Lahore" & name3=="Lahore"
replace city = "Faisalabad" if name0=="Pakistan" & name2 =="Faisalabad" & name3=="Faisalabad"
replace city = "Islamabad-Rawalpindi" if name0=="Pakistan" & (name3=="Islamabad" | name3=="Rawalpindi")
replace city = "Gujranwala" if name0=="Pakistan" & (name3=="Gujranwala 1" | name3=="Gujranwala 2")
replace city = "Peshawar" if name0=="Pakistan" & name3=="Peshawar"





*Indonesia (IDN): 1 Jakarta 2 Surabaya East Java  3 Bekasi West Java 4 Bandung West Java	5 Medan North Sumatra  6 Tangerang . Alternative: 6 Palembang 
*Jakarta: do not include thousands island: too much water body around
replace city = "Jakarta" if name0=="Indonesia" & name1=="Jakarta Raya" & name2 !="Kepulauan Seribu"
replace city = "Surabaya" if name0=="Indonesia" & name1=="Jawa Timur" & name2 =="Surabaya"
replace city = "Bekasi" if name0=="Indonesia" & name1=="Jawa Barat" & name2== "Kota Bekasi"
replace city = "Bandung" if name0=="Indonesia" & name1=="Jawa Barat" & name2== "Kota Bandung"
replace city = "Medan" if name0=="Indonesia" & name1=="Sumatera Utara" & name2=="Kota Medan"
replace city = "Tangerang" if name0=="Indonesia" & name1=="Banten" & name2=="Kota Tangerang"


*India (IND): 1 Mumbai  Maharashtra 2 Delhi	 Delhi 3 Bangalore Karnataka 4 Hyderabad Telangana 5 Ahmedabad Gujarat 6 Chennai Tamil Nadu 
*7 Kolkata West Bengal   8 Surat	Gujarat 9 Pune	Maharashtra 10 Jaipur Rajasthan 11 Lucknow Uttar Pradesh 12 Kanpur Uttar Pradesh
*Greater Mumbai
*Pune: https://en.wikipedia.org/wiki/Pune_district#/media/File:Tehsils_in_Pune_district.png
replace city = "Mumbai" if name0=="India" & name1=="Maharashtra" & (name2 =="Mumbai City" | name2== "Mumbai Suburban")
replace city = "Mumbai" if name0=="India" & name1=="Maharashtra" & name2=="Thane" & name3=="Thane"
replace city = "Delhi" if name0=="India" & name1=="NCT of Delhi"
replace city = "Delhi" if name0=="India" & name1=="Haryana" & name2=="Faridabad" & name3=="Faridabad"
replace city = "Delhi" if name0=="India" & name1=="Haryana" & name2=="Gurgaon" & name3=="Gurgaon"
replace city = "Delhi" if name0=="India" & name1=="Uttar Pradesh" & name2=="Gautam Buddha Nagar" & name3=="Dadri"
replace city = "Delhi" if name0=="India" & name1=="Uttar Pradesh" & name2=="Ghaziabad" & name3=="Ghaziabad"
replace city = "Bangalore" if name0=="India" & name1=="Karnataka" & name2=="Bangalore"
replace city = "Hyderabad" if name0=="India" & name1 =="Telangana" & name2=="Hyderabad"
replace city = "Hyderabad" if name0=="India" & name1 =="Telangana" & name2=="Ranga Reddy" & name3=="n.a. ( 1728)"
replace city = "Ahmadabad" if name0=="India" & name1 =="Gujarat" & name3=="Ahmadabad"
replace city = "Chennai" if name0=="India" & name1=="Tamil Nadu" & name2=="Chennai"
replace city = "Chennai" if name0=="India" & name1=="Tamil Nadu" & name2=="Thiruvallur" & name3=="Saidapet"
replace city = "Kolkata" if name0=="India" & name1=="West Bengal" & name2=="Kolkata"
replace city = "Surat" if name0=="India" & name1=="Gujarat" & name2=="Surat" & name3=="Chorasi"
replace city = "Pune" if name0=="India" & name1=="Maharashtra" & name2=="Pune" & name3=="n.a. ( 1612)"
replace city = "Jaipur" if name0=="India" & name1=="Rajasthan" & name2=="Jaipur" & (name3=="Jaipur" | name3=="Sanganer" | name3=="Amer")
replace city = "Lucknow" if name0=="India" & name1=="Uttar Pradesh" & name3== "Lucknow"
replace city = "Kanpur" if name0=="India" & name1=="Uttar Pradesh" & name2== "Kanpur Nagar" & name3== "Kanpur"


*China (CHN):1 Shanghai 2 Beijing  3 Chongqing 4 Tianjin 5 Guangzhou 6 Shenzhen 7 Chengdu 8 Nanjing 9 Wuhan 10 Xi'an 11 Hangzhou 12 Dongguan. Alternative: add Shenyang 
*Exclude rural or tourist counties
*Exclude the following for robustness check

*Beijing: Huairou, Mentougou
*Shanghai: none
*Chongqing: city centre, Jiangbei, in principle Ba as well but it is too big (Banan is the right one to include)
*Tianjin: (Baodi)
*Guangzhou: Conghua
*Shenzhen: none
*Chengdu: Qionglai
*Nanjing: (Luhe), Gaochun (far away)
*Wuhan: (Huangpi), (Xinzhou)
*Xi'an: none
*Hangzhou: Jiande (far away), Lin'an (tourist)
*Dongguan: none
*Shenyang: Xinmin


replace city = "Beijing" if name0=="China" & name2=="Beijing" & (name3!="Miyun" & name3 !="Yanqing" & name3 !="Huairou" & name3 !="Mentougou")
replace city = "Shanghai" if name0=="China" & name2=="Shanghai" & (name3 !="Chongming" & name3 !="Shengsi")
replace city = "Chongqing" if name0=="China" & name2=="Chongqing" & (name3=="Chongqing" | name3=="Jiangbei")
replace city = "Tianjin" if name0=="China" & name2=="Tianjin" & (name3 !="Ji" & name3 !="Ninghe" & name3 !="Jinghai")
replace city = "Guangzhou" if name0=="China" & name2=="Guangzhou" & name3 !="Conghua"
replace city = "Shenzhen" if name0=="China" & name2=="Shenzhen"
replace city = "Chengdu" if name0=="China" & name2=="Chengdu" & (name3!="Chongqing" & name3 !="Dayi" & name3 !="Jintang" & name3 !="Peng" & name3 !="Pujiang" & name3 !="Xinjin" & name3 !="Qionglai")
replace city = "Nanjing" if name0=="China" & name2=="Nanjing" & (name3 !="Lishui" & name3 !="Gaochun")
replace city = "Wuhan" if name0=="China" & name2=="Wuhan"
replace city = "Xi'an" if name0=="China" & name2=="Xi'an" & (name3=="Chang'an" | name3=="Lintong" | name3=="Xincheng")
replace city = "Hangzhou" if name0=="China" & name2=="Hangzhou" & (name3!="Chun'an" & name3 !="Tonglu" & name3 !="Jiande" & name3 !="Lin'an")
replace city = "Dongguan" if name0=="China" & name2=="Dongguan"



*Note: do not duplicate cities, otherwise there are no multiple polygons within a city
keep fid name0 city city_id 
gen all_city = city
save "D:\Research\WEBS\Geo_data\all_city_define.dta", replace

keep fid all_city city_id
export delimited using "D:\Research\WEBS\Geo_data\nightlight_working_data\all_city_define.csv", replace


