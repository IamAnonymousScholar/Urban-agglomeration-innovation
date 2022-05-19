*World Bank Enterprise Surveys data is downloaded from https://www.enterprisesurveys.org/en/enterprisesurveys.

*Data for regression: "D:\Research\WEBS\matched_WBES_regression.dta"


***************Dependent Variables***************

*New Products/Services Introduced Over Last 3 Yrs
gen NewPro=1 if h1==1
replace NewPro=0 if h1==2

*During Last 3 Yrs, Establishment Introduced New/Significantly Improved Process
gen NewEst=1 if h5==1 
replace NewEst=0 if h5==2

*During Last Fiscal Year, Establishment Spent On R&D (Excl Market Research)?
gen RND=1 if h8==1
replace RND=0 if h8==2

*Integrated Innovation
gen innovation= NewPro+ NewEst+ RND
***************Dependent Variables***************


***************Independent Variables***************
gen endyear=year if year>=0
encode countryname, gen(countryNo)

gen nlsq=nl_mean*nl_mean
gen lognl=ln(nl_mean)
gen lognl_sq=lognl*lognl


*merge GDP per capita data which is downloaded from https://databank.worldbank.org/source/world-development-indicators/Type/TABLE/preview/on
*we use lagged GDP per capita in thousands
replace laggedGDPpc=laggedGDPpc/1000

*merge region data which is contructed from https://datahelpdesk.worldbank.org/knowledgebase/articles/906519-world-bank-country-and-lending-groups
*region data variable is called GroupCode and contrust region dummies
encode GroupCode, gen(regiondummy)

*merge population data and re-scale population in millions
merge m:1 city using "D:\Research\WEBS\city population data.dta"
drop if _merge==2
drop _merge

gen pop_m=pop/1000000


*To construct age, based on the var b5 Year Establishment Began Operations
gen startyear=b5 if b5>60

gen age=endyear-startyear


*size controls
gen medium_firm=0
replace medium_firm=1 if size==2

gen large_firm=0
replace large_firm=1 if size==3
***************Independent Variables***************



***************Excluding cities with <20 firms and developed countries***************
*drop cities with <20 firms
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

*drop countries with high gdp per capita or missing gdp per capita 
drop if gdppercapitaconstant2010us>30000

*Measurement error in GPS data
replace conflict=0 if city=="Shenzhen"
replace nl_mean=54.664608 if city=="Shenzhen"
drop if all_city =="Vientiane" & countryname=="Thailand"

