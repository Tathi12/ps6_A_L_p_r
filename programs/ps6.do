global main "C:\Aplicada\ps6_A_L_p_r"
global input "$main/input"
global output "$main/output"
ssc install outreg2

use "C:\Users\Usuario\Documents\GitHub\ps6_A_L_p_r\Input\castle.dta", clear
use "$input/castle.dta", clear
xtset sid year // le explico a stata como estan mis datos 

****Ejercicio 1****

*uso los controles del archivo que mandaron* 
global region r20001-r20104 //region by year fixed effects 
global crime1 jhcitizen_c jhpolice_c murder homicide robbery assault burglary larceny motor robbery_gun_r //Contemporaneous Crime Rates
global lintrend trend_1-trend_51 // State-Specific Linear Time Trends
global demo blackm_15_24 whitem_15_24 blackm_25_44 whitem_25_44 //demographics
global spending l_exp_subsidy l_exp_pubwelfare
global xvar l_police unemployrt poverty l_income l_prisoner l_lagprisoner $demo $spending //time varing controls



*esto es extra pero me perdia sino* 
label var post "Castle Doctrine Law"
label var pre2_cdl "0 a 2 años antes de la castle doctrine law"
label var l_burglary "Log(Burglary)"
label var l_robbery "Log robery"
label var l_assault "Log asalto)"

*****Panel A: Burglary______________________

* columna 1_ i.year is State and Year Fixed Effect
xtreg l_burglary post i.year [aweight=popwt], fe cluster(sid) 
outreg2 using "$output/Tabla 4.tex",replace keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, No, Time-Varying Controls, No, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No)


* columna 2
xtreg l_burglary post i.year $region [aweight=popwt], fe cluster(sid) // 2
outreg2 using "$output/Tabla 4.tex", append  keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, No, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No) 


* columna 3
xtreg l_burglary post i.year $region $xvar [aweight=popwt], fe cluster(sid) // 3
outreg2 using "$output/Tabla 4.tex",append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No) 


* columna 4
xtreg l_burglary post pre2_cdl i.year $region $xvar [aweight=popwt], fe cluster(sid) // 4
outreg2 using "$output/Tabla 4.tex", append keep(post pre2_cdl) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No) 


* columna 5
xtreg l_burglary post i.year $region $xvar $crime1 [aweight=popwt], fe cluster(sid) // 5
outreg2 using "$output/Tabla 4.tex", append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, Yes, State-Specific Linear Time Trends, No)


* columna 6
xtreg l_burglary post i.year $region $xvar $lintrend [aweight=popwt], fe cluster(sid) 
outreg2 using "$output/Tabla 4.tex",append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, Yes) 


* columna 7
xtreg l_burglary post i.year, fe cluster(sid) // 7
outreg2 using "$output/Tabla 4.tex",append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects,  , Time-Varying Controls, No, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No) 


* columna 8
xtreg l_burglary post i.year $region, fe cluster(sid) // 8
outreg2 using "$output/Tabla 4.tex",append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, No, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No) 


* columna 9
xtreg l_burglary post i.year $region $xvar, fe cluster(sid) // 9
outreg2 using "$output/Tabla 4.tex", append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No) 


* columna 10
xtreg l_burglary post pre2_cdl i.year $region $xvar, fe cluster(sid) // 10
outreg2 using "$output/Tabla 4.tex",append keep(post pre2_cdl) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No) 

* columna 11
xtreg l_burglary post i.year $region $xvar $crime1, fe cluster(sid) // 11
outreg2 using "$output/Tabla 4.tex", append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, Yes, State-Specific Linear Time Trends, No) 


* columna 12
xtreg l_burglary post i.year $region $xvar $lintrend, fe cluster(sid) // 12
outreg2 using "$output/Tabla 4.tex", append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, Yes) 


*______________________________ panel b- robbery_______

* columna 1_ i.year is State and Year Fixed Effect
xtreg l_robbery post i.year [aweight=popwt], fe cluster(sid) 
outreg2 using "$output/Tabla 4pb.tex",replace keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, No, Time-Varying Controls, No, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No)


* columna 2
xtreg l_robbery post i.year $region [aweight=popwt], fe cluster(sid) // 2
outreg2 using "$output/Tabla 4pb.tex", append  keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, No, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No) 


* columna 3
xtreg l_robbery post i.year $region $xvar [aweight=popwt], fe cluster(sid) // 3
outreg2 using "$output/Tabla 4pb.tex",append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No) 


* columna 4
xtreg l_robbery post pre2_cdl i.year $region $xvar [aweight=popwt], fe cluster(sid) // 4
outreg2 using "$output/Tabla 4pb.tex", append keep(post pre2_cdl) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No) 


* columna 5
xtreg l_robbery post i.year $region $xvar $crime1 [aweight=popwt], fe cluster(sid) // 5
outreg2 using "$output/Tabla 4pb.tex", append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, Yes, State-Specific Linear Time Trends, No)


* columna 6
xtreg l_robbery post i.year $region $xvar $lintrend [aweight=popwt], fe cluster(sid) 
outreg2 using "$output/Tabla 4pb.tex",append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, Yes) 


* columna 7
xtreg l_robbery post i.year, fe cluster(sid) // 7
outreg2 using "$output/Tabla 4pb.tex",append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects,  , Time-Varying Controls, No, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No) 


* columna 8
xtreg l_robbery post i.year $region, fe cluster(sid) // 8
outreg2 using "$output/Tabla 4pb.tex",append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, No, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No) 


* columna 9
xtreg l_robbery post i.year $region $xvar, fe cluster(sid) // 9
outreg2 using "$output/Tabla 4pb.tex", append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No) 


* columna 10
xtreg l_robbery post pre2_cdl i.year $region $xvar, fe cluster(sid) // 10
outreg2 using "$output/Tabla 4pb.tex",append keep(post pre2_cdl) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No) 

* columna 11
xtreg l_robbery post i.year $region $xvar $crime1, fe cluster(sid) // 11
outreg2 using "$output/Tabla 4pb.tex", append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, Yes, State-Specific Linear Time Trends, No) 


* columna 12
xtreg l_robbery post i.year $region $xvar $lintrend, fe cluster(sid) // 12
outreg2 using "$output/Tabla 4pb.tex", append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, Yes) 


*______________________________ panel c- asaltos agravados ____________

** columna 1_ i.year is State and Year Fixed Effect
xtreg l_assault post i.year [aweight=popwt], fe cluster(sid) 
outreg2 using "$output/Tabla 4pc.tex", replace keep(post) dec(4) label ///
addtext (State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, No, Time-Varying Controls, No, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No)



* columna 2
xtreg l_assault post i.year $region [aweight=popwt], fe cluster(sid) // 2
outreg2 using "$output/Tabla 4pc.tex", append  keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, No, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No) 


* columna 3
xtreg l_assault post i.year $region $xvar [aweight=popwt], fe cluster(sid) // 3
outreg2 using "$output/Tabla 4pc.tex",append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No) 


* columna 4
xtreg l_assault post pre2_cdl i.year $region $xvar [aweight=popwt], fe cluster(sid) // 4
outreg2 using "$output/Tabla 4pc.tex", append keep(post pre2_cdl) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No) 


* columna 5
xtreg l_assault post i.year $region $xvar $crime1 [aweight=popwt], fe cluster(sid) // 5
outreg2 using "$output/Tabla 4pc.tex", append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, Yes, State-Specific Linear Time Trends, No)


* columna 6
xtreg l_assault post i.year $region $xvar $lintrend [aweight=popwt], fe cluster(sid) 
outreg2 using "$output/Tabla 4pc.tex",append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, Yes) 


* columna 7
xtreg l_assault post i.year, fe cluster(sid) // 7
outreg2 using "$output/Tabla 4pc.tex",append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects,  , Time-Varying Controls, No, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No) 


* columna 8
xtreg l_assault post i.year $region, fe cluster(sid) // 8
outreg2 using "$output/Tabla 4pc.tex",append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, No, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No) 


* columna 9
xtreg l_assault post i.year $region $xvar, fe cluster(sid) // 9
outreg2 using "$output/Tabla 4pc.tex", append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No) 


* columna 10
xtreg l_assault post pre2_cdl i.year $region $xvar, fe cluster(sid) // 10
outreg2 using "$output/Tabla 4pc.tex",append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No) 

* columna 11
xtreg l_assault post i.year $region $xvar $crime1, fe cluster(sid) // 11
outreg2 using "$output/Tabla 4pc.tex", append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, Yes, State-Specific Linear Time Trends, No) 


* columna 12
xtreg l_assault post i.year $region $xvar $lintrend, fe cluster(sid) // 12
outreg2 using "$output/Tabla 4pc.tex", append keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, Yes, Time-Varying Controls, Yes, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, Yes) 

****Ejercicio 2****

ssc install drdid
ssc install csdid

// reemplazo para que el año de tratamiento tenga un 0 si la unidad no fue tratada nunca 

replace effyear = 0 if effyear == .

gen lgassault = log(assault)

* CS
csdid lgassault population sid year, ivar(sid) time(year) gvar(effyear) method(reg) notyet

* Pretrends test. Veo si las tendencias son paralelas 
estat pretrend

* Average ATT
estat simple

* ATT by year
estat calendar

* ATT by group
estat group

* Event study plot
estat event
csdid_plot, title("Estudio de eventos")

csdid_plot, group(2005) name(m1,replace) title("Group 2005")
csdid_plot, group(2007) name(m2,replace) title("Group 2007")
csdid_plot, group(2008) name(m3,replace) title("Group 2008")
csdid_plot, group(2009) name(m4,replace) title("Group 2009")
graph combine m1 m2 m3 m4, xcommon scale(0.8)


****Ejercicio 3****

ssc install did_imputation

// Vuelvemos a la forma original de la variable effyear asi puedo usar el codigo

replace effyear = . if effyear == 0

// Ahroa estimamos con el did imputation sin ningun tipo de controles

did_imputation l_assault sid year effyear 


