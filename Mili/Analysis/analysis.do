//log using "/Users/milisanwalka/Desktop/MassMedia_Mili/analysis_log.log", replace


//generation of variable logs

cd "/Users/milisanwalka/Desktop/Brown/Classes/Spring2017/massmediamania/GoogleDrive/EditedDataset"

use "editeddata.dta"

set graphics off 

gen disasterid = _n

replace ratio1=0.001 if ratio1==0
replace coverage=0.1 if coverage==0
replace totaldeaths=0.1 if totaldeaths==0
replace totalaffected=0.1 if totalaffected==0

gen logratio1 = ln(ratio1)

gen logcoverage = ln(coverage)

gen logdeaths = ln(totaldeaths)

gen logaffected = ln(totalaffected)

encode disastertype, generate(distype)




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

regress logcoverage logdeaths urbanlocation i.distype i.year

sort urbanlocation

twoway (histogram residual if urbanlocation==1, color(green)) (histogram residual if urbanlocation==0, fcolor(none) lcolor(black)), legend(order(1 "Urban" 2 "Rural" ))


separate residual, by(urbanlocation)

twoway (scatter residual0 coverageestimate) (scatter residual1 coverageestimate)


twoway (scatter coverageestimate logcoverage) (lfit coverageestimate logcoverage)

//northeast analysis

regress logcoverage logratio1 logdeaths northeastlocation

regress logcoverage logratio1 logdeaths northeastlocation urbanlocation


regress logcoverage logratio1 logdeaths  i.distype i.year
predict residual2, r
predict coverageestimate2, xb

sort urbanlocation

twoway (histogram residual2 if urbanlocation==1, color(green)) (histogram residual2 if urbanlocation==0, fcolor(none) lcolor(black)), legend(order(1 "Urban" 2 "Rural" ))






