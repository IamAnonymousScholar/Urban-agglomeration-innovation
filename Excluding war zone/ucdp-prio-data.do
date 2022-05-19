
use "D:\Research\WEBS\ucdp-prio-acd-201-dta\ucdp-prio-acd-201.dta", clear 
keep if year >2001
keep if intensity_level ==2
keep conflict_id location side_a side_a_2nd side_b side_b_2nd year intensity_level type_of_conflict start_date start_date2 ep_end ep_end_date ep_end_prec
sort year location
save "D:\Research\WEBS\ucdp-prio-acd-201-dta\ucdp-prio.dta", replace 




*Note: include all conflicts (state, non-state, one-sided), not only civil war, time-varying. Year is contemporaneous to the WBES year
use "D:\Research\WEBS\ged201-dta\ged201.dta", clear
keep if year >2009

*we restrict the sample in the raw data to conflicts resulting in more than 1000 battle deaths in one year
gen obs =1 
bysort conflict_new_id year: egen total_death = sum(best)
keep if total_death >=1000

gen start_date = substr(date_start, 1, 10)
gen end_date = substr(date_end, 1, 10)

keep id conflict_new_id year latitude longitude best total_death start_date end_date
save "D:\Research\WEBS\ged201-dta\ged201_simp.dta", replace

levelsof year, local(levels) 
   foreach z of local levels {
	  use "D:\Research\WEBS\ged201-dta\ged201_simp.dta", clear
	   keep if year ==`z'
	   export delimited using "D:\Research\WEBS\ged201-dta\GPS_`z'.csv", replace
       }
   


*restrict the duration of conflicts
