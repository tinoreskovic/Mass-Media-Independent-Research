log using "/Users/milisanwalka/Desktop/MassMedia_Mili/analysis_log.log", replace


//generation of variable logs
gen logdeaths = ln(totaldeaths)
replace logdeaths=0 if logdeaths==.

gen logcoverage = ln(coverage)
replace logcoverage=0 if logcoverage==.

gen logratio1 = ln(ratio1)
replace logratio1 = -4.7 if logratio1==.

encode disastertype, generate(distype)

gen logaffected = ln(totalaffected)
replace logaffected=0 if logaffected==.


//relationship between #affected and #deaths
twoway (scatter logaffected logdeaths) (lfit logaffected logdeaths), by(distype)


//relationship between #affected and #deaths without disasters where #affected data was missing so replaced by #deaths
twoway (scatter logaffected logdeaths) (lfit logaffected logdeaths) if logaffected!=logdeaths, by(distype)

//see relationship between disaster type and urban/rural classification
tab urbanlocation distype


//see relationship between coverage and disaster intensity by urban/rural
sort urbanlocation
graph twoway (scatter logcoverage logdeaths if urbanlocation==0) (scatter logcoverage logdeaths if urbanlocation==1) (lfit logcoverage logdeaths if urbanlocation==0) (lfit logcoverage logdeaths if urbanlocation==1), legend(label(1 'Log(Coverage for Rural)') label(2 'Log(Coverage for Urban)')) 
//tin: try to make the data points and the fit lines be of the same color so one can tell which intercept is higher

//see relationship between reader interest and disaster intensity by disastertype
graph twoway (scatter logratio1 logdeaths) (lfit logratio1 logdeaths), by(distype)

regress logcoverage logratio1 logdeaths urbanlocation

regress logcoverage logratio1 logdeaths urbanlocation logaffected if totaldeaths!=totalaffected

regress logcoverage logratio1 logdeaths urbanlocation i.distype i.year
predict residual, r
predict coverageestimate, xb

sort urbanlocation

twoway (histogram residual if urbanlocation==1, color(green)) (histogram residual if urbanlocation==0, fcolor(none) lcolor(black)), legend(order(1 "Urban" 2 "Rural" ))


separate residual, by(urbanlocation)

twoway (scatter residual0 coverageestimate) (scatter residual1 coverageestimate)


twoway (scatter coverageestimate logcoverage) (lfit coverageestimate logcoverage)

//northeast analysis

regress logcoverage logratio1 logdeaths northeastlocation

regress logcoverage logratio1 logdeaths northeastlocation urbanlocation



