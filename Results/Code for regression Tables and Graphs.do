*****Tables and Figures in Manuscript********
*Tables
*Table 1 Summary Statistics
*Sample size is based on ordered logit model of innovation index regression
gen no_innovation=0
replace no_innovation=1 if innovation==0

gen low_innovation=0
replace low_innovation=1 if innovation==1

gen medium_innovation=0
replace medium_innovation=1 if innovation==2

gen high_innovation=0
replace high_innovation=1 if innovation==3

ologit innovation c.lognl c.lognl#c.lognl laggedGDPpc i.regiondummy i.endyear if city!="" & conflict==0 
sum no_innovation low_innovation medium_innovation high_innovation NewPro NewEst RND nl_mean if e(sample)==1


*Table 2
logit NewPro c.lognl c.lognl#c.lognl laggedGDPpc i.regiondummy i.endyear if city!="" & conflict==0 
outreg2 using table2.doc, keep (c.lognl c.lognl#c.lognl laggedGDPpc) append  dec(3) addtext(Method, Logit, Conflict, Exclude, GDPpc>30000, Exclude, Region FE, Yes, Year FE, Yes,  R-squared, NA)  addstat(Pseudo R2, e(r2_p)) stat(coef pval ci)

logit NewEst c.lognl c.lognl#c.lognl laggedGDPpc i.regiondummy i.endyear if city!="" & conflict==0 
outreg2 using table2.doc, keep (c.lognl c.lognl#c.lognl laggedGDPpc) append  dec(3)  addtext(Method, Logit, Conflict, Exclude, GDPpc>30000, Exclude, Region FE, Yes, Year FE, Yes,  R-squared, NA)  addstat(Pseudo R2, e(r2_p)) stat(coef pval ci)

logit RND c.lognl c.lognl#c.lognl laggedGDPpc i.regiondummy i.endyear if city!="" & conflict==0 
outreg2 using table2.doc, keep (c.lognl c.lognl#c.lognl laggedGDPpc) append  dec(3)  addtext(Method, Logit, Conflict, Exclude, GDPpc>30000, Exclude, Region FE, Yes, Year FE, Yes,  R-squared, NA)  addstat(Pseudo R2, e(r2_p)) stat(coef pval ci)

ologit innovation c.lognl c.lognl#c.lognl laggedGDPpc i.regiondummy i.endyear if city!="" & conflict==0 
outreg2 using table2.doc, keep (c.lognl c.lognl#c.lognl laggedGDPpc) append  dec(3)  addtext(Method, Logit, Conflict, Exclude, GDPpc>30000, Exclude, Region FE, Yes, Year FE, Yes,  R-squared, NA)  addstat(Pseudo R2, e(r2_p)) stat(coef pval ci)



*Figures
*Figure 2
ologit innovation c.lognl c.lognl#c.lognl c.pop_m c.lognl#c.pop_m c.lognl#c.lognl#c.pop_m laggedGDPpc i.regiondummy i.endyear if city!="" & conflict==0 & gdppercapitaconstant2010us<=30000 & gdppercapitaconstant2010us!=.

*predicted probabiliyt of no innovation
margins, at(lognl=(-1.30(0.5)4.15) pop_m=(0.27(1)27)) predict(outcome(#1))

*predicted probability of low innovation
margins, at(lognl=(-1.30(0.5)4.15) pop_m=(0.27(1)27)) predict(outcome(#2))

*predicted probability of medium innovation 
margins, at(lognl=(-1.30(0.5)4.15) pop_m=(0.27(1)27)) predict(outcome(#3))

*predicted probability of high innovation 
margins, at(lognl=(-1.30(0.5)4.15) pop_m=(0.27(1)27)) predict(outcome(#4))

*based on those predicted values, construct innovation intensition, calculated as the cumulative (predicted) probability of having low, medium and high levels of innovation
*and also innovation intensity, calculated as the predicted probability of having a high level of innovation
*Use this site to produce 3D graphs: https://imclient.herokuapp.com/chartsbuilder/?charttype=3d
*Press the button "Choose file" and then choose the file "innovation intensity" or "innovation intention", upload
*Then press the button "Draw 3D Graph", a 3D graph will be produced

*Figure 3
ologit innovation c.lognl c.lognl#c.lognl laggedGDPpc i.regiondummy i.endyear if city!="" & conflict==0 & large==1 & gdppercapitaconstant2010us<=30000 
margins, at(lognl=(0.75(0.02)4.14)) predict(outcome(#1))
margins, at(lognl=(0.75(0.02)4.14)) predict(outcome(#2))
margins, at(lognl=(0.75(0.02)4.14)) predict(outcome(#3))
margins, at(lognl=(0.75(0.02)4.14)) predict(outcome(#4))



ologit innovation c.lognl c.lognl#c.lognl laggedGDPpc i.regiondummy i.endyear if city!="" & conflict==0 & large==0 & gdppercapitaconstant2010us<=30000 
margins, at(lognl=(-1.31(0.05)4.14)) predict(outcome(#1))
margins, at(lognl=(-1.31(0.05)4.14)) predict(outcome(#2))
margins, at(lognl=(-1.31(0.05)4.14)) predict(outcome(#3))
margins, at(lognl=(-1.31(0.05)4.14)) predict(outcome(#4))

*Similar data generation as in Figure 2 and then data is saved as: 1. innovation intention large city or not.dta, 2. innovation intensity large city or not.dta


clear 
use "innovation intention large city or not.dta"
twoway  (rarea lowerb_nd upperb_nd lognl if largecity==1, sort color(gs14)) (line yhat_nd lognl if largecity==1) (rarea lowerb_nd upperb_nd lognl if largecity==0, sort color(gs15)) (line yhat_nd lognl if largecity==0 ), ///
		xtitle("Log Night Light") ytitle("Pr(Innovation)") legend(order(2 1 4 3) label(1 "95% Confidence Level") label(2 "Large City (lognl:0.75-4.14)") label (4 "Non Large City (lognl:-1.31-4.14)") label(3 "95% Confidence Level") ) title("Large City V.S. Non Large City", size(small))	
		
clear 
use "innovation intensity large city or not.dta"
twoway  (rarea lowerb_nd upperb_nd lognl if largecity==1, sort color(gs14)) (line yhat_nd lognl if largecity==1) (rarea lowerb_nd upperb_nd lognl if largecity==0, sort color(gs15)) (line yhat_nd lognl if largecity==0 ), ///
		xtitle("Log Night Light") ytitle("Predict Pr(Innovation Index=3)") legend(order(2 1 4 3) label(1 "95% Confidence Level") label(2 "Large City (lognl:0.75-4.14)") label (4 "Non Large City (lognl:-1.31-4.14)") label(3 "95% Confidence Level") ) title("Large City V.S. Non Large City", size(small))	

		
		
****Tables in Supplementary Information****
*Table 3
ologit innovation  c.lognl c.lognl#c.lognl c.pop_m c.lognl#c.pop_m c.lognl#c.lognl#c.pop_m  laggedGDPpc i.regiondummy i.endyear if city!="" & conflict==0 
outreg2 using results1.doc, keep ( c.lognl c.lognl#c.lognl c.pop_m c.lognl#c.pop_m c.lognl#c.lognl#c.pop_m laggedGDPpc) append  dec(3) addtext(Method, Ordered Logit, Conflict, Exclude, GDPpc>30000, Exclude, Region FE, Yes, Year FE, Yes)  addstat(Pseudo R2, e(r2_p)) stat(coef pval ci)

*Table 4
*large city 5 million
gen large=0
replace large=1 if city=="Lima" | city=="Baghdad" |city=="Bogota" | city=="Kinshasa" | city=="Baghdad" | city=="Ho Chi Minh City" | city=="Hanoi" | city=="Cairo" | city=="Mexico City" | city=="Dhaka" | city=="Chittagong" | city=="Bangalore" | city=="Yangon" | city=="Bangkok" | city=="Alexandria" | city=="City of St. Petersburg" | city=="Hyderabad" | city=="Ahmadabad" | city=="Chengdu" | city=="Nanjing" | city=="Wuhan" | city=="Hangzhou" | city=="Dongguan" | city=="Chennai" | city=="Surat" | city=="Buenos Aires" | city=="Istanbul" | city=="Moscow" | city=="Karachi" | city=="Lahore" | city=="Delhi" | city=="Shanghai" | city=="Beijing" | city=="Chongqi" | city=="Tianjin" | city=="Guangzhou" | city=="Shenzhen" | city=="Mumbai" | city=="Manila" | city=="Lagos" | city=="Jakarta"
  
ologit innovation c.lognl c.lognl#c.lognl laggedGDPpc i.regiondummy i.endyear if city!="" & conflict==0 & large==1 
outreg2 using results1.doc, keep (c.lognl c.lognl#c.lognl laggedGDPpc) append  dec(3) addtext(Large City, Yes, Method, Ordered Logit, Conflict, Exclude, GDPpc>30000, Exclude, Region FE, Yes, Year FE, Yes) stat(coef pval ci)

ologit innovation c.lognl c.lognl#c.lognl laggedGDPpc i.regiondummy i.endyear if city!="" & conflict==0 & large==0  
outreg2 using results1.doc, keep (c.lognl c.lognl#c.lognl laggedGDPpc) append  dec(3) addtext(Large City, No, Method, Ordered Logit, Conflict, Exclude, GDPpc>30000, Exclude, Region FE, Yes, Year FE, Yes) stat(coef pval ci)



*Table 5
*OLS robustness
reg NewPro c.lognl c.lognl#c.lognl laggedGDPpc i.regiondummy i.endyear if city!="" & conflict==0 
outreg2 using results1.doc, keep (c.lognl c.lognl#c.lognl laggedGDPpc) append  dec(3) addtext(Conflict, Exclude, GDPpc>30000, Exclude, Region FE, Yes, Year FE, Yes)   stat(coef pval ci)

reg NewEst c.lognl c.lognl#c.lognl laggedGDPpc i.regiondummy i.endyear if city!="" & conflict==0 
outreg2 using results1.doc, keep (c.lognl c.lognl#c.lognl laggedGDPpc) append  dec(3)  addtext(Conflict, Exclude, GDPpc>30000, Exclude, Region FE, Yes, Year FE, Yes)   stat(coef pval ci)

reg RND c.lognl c.lognl#c.lognl laggedGDPpc i.regiondummy i.endyear if city!="" & conflict==0 
outreg2 using results1.doc, keep (c.lognl c.lognl#c.lognl laggedGDPpc) append  dec(3)  addtext(Conflict, Exclude, GDPpc>30000, Exclude, Region FE, Yes, Year FE, Yes)   stat(coef pval ci)


reg innovation c.lognl c.lognl#c.lognl laggedGDPpc i.regiondummy i.endyear if city!="" & conflict==0 
outreg2 using results1.doc, keep (c.lognl c.lognl#c.lognl laggedGDPpc) append  dec(3)  addtext(Conflict, Exclude, GDPpc>30000, Exclude, Region FE, Yes, Year FE, Yes)   stat(coef pval ci)

reg innovation  c.lognl c.lognl#c.lognl c.pop_m c.lognl#c.pop_m c.lognl#c.lognl#c.pop_m laggedGDPpc i.regiondummy i.endyear if city!="" & conflict==0 
outreg2 using results1.doc, keep ( c.lognl c.lognl#c.lognl c.pop_m c.lognl#c.pop_m c.lognl#c.lognl#c.pop_m laggedGDPpc) append  dec(3) addtext(Method, OLS, Conflict, Exclude, GDPpc>30000, Exclude, Region FE, Yes, Year FE, Yes)   stat(coef pval ci)

reg innovation c.lognl c.lognl#c.lognl laggedGDPpc i.regiondummy i.endyear if city!="" & conflict==0 & large==1 & gdppercapitaconstant2010us<=30000 
outreg2 using results1.doc, keep (c.lognl c.lognl#c.lognl laggedGDPpc) append  dec(3) addtext(Large City, Yes, Method, OLS, Conflict, Exclude, GDPpc>30000, Exclude, Region FE, Yes, Year FE, Yes) stat(coef pval ci)

reg innovation c.lognl c.lognl#c.lognl laggedGDPpc i.regiondummy i.endyear if city!="" & conflict==0 & large==0 & gdppercapitaconstant2010us<=30000 
outreg2 using results1.doc, keep (c.lognl c.lognl#c.lognl laggedGDPpc) append  dec(3) addtext(Large City, No, Method, OLS, Conflict, Exclude, GDPpc>30000, Exclude, Region FE, Yes, Year FE, Yes) stat(coef pval ci)



*Table 6
*Add firm level controls
logit NewPro c.lognl c.lognl#c.lognl age medium_firm large_firm laggedGDPpc i.regiondummy i.endyear if city!="" & conflict==0 
outreg2 using results1.doc, keep (c.lognl c.lognl#c.lognl age medium large laggedGDPpc) append  dec(3) addtext(Method, Logit, Conflict, Exclude, GDPpc>30000, Exclude, Region FE, Yes, Year FE, Yes,  R-squared, NA)  addstat(Pseudo R2, e(r2_p)) stat(coef pval ci)

logit NewEst c.lognl c.lognl#c.lognl age medium_firm large_firm laggedGDPpc i.regiondummy i.endyear if city!="" & conflict==0 
outreg2 using results1.doc, keep (c.lognl c.lognl#c.lognl age medium large laggedGDPpc) append  dec(3)  addtext(Method, Logit, Conflict, Exclude, GDPpc>30000, Exclude, Region FE, Yes, Year FE, Yes,  R-squared, NA)  addstat(Pseudo R2, e(r2_p)) stat(coef pval ci)

logit RND c.lognl c.lognl#c.lognl laggedGDPpc age medium_firm large_firm i.regiondummy i.endyear if city!="" & conflict==0 
outreg2 using results1.doc, keep (c.lognl c.lognl#c.lognl age medium large laggedGDPpc) append  dec(3)  addtext(Method, Logit, Conflict, Exclude, GDPpc>30000, Exclude, Region FE, Yes, Year FE, Yes,  R-squared, NA)  addstat(Pseudo R2, e(r2_p)) stat(coef pval ci)

ologit innovation c.lognl c.lognl#c.lognl age medium_firm large_firm laggedGDPpc i.regiondummy i.endyear if city!="" & conflict==0 
outreg2 using results1.doc, keep (c.lognl c.lognl#c.lognl age medium large laggedGDPpc) append  dec(3)  addtext(Method, Logit, Conflict, Exclude, GDPpc>30000, Exclude, Region FE, Yes, Year FE, Yes,  R-squared, NA)  addstat(Pseudo R2, e(r2_p)) stat(coef pval ci)

*Table 7
*Generalized ordered logit
tab regiondummy, gen(rr)
tab endyear, gen(yy)
ologit innovation c.lognl c.lognl#c.lognl laggedGDPpc i.regiondummy i.endyear if city!="" & conflict==0
 
gologit innovation lognl lognl_sq laggedGDPpc rr* yy* if e(sample)==1
outreg2 using results1.doc, keep (lognl lognl_sq laggedGDPpc) append  dec(2)  addtext(Method, Generalized Ordered Logit, Conflict, Exclude, GDPpc>30000, Exclude, Region FE, Yes, Year FE, Yes)  addstat(Pseudo R2, e(r2_p)) stat(coef pval ci)
 
