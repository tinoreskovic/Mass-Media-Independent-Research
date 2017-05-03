eststo clear
clear
loc direc "C:\Users\awjia\Dropbox\Research\SCMP\Mass_Media\Andrew"
//loc direc_alt "C:\Users\awjia\Google Drive\Mass Media\Andrew" 
cd `direc'

set more off

import delimited using "Derived\SCMP_domestic_data.csv"
qui sum
scalar month_count = r(N)
gen scmp = 1
save "Analysis\Data_domestic.dta", replace

import delimited using "Derived\STD_domestic_data.csv", clear
append using "Analysis\Data_domestic.dta"
replace scmp = 0 if scmp == .
gen month = _n - 1 if scmp == 0
replace month = _n - month_count - 1 if scmp == 1
save "Analysis\Data_domestic.dta", replace

import delimited using "Derived\gtrends_source.csv", rowr(4) varn(nonames) asfloat clear
ren (v1 v2) (date gtrends)
gen date_new = substr(date, 1, 7)
collapse (mean) gtrends, by(date_new)
gen month = _n - 1
drop date_new
merge 1:m month using "Analysis\Data_domestic.dta"
drop _merge
save "Analysis\Data_domestic.dta", replace

ren (v1 v2 v3 v4 v5 v6 v7 v8) (xinhua_count coll_count pb_count pd_count local_count lead_count count acq)
gen acq_scmp = scmp*acq
gen xinhua_share = xinhua_count / count
gen coll_share = coll_count / count
gen pb_share = pb_count / local_count
gen lead_share = lead_count / count

sort scmp month
save "Analysis\Data_domestic.dta", replace

gen gtrends_scmp = gtrends * scmp

egen offset = min(month) if acq == 1
qui sum offset
replace offset = r(mean)
replace month = month - offset
drop offset

label var scmp "SCMP"
label var acq "Acquired"
label var acq_scmp "Acquired * SCMP"
label var gtrends_scmp "SCMP * Google Trends Index"
label var month "Month"
label var pb_share "Pro-Beijing share"
label var lead_share "CCP share"
label var xinhua_share "Xinhua share"
label var coll_share "Collective action tokens"

save "Analysis\Data_domestic.dta", replace

********************************************************************************
*regressions

cd `"Analysis"'


foreach measure in pb_share lead_share xinhua_share coll_share {
	sum `measure' if month < 0 & scmp == 1
	loc `measure'_mean_scmp_pre = r(mean)
	loc `measure'_sd_scmp_pre = r(sd)
	
	sum `measure' if month < 0 & scmp == 0
	loc `measure'_mean_std_pre = r(mean)
	loc `measure'_sd_std_pre = r(sd)
	}

foreach share in pb lead xinhua coll {
	sum `share'_share if month < 0 & scmp == 1
		loc measure_mean_scmp_pre = r(mean)
		loc measure_sd_scmp_pre = r(sd)	
	sum `share'_share if month < 0 & scmp == 0
		loc measure_mean_std_pre = r(mean)
		loc measure_sd_std_pre = r(sd)

	reg `share'_share acq_scmp scmp acq, vce(robust)
		estadd loc measure_mean_scmp_pre
		estadd loc measure_sd_scmp_pre
		eststo `share'1
	reg `share'_share acq_scmp scmp acq gtrends_scmp, vce(robust)
		estadd loc measure_mean_std_pre
		estadd loc measure_sd_std_pre
		eststo `share'2
		}

esttab pb1 pb2 lead1 lead2 xinhua1 xinhua2 coll1 coll2 using "Tables\domestic.tex", replace compress se r2 label title(Main Results\label{table:main}) ///
mtitles("Pro-Beijing" "Pro-Beijing" "CCP" "CCP" "Xinhua" "Xinhua" "Coll. Action" "Coll. Action") ///		
stats(N r2 measure_mean_scmp_pre measure_sd_scmp_pre measure_mean_std_pre measure_sd_std_pre, ///
labels("Observations" "R^2" "SCMP preacq. mean" "SCMP preacq. SD" "STD preacq. mean" "STD preacq. SD") fmt(0 3 3 3 3 3)) ///
substitute("{table}" "{sidewaystable}")

eststo clear
estpost tabstat pb_share lead_share xinhua_share coll_share, listwise statistics(mean sd min max) columns(statistics)
esttab using "Tables\domestic_summary.tex", cells("mean sd min max") mtitles("Mean" "Std. dev" "Min" "Max") nonumber noobs collabels(none) replace
************************************************
sort month 

twoway (line gtrends month, xaxis(1 2) xlab(-19 "Occupy Central Protests", axis(2))), xline(-19) xtitle("", axis(2)) xlab(-25(10)11, axis(1)) ytitle(Google Trends Index)
graph export "Figures\gtrends.png", replace

loc measure_opt legend(label(1 "SCMP") label(2 "STD")) xtitle("", axis(1)) xline(0) xlab(0 "Acquisition", axis(1)) xlab(-25(5)11, axis(2))

twoway (line pb_share month if scmp == 1) (line pb_share month if scmp == 0, xaxis(1 2)), `measure_opt'
graph export "Figures\pb_share_domestic.png", replace
twoway (line lead_share month if scmp == 1) (line lead_share month if scmp == 0, xaxis(1 2)), `measure_opt'
graph export "Figures\lead_share_domestic.png", replace
twoway (line xinhua_share month if scmp == 1) (line xinhua_share month if scmp == 0, xaxis(1 2)), `measure_opt'
graph export "Figures\xinhua_share_domestic.png", replace
twoway (line coll_share month if scmp == 1) (line coll_share month if scmp == 0, xaxis(1 2)), `measure_opt'
graph export "Figures\coll_share_domestic.png", replace

******************************falsification*************************************

qui sum month
scalar def start_f = r(min) + 1
scalar def end_f = r(max) - 1

gen acq_f = 0
gen acq_scmp_f = 0
gen histo = .


/********************falsification for Pro-Beijing*******************************
foreach i of num `=start_f'/`=end_f' {
	replace acq_f = 0
	replace acq_f = 1 if month >= `i'
	replace acq_scmp_f = 0
	replace acq_scmp_f = acq_f * scmp
	reg pb_share scmp acq_f acq_scmp_f
	mat b = e(b)
	loc j = `i' - start_f + 1
	scalar b`j' = b[1, 3]
}

scalar list

replace histo = .
qui foreach i of num `=start_f'/`=end_f' {
	loc j = `i' - start_f + 1
	replace histo = scalar(b`j') if _n == `j'
}
label var histo "Pro-Beijing share coefficients"
hist histo
graph save fals_pb, replace

*with controls
foreach i of num `=start_f'/`=end_f' {
	replace acq_f = 0
	replace acq_f = 1 if month >= `i'
	replace acq_scmp_f = 0
	replace acq_scmp_f = acq_f * scmp
	qui reg pb_share scmp acq_f acq_scmp_f gtrends_scmp
	mat b = e(b)
	loc j = `i' - start_f + 1
	scalar b`j' = b[1, 3]
}

scalar list

replace histo = .
qui foreach i of num `=start_f'/`=end_f' {
	loc j = `i' - start_f + 1
	replace histo = scalar(b`j') if _n == `j'
}
label var histo "Pro-Beijing share coefficients, control"
hist histo
graph save fals_pb_c, replace
*/
*******************falsification for leader*************************************
foreach i of num `=start_f'/`=end_f' {
	replace acq_f = 0
	replace acq_f = 1 if month >= `i'
	replace acq_scmp_f = 0
	replace acq_scmp_f = acq_f * scmp
	reg lead_share scmp acq_f acq_scmp_f
	mat b = e(b)
	loc j = `i' - start_f + 1
	scalar b`j' = b[1, 3]
}

scalar list

replace histo = .
qui foreach i of num `=start_f'/`=end_f' {
	loc j = `i' - start_f + 1
	replace histo = scalar(b`j') if _n == `j'
}
label var histo "Leader share coefficients"
hist histo
graph save fals_lead, replace

*with controls
foreach i of num `=start_f'/`=end_f' {
	replace acq_f = 0
	replace acq_f = 1 if month >= `i'
	replace acq_scmp_f = 0
	replace acq_scmp_f = acq_f * scmp
	qui reg lead_share scmp acq_f acq_scmp_f gtrends_scmp
	mat b = e(b)
	loc j = `i' - start_f + 1
	scalar b`j' = b[1, 3]
}

scalar list

replace histo = .
qui foreach i of num `=start_f'/`=end_f' {
	loc j = `i' - start_f + 1
	replace histo = scalar(b`j') if _n == `j'
}
label var histo "Leader share coefficients, control"
hist histo
graph save fals_lead_c, replace

**********************falsification for xinhua**********************************
foreach i of num `=start_f'/`=end_f' {
	replace acq_f = 0
	replace acq_f = 1 if month >= `i'
	replace acq_scmp_f = 0
	replace acq_scmp_f = acq_f * scmp
	qui reg xinhua_share scmp acq_f acq_scmp_f
	mat b = e(b)
	loc j = `i' - start_f + 1
	scalar b`j' = b[1, 3]
}

scalar list

replace histo = .
qui foreach i of num `=start_f'/`=end_f' {
	loc j = `i' - start_f + 1
	replace histo = scalar(b`j') if _n == `j'
}
label var histo "Xinhua share coefficients"
hist histo
graph save fals_xinhua, replace

*with controls
foreach i of num `=start_f'/`=end_f' {
	replace acq_f = 0
	replace acq_f = 1 if month >= `i'
	replace acq_scmp_f = 0
	replace acq_scmp_f = acq_f * scmp
	qui reg xinhua_share scmp acq_f acq_scmp_f gtrends_scmp
	mat b = e(b)
	loc j = `i' - start_f + 1
	scalar b`j' = b[1, 3]
}

scalar list

replace histo = .
qui foreach i of num `=start_f'/`=end_f' {
	loc j = `i' - start_f + 1
	replace histo = scalar(b`j') if _n == `j'
}
label var histo "Xinhua share coefficients, control"
hist histo
graph save fals_xinhua_c, replace

********************falsification for coll**************************************
foreach i of num `=start_f'/`=end_f' {
	replace acq_f = 0
	replace acq_f = 1 if month >= `i'
	replace acq_scmp_f = 0
	replace acq_scmp_f = acq_f * scmp
	qui reg coll_share scmp acq_f acq_scmp_f
	mat b = e(b)
	loc j = `i' - start_f + 1
	scalar b`j' = b[1, 3]
}

scalar list

replace histo = .
qui foreach i of num `=start_f'/`=end_f' {
	loc j = `i' - start_f + 1
	replace histo = scalar(b`j') if _n == `j'
}
label var histo "Coll action share coefficients"
hist histo
graph save fals_coll, replace

*with controls
foreach i of num `=start_f'/`=end_f' {
	replace acq_f = 0
	replace acq_f = 1 if month >= `i'
	replace acq_scmp_f = 0
	replace acq_scmp_f = acq_f * scmp
	qui reg coll_share scmp acq_f acq_scmp_f gtrends_scmp
	mat b = e(b)
	loc j = `i' - start_f + 1
	scalar b`j' = b[1, 3]
}

scalar list

replace histo = .
qui foreach i of num `=start_f'/`=end_f' {
	loc j = `i' - start_f + 1
	replace histo = scalar(b`j') if _n == `j'
}
label var histo "Coll action share coefficients, control"
hist histo
graph save fals_coll_c, replace

graph combine fals_lead.gph fals_xinhua.gph fals_coll.gph fals_lead_c.gph fals_xinhua_c.gph fals_coll_c.gph, cols(2)
graph export "Figures\fals_domestic.png", replace

graph drop _all
