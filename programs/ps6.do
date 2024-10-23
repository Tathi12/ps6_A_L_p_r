global main "C:\Aplicada\ps6_A_L_p_r"
global input "$main/input"
global output "$main/output"
ssc install outreg

use "$input/castle.dta", clear



ssc install bacondecomp
gen log_burglary = log(burglary) if burglary > 0
gen log_robbery = log(robbery) if robbery > 0

* Definimos las variables globales (tal como en el código de referencia)
global crime1 jhcitizen_c jhpolice_c murder homicide robbery assault burglary larceny motor robbery_gun_r 
global demo blackm_15_24 whitem_15_24 blackm_25_44 whitem_25_44 //demografía
global lintrend trend_1-trend_51 //tendencias lineales por estado
global region r20001-r20104  //efectos fijos por región y trimestre
global exocrime l_larceny l_motor // tasas exógenas de crimen
global spending l_exp_subsidy l_exp_pubwelfare
global xvar l_police unemployrt poverty l_income l_prisoner l_lagprisoner $demo $spending

* Panel A: Burglary - Regresión ponderada (OLS con ponderación por población)
xi: xtreg log_burglary post $region $xvar $lintrend [aweight=popwt], fe vce(cluster sid)

* Panel A: Burglary - Regresión no ponderada
xi: xtreg log_burglary post $region $xvar $lintrend, fe vce(cluster sid)

* Panel B: Robbery - Regresión ponderada (OLS con ponderación por población)
xi: xtreg log_robbery post $region $xvar $lintrend [aweight=popwt], fe vce(cluster sid)

* Panel B: Robbery - Regresión no ponderada
xi: xtreg log_robbery post $region $xvar $lintrend, fe vce(cluster sid)
