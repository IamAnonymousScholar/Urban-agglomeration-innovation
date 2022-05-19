
*Number of cities in each country that are included in our sample
use "D:\Research\WEBS\Geo_data\firm_city.dta", clear

gen num_city_include=.

replace num_city_include =1 if name0 =="Djibouti"
replace num_city_include =1 if name0 =="Estonia"
replace num_city_include =1 if name0 =="Latvia"
replace num_city_include =1 if name0 =="Macedonia"
replace num_city_include =1 if name0 =="Slovenia"
replace num_city_include =1 if name0 =="Gambia"
replace num_city_include =1 if name0 =="Namibia"
replace num_city_include =1 if name0 =="Lithuania"
replace num_city_include =1 if name0 =="Albania"
replace num_city_include =1 if name0 =="Armenia"
replace num_city_include =1 if name0=="Mongolia"
replace num_city_include =1 if name0=="Bosnia and Herzegovina"
replace num_city_include =1 if name0=="Uruguay" 
replace num_city_include =1 if name0=="Georgia"
replace num_city_include =1 if name0=="Croatia" 
replace num_city_include =1 if name0=="Panama" 
replace num_city_include =1 if name0=="Mauritania" 
replace num_city_include =1 if name0=="Palestina" 
replace num_city_include =1 if name0=="Central African Republic" 
replace num_city_include =1 if name0=="Liberia"
replace num_city_include =1 if name0=="Costa Rica" 
replace num_city_include =1 if name0=="Slovakia" 
replace num_city_include =1 if name0=="El Salvador" 
replace num_city_include =1 if name0=="Kyrgyzstan" 
replace num_city_include =1 if name0=="Nicaragua" 
replace num_city_include =1 if name0=="Lebanon" 
replace num_city_include =1 if name0=="Serbia" 
replace num_city_include =1 if name0=="Bulgaria" 
replace num_city_include =1 if name0=="Paraguay"
replace num_city_include =1 if name0=="Laos" 
replace num_city_include =1 if name0=="Sierra Leone" 
replace num_city_include =1 if name0=="Togo" 
replace num_city_include =1 if name0=="Israel" 
replace num_city_include =1 if name0=="Tajikistan"
replace num_city_include =1 if name0=="Belarus" 
replace num_city_include =1 if name0=="Honduras"
replace num_city_include =1 if name0=="Hungary" 
replace num_city_include =1 if name0=="Azerbaijan"
replace num_city_include =1 if name0=="Jordan"
replace num_city_include =1 if name0=="Portugal"
replace num_city_include =1 if name0=="Sweden"
replace num_city_include =1 if name0=="Czech Republic"
replace num_city_include =1 if name0=="Greece" 
replace num_city_include =1 if name0=="Dominican Republic" 
replace num_city_include =1 if name0=="South Sudan"
replace num_city_include =1 if name0=="Bolivia"
replace num_city_include =1 if name0=="Burundi"
replace num_city_include =1 if name0=="Tunisia" 
replace num_city_include =1 if name0=="Benin"
replace num_city_include =1 if name0=="Rwanda"
replace num_city_include =1 if name0=="Guinea"
replace num_city_include =1 if name0=="Zimbabwe" 
replace num_city_include =1 if name0=="Chad"
replace num_city_include =1 if name0=="Senegal"
replace num_city_include =1 if name0=="Cambodia"
replace num_city_include =1 if name0=="Guatemala" 
replace num_city_include =1 if name0=="Ecuador" 
replace num_city_include =1 if name0=="Zambia"
replace num_city_include =1 if name0=="Kazakhstan" 
replace num_city_include =1 if name0=="Malawi" 
replace num_city_include =1 if name0=="Chile" 
replace num_city_include =1 if name0=="Romania" 
replace num_city_include =1 if name0=="Mali" 

replace num_city_include =2 if name0=="Niger"
replace num_city_include =2 if name0=="Côte d'Ivoire" 
replace num_city_include =2 if name0=="Cameroon"
replace num_city_include =2 if name0=="Madagascar" 
replace num_city_include =2 if name0=="Venezuela" 
replace num_city_include =2 if name0=="Nepal" 
replace num_city_include =2 if name0=="Yemen" 
replace num_city_include =2 if name0=="Mozambique" 
replace num_city_include =2 if name0=="Ghana" 
replace num_city_include =2 if name0=="Malaysia" 
replace num_city_include =2 if name0=="Peru" 
replace num_city_include =2 if name0=="Uzbekistan" 
replace num_city_include =2 if name0=="Morocco"
replace num_city_include =2 if name0=="Poland"
replace num_city_include =2 if name0=="Afghanistan" 
replace num_city_include =2 if name0=="Iraq" 
replace num_city_include =2 if name0=="Sudan" 
replace num_city_include =2 if name0=="Uganda" 
replace num_city_include =2 if name0=="Ukraine"
replace num_city_include =2 if name0=="Argentina" 

replace num_city_include =3 if name0=="Colombia" 
replace num_city_include =3 if name0=="Kenya" 
replace num_city_include =3 if name0=="Myanmar"
replace num_city_include =3 if name0=="Tanzania" 
replace num_city_include =3 if name0=="Italy"
replace num_city_include =3 if name0=="Thailand"
replace num_city_include =3 if name0=="Turkey" 
replace num_city_include =3 if name0=="Democratic Republic of the Congo"
replace num_city_include =3 if name0=="Vietnam" 

replace num_city_include =5 if name0=="Egypt"
replace num_city_include =5 if name0=="Philippines" 
replace num_city_include =5 if name0=="Ethiopia"
replace num_city_include =5 if name0=="Mexico"
replace num_city_include =5 if name0=="Russia" 
replace num_city_include =5 if name0=="Bangladesh" 

replace num_city_include =6 if name0=="Nigeria" 
replace num_city_include =6 if name0=="Pakistan" 
replace num_city_include =6 if name0=="Indonesia"

replace num_city_include =12 if name0=="India" 
replace num_city_include =12 if name0=="China"

replace num_city_include =. if all_city ==""

keep idstd num_city_include
save "D:\Research\WEBS\Geo_data\country_city_number.dta", replace



*Generate data for plotting maps
use "D:\Research\WEBS\Geo_data\city_category\WBdata\data_eviews - simp.dta", clear
gen countryname = country_name

replace countryname = "Centralafricanrepublic" if country_name=="Central African Republic"
replace countryname = "Congo, Dem. Rep." if country_name=="Democratic Republic of the Congo"
replace countryname = "Costarica" if country_name=="Costa Rica"
replace countryname = "DominicanRepublic" if country_name=="Dominican Republic"
replace countryname = "ElSalvador" if country_name=="El Salvador"
replace countryname = "Kyrgyz Republic" if country_name=="Kyrgyzstan"
replace countryname = "LaoPDR" if country_name=="Laos"
replace countryname = "North Macedonia" if country_name=="Macedonia"
replace countryname = "SierraLeone" if country_name=="Sierra Leone"
replace countryname = "Slovak Republic" if country_name=="Slovakia"
replace countryname = "Southsudan" if country_name=="South Sudan"
replace countryname = "West Bank And Gaza" if country_name=="Palestina"

drop country_name
save "D:\Research\WEBS\graphs\population.dta", replace


use "D:\Research\WEBS\matched_WBES_regression.dta", clear

*drop cities with few firms*
*<20 firms
replace city ="Shenzhen" if city=="" & a3ax=="Shenzhen City"
drop if city=="Sofia" & year==2019
drop if city=="Bekasi" 
drop if city=="Seberang Perai" 
drop if city=="Ecatepec" 
drop if city=="Benin City" 
drop if city=="Kazan" & year==2019
drop if city=="CU Toamasina"
drop if city=="Tianjin" 
drop if city=="Basrah" 
drop if city=="Fez" & year==2013
drop if city=="Krakov" & year==2013
drop if city=="Samarqand" & year==2013
drop if city=="Rajshahi"

replace conflict=0 if city=="Shenzhen"
replace nl_mean=54.664608 if city=="Shenzhen"
keep if city!="" & conflict==0 & gdppercapitaconstant2010us<=30000 & gdppercapitaconstant2010us!=.

drop if all_city =="Vientiane" & countryname=="Thailand"
drop if nl_mean==.
bysort city: egen mis_innov = total(innovation), missing
drop if mis_innov==.


merge m:1 countryname using "D:\Research\WEBS\graphs\population.dta"

keep if _merge ==3
drop _merge

merge 1:1 idstd using "D:\Research\WEBS\Geo_data\country_city_number.dta"

keep if _merge ==3
drop _merge

merge m:1 city using "D:\Research\WEBS\city population data"
keep if _merge==3
drop _merge
ren pop city_pop

save "D:\Research\WEBS\graphs\regression_sample_graph.dta", replace


*Figure 1 Panel a: a map of countries with selection categories: 1-12, with country population
use "D:\Research\WEBS\graphs\regression_sample_graph.dta", clear

keep if city!=""
drop if city =="Vientiane" & countryname =="Thailand"

duplicates drop countryname, force
keep countryname num_city_include total_pop
save "D:\Research\WEBS\graphs\gis_country_map.dta", replace


import delimited D:\Research\WEBS\wb_countries_admin0_10m\country_name.csv, varnames(1) clear

gen countryname = wb_name

replace countryname = "Centralafricanrepublic" if wb_name=="Central African Republic"
replace countryname = "Costarica" if wb_name=="Costa Rica"
replace countryname = "Côte d'Ivoire" if wb_name=="CÃ´te d'Ivoire"
replace countryname = "Congo, Dem. Rep." if wb_name=="Congo, Democratic Republic of"
replace countryname = "DominicanRepublic" if wb_name=="Dominican Republic"
replace countryname = "Egypt" if wb_name=="Egypt, Arab Republic of"
replace countryname = "ElSalvador" if wb_name=="El Salvador"   
replace countryname = "Gambia" if wb_name=="Gambia, The"
replace countryname = "LaoPDR" if wb_name=="Lao People's Democratic Republic"
replace countryname = "Russia" if wb_name=="Russian Federation"
replace countryname = "SierraLeone" if wb_name=="Sierra Leone"
replace countryname = "Southsudan" if wb_name=="South Sudan"
replace countryname = "Venezuela" if wb_name=="Venezuela, Republica Bolivariana de"
replace countryname = "West Bank And Gaza" if wb_name=="West Bank and Gaza"
replace countryname = "Yemen" if wb_name=="Yemen, Republic of"
replace countryname = "China" if wb_name=="Hong Kong (SAR, China)"
replace countryname = "China" if wb_name=="Macau (SAR, China)"

merge m:1 countryname using "D:\Research\WEBS\graphs\gis_country_map.dta"
keep if _merge ==3
drop _merge

export delimited using "D:\Research\WEBS\graphs\WBES_country_map.csv", replace

*Note: creat two maps and load them together, one with total population and one with number of cities
*China has three obseravtions (mainland, HK, Macau): to be consistent with our data, we need to delete HK and Macau in the total population map




*Figure 1 panel b: country GDP and city innovation*
*Using dissolve tool in ArcGIS to combine city polygons into a single polygon for a city

*city innovation index and nightlight data
use "D:\Research\WEBS\graphs\regression_sample_graph.dta", clear

keep if city!=""
drop if city =="Vientiane" & countryname =="Thailand"

*Innovation
bysort city: egen nl_average = mean(nl_mean)
bysort countryname city: egen innov_index = mean(innovation)
duplicates drop countryname city, force


keep countryname city innov_index nl_average

save "D:\Research\WEBS\graphs\gis_city_innov.dta", replace



import delimited D:\Research\WEBS\wb_countries_admin0_10m\country_name.csv, varnames(1) clear

gen countryname = wb_name

replace countryname = "Centralafricanrepublic" if wb_name=="Central African Republic"
replace countryname = "Costarica" if wb_name=="Costa Rica"
replace countryname = "Côte d'Ivoire" if wb_name=="CÃ´te d'Ivoire"
replace countryname = "Congo, Dem. Rep." if wb_name=="Congo, Democratic Republic of"
replace countryname = "DominicanRepublic" if wb_name=="Dominican Republic"
replace countryname = "Egypt" if wb_name=="Egypt, Arab Republic of"
replace countryname = "ElSalvador" if wb_name=="El Salvador"   
replace countryname = "Gambia" if wb_name=="Gambia, The"
replace countryname = "LaoPDR" if wb_name=="Lao People's Democratic Republic"
replace countryname = "Russia" if wb_name=="Russian Federation"
replace countryname = "SierraLeone" if wb_name=="Sierra Leone"
replace countryname = "Southsudan" if wb_name=="South Sudan"
replace countryname = "Venezuela" if wb_name=="Venezuela, Republica Bolivariana de"
replace countryname = "West Bank And Gaza" if wb_name=="West Bank and Gaza"
replace countryname = "Yemen" if wb_name=="Yemen, Republic of"
drop if wb_name=="Hong Kong (SAR, China)"
drop if wb_name=="Macau (SAR, China)"

merge 1:m countryname using "D:\Research\WEBS\graphs\gis_city_innov.dta"
keep if _merge ==3
drop _merge
export delimited using "D:\Research\WEBS\graphs\WBES_city_innov_map.csv", replace


*Note: when joining to the map, using the city names not fid


*Country GDP
use "D:\Research\WEBS\graphs\regression_sample_graph.dta", clear

keep if city!=""
drop if city =="Vientiane" & countryname =="Thailand"

*No data in 2020
drop if year ==2020

duplicates drop countryname, force
ren gdppercapitaconstant2010us gdp

keep countryname gdp

save "D:\Research\WEBS\graphs\gis_country_gdp.dta", replace


import delimited D:\Research\WEBS\wb_countries_admin0_10m\country_name.csv, varnames(1) clear

gen countryname = wb_name

replace countryname = "Centralafricanrepublic" if wb_name=="Central African Republic"
replace countryname = "Costarica" if wb_name=="Costa Rica"
replace countryname = "Côte d'Ivoire" if wb_name=="CÃ´te d'Ivoire"
replace countryname = "Congo, Dem. Rep." if wb_name=="Congo, Democratic Republic of"
replace countryname = "DominicanRepublic" if wb_name=="Dominican Republic"
replace countryname = "Egypt" if wb_name=="Egypt, Arab Republic of"
replace countryname = "ElSalvador" if wb_name=="El Salvador"   
replace countryname = "Gambia" if wb_name=="Gambia, The"
replace countryname = "LaoPDR" if wb_name=="Lao People's Democratic Republic"
replace countryname = "Russia" if wb_name=="Russian Federation"
replace countryname = "SierraLeone" if wb_name=="Sierra Leone"
replace countryname = "Southsudan" if wb_name=="South Sudan"
replace countryname = "Venezuela" if wb_name=="Venezuela, Republica Bolivariana de"
replace countryname = "West Bank And Gaza" if wb_name=="West Bank and Gaza"
replace countryname = "Yemen" if wb_name=="Yemen, Republic of"
replace countryname = "China" if wb_name=="Hong Kong (SAR, China)"
replace countryname = "China" if wb_name=="Macau (SAR, China)"

merge m:1 countryname using "D:\Research\WEBS\graphs\gis_country_gdp.dta"
keep if _merge ==3
drop _merge

export delimited using "D:\Research\WEBS\graphs\WBES_country_gdp.csv", replace





*Figure 4: compare large cities and others*
*Using dissolve tool in ArcGIS to combine city polygons into a single polygon for a city

*city innovation index and nightlight data
use "D:\Research\WEBS\graphs\regression_sample_graph.dta", clear


*Mega city 10 million
gen megacity=0
replace megacity=1 if city=="Buenos Aires" | city=="Istanbul" | city=="Moscow" | city=="Karachi" | city=="Lahore" | city=="Delhi" | city=="Shanghai" | city=="Beijing" | city=="Chongqi" | city=="Tianjin" | city=="Guangzhou" | city=="Shenzhen" | city=="Mumbai" | city=="Manila" | city=="Lagos" | city=="Jakarta"
  
*Large city 5 million
gen large=megacity
replace large=1 if city=="Lima" | city=="Baghdad" |city=="Bogota" | city=="Kinshasa" | city=="Baghdad" | city=="Ho Chi Minh City" | city=="Hanoi" | city=="Cairo" | city=="Mexico City" | city=="Dhaka" | city=="Chittagong" | city=="Bangalore" | city=="Yangon" | city=="Bangkok" | city=="Alexandria" | city=="City of St. Petersburg" | city=="Hyderabad" | city=="Ahmadabad" | city=="Chengdu" | city=="Nanjing" | city=="Wuhan" | city=="Hangzhou" | city=="Dongguan" | city=="Chennai" | city=="Surat"


keep if city!=""
drop if city =="Vientiane" & countryname =="Thailand"


bysort city: egen nl_average = mean(nl_mean)
bysort countryname city: egen innov_index = mean(innovation)
duplicates drop countryname city, force

keep countryname city innov_index nl_average large

save "D:\Research\WEBS\graphs\gis_city_innov_large.dta", replace



import delimited D:\Research\WEBS\wb_countries_admin0_10m\country_name.csv, varnames(1) clear

gen countryname = wb_name

replace countryname = "Centralafricanrepublic" if wb_name=="Central African Republic"
replace countryname = "Costarica" if wb_name=="Costa Rica"
replace countryname = "Côte d'Ivoire" if wb_name=="CÃ´te d'Ivoire"
replace countryname = "Congo, Dem. Rep." if wb_name=="Congo, Democratic Republic of"
replace countryname = "DominicanRepublic" if wb_name=="Dominican Republic"
replace countryname = "Egypt" if wb_name=="Egypt, Arab Republic of"
replace countryname = "ElSalvador" if wb_name=="El Salvador"   
replace countryname = "Gambia" if wb_name=="Gambia, The"
replace countryname = "LaoPDR" if wb_name=="Lao People's Democratic Republic"
replace countryname = "Russia" if wb_name=="Russian Federation"
replace countryname = "SierraLeone" if wb_name=="Sierra Leone"
replace countryname = "Southsudan" if wb_name=="South Sudan"
replace countryname = "Venezuela" if wb_name=="Venezuela, Republica Bolivariana de"
replace countryname = "West Bank And Gaza" if wb_name=="West Bank and Gaza"
replace countryname = "Yemen" if wb_name=="Yemen, Republic of"
drop if wb_name=="Hong Kong (SAR, China)"
drop if wb_name=="Macau (SAR, China)"

merge 1:m countryname using "D:\Research\WEBS\graphs\gis_city_innov_large.dta"
keep if _merge ==3
drop _merge
export delimited using "D:\Research\WEBS\graphs\WBES_large_small_innov_map.csv", replace


preserve
keep if large==1
export delimited using "D:\Research\WEBS\graphs\WBES_innov_map_large.csv", replace

restore

keep if large==0
foreach var of varlist countryname city innov_index nl_average large wb_name {
 ren `var' `var'_2
}
export delimited using "D:\Research\WEBS\graphs\WBES_innov_map_small.csv", replace



