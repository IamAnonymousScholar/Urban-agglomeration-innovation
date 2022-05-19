

*****Combining with cities and nightlight*****
use "D:\Research\WEBS\2010-2020-match-gps.dta", clear
drop _merge

*Add city names
merge 1:1 idstd using "D:\Research\WEBS\Geo_data\firm_all_cityname.dta"
drop _merge

label variable city "cities for main analysis"


*Merge with nightlight measures
merge m:1 all_city year using "D:\Research\WEBS\Geo_data\nightlight_working_data\nl_all_cityname.dta"
drop if _merge ==2
drop _merge

label variable nl_mean "nightlight density in cities"
label variable area_km2 "area (in km2) cities"
save "D:\Research\WEBS\matched_WBES_regression.dta", replace



****merge with conflict data*****
use "D:\Research\WEBS\matched_WBES_regression.dta", clear
drop if all_city ==""
duplicates drop all_city year, force
keep year all_city
save "D:\Research\WEBS\Geo_data\nightlight_working_data\list_city_year.dta", replace


forvalues x = 2010(1)2019   {
import excel "D:\Research\WEBS\ged201-dta\conflict_WBES`x'.xls", sheet("conflict_WBES`x'") firstrow clear
keep if Join_Count >0
ren conflict_n conflict_new_id
ren total_deat total_death
ren all_city_1 all_city

keep year conflict_new_id best total_death start_date end_date all_city
save "D:\Research\WEBS\ged201-dta\conflict_WBES`x'", replace
}


use "D:\Research\WEBS\ged201-dta\conflict_WBES2010", clear
forvalues x = 2011(1)2019  {
  append using "D:\Research\WEBS\ged201-dta\conflict_WBES`x'"
}
save "D:\Research\WEBS\ged201-dta\conflict_all", replace

merge m:1 all_city year using "D:\Research\WEBS\Geo_data\nightlight_working_data\list_city_year.dta"
keep if _merge ==3
drop _merge

sort all_city year conflict_new_id

*drop very short conflicts (several days)
drop if all_city =="Cairo" & year == 2016
drop if all_city == "Hyderabad" & year == 2013
drop if all_city =="Kaduna"  & year == 2014
drop if all_city =="Kinshasa"  & year == 2013
drop if all_city =="Lagos"  & year == 2014
drop if all_city =="Lubumbashi"  & year == 2013

gen conflict =1
duplicates drop all_city year, force
keep year all_city conflict
save "D:\Research\WEBS\ged201-dta\conflict_match_WBES", replace


use "D:\Research\WEBS\matched_WBES_regression.dta", clear
merge m:1 all_city year using "D:\Research\WEBS\ged201-dta\conflict_match_WBES"
drop _merge

replace conflict =0 if conflict==. & all_city !=""

label variable conflict "War or civil war zone (>1000 battle deaths in the corresponding year)"

save "D:\Research\WEBS\matched_WBES_regression.dta", replace


