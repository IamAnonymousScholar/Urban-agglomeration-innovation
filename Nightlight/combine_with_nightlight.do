
**********Nightlight data**************
*NL: lag for one year
*Note: 2019 is the same as 2018. Just copy the 2018 data.
forvalues x = 2009(1)2019   {
 insheet using "D:\Research\WEBS\Geo_data\nightlight_working_data\nl`x'.csv", clear
 gen nl_year = `x'
 gen year = nl_year +1
 gen city_id = all_city_2
 
 ren mean nl_mean
 
 keep city_id year area nl_mean
 save "D:\Research\WEBS\Geo_data\nightlight_working_data\nl`x'.dta", replace
}

use "D:\Research\WEBS\Geo_data\nightlight_working_data\nl2009.dta", clear
forvalues x = 2010(1)2019  {
  append using "D:\Research\WEBS\Geo_data\nightlight_working_data\nl`x'.dta"
}
save "D:\Research\WEBS\Geo_data\nightlight_working_data\nl_all.dta", replace


insheet using "D:\Research\WEBS\Geo_data\nightlight_working_data\area_data.csv", clear

bysort all_city_2: egen area_km2 = sum(area_geo)
ren all_city_d fid 
keep fid area_km2

save "D:\Research\WEBS\Geo_data\nightlight_working_data\area_data", replace


use "D:\Research\WEBS\Geo_data\all_city_define.dta", clear
merge 1:1 fid using "D:\Research\WEBS\Geo_data\nightlight_working_data\area_data"
drop _merge

duplicates drop city_id, force
keep city_id all_city area_km2

merge 1:m city_id using "D:\Research\WEBS\Geo_data\nightlight_working_data\nl_all.dta"
keep if _merge ==3

drop _merge
drop city_id
drop area

save "D:\Research\WEBS\Geo_data\nightlight_working_data\nl_all_cityname.dta", replace



**********Adding city information to WBES firm level data************
*Note: we capture 34% of firms in WBES
use "D:\Research\WEBS\Geo_data\firm_city.dta", clear   
keep idstd city all_city
save "D:\Research\WEBS\Geo_data\firm_all_cityname.dta", replace


