global main "C:\Aplicada\ps6_A_L_p_r"
global input "$main/input"
global output "$main/output"
ssc install outreg2

use "$input/castle.dta", clear
xtset sid year // le explico a stata como estan mis datos 

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
outreg2 using "$output/Tabla 4.tex",append keep(post) dec(4) label ///
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
outreg2 using "$output/Tabla 4pb.tex",append keep(post) dec(4) label ///
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

* columna 1_ i.year is State and Year Fixed Effect
xtreg l_assault post i.year [aweight=popwt], fe cluster(sid) 
outreg2 using "$output/Tabla 4pc.tex", replace keep(post) dec(4) label ///
addtext(State and Year Fixed Effects, Yes, Region-by-Year Fixed Effects, No, Time-Varying Controls, No, Contemporaneous Crime Rates, No, State-Specific Linear Time Trends, No)


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


