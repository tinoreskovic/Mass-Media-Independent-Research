clear
capture cd "C:\Users\awjia\Google Drive\Mass-Media-Independent-Research\Andrew\"
capture cd "C:\Users\Andrew\Google Drive\Mass-Media-Independent-Research\Andrew\"
set more off

import delimited using "Derived\SCMP_data.csv"
qui sum
scalar month_count = r(N)

gen scmp = 1
save "Analysis\Data.dta", replace
import delimited using "Derived\STD_data.csv", clear
append using "Analysis\Data.dta"
replace scmp = 0 if scmp == .
gen month = _n - 1 if scmp == 0
replace month = _n - month_count - 1 if scmp == 1
save "Analysis\Data.dta", replace

import delimited using "Derived\gtrends.csv", varn(nonames) asfloat clear
ren (v1 v2) (month gtrends)
merge 1:m month using "Analysis\Data.dta"
drop _merge
save "Analysis\Data.dta", replace

import delimited using "Derived\alexa_hket.csv", varn(nonames) asfloat clear
ren (v1 v2) (month alexa)
merge 1:m month using "Analysis\Data.dta"
drop _merge

ren (v1 v2 v3 v4 v5) (xinhua_count coll_count lead_count count acq)
gen acq_scmp = scmp*acq
gen xinhua_share = xinhua_count / count
gen coll_share = coll_count / count
gen lead_share = lead_count / count

sort scmp month
save "Analysis\Data.dta", replace

*regressions
*scmp (prestige/resources) interacted with eventfulness
bysort scmp: egen av_alexa = mean(alexa)
gen dev_alexa = -(alexa-av_alexa)/av_alexa
gen dev_alexa_scmp = dev_alexa * scmp
gen gtrends_scmp = gtrends * scmp

save "Analysis\Data.dta", replace

egen offset = min(month) if acq == 1
qui sum offset
replace offset = r(mean)
replace month = month - offset
drop offset

capture cd "C:\Users\awjia\Google Drive\Mass-Media-Independent-Research\Andrew\Analysis"
capture cd "C:\Users\Andrew\Google Drive\Mass-Media-Independent-Research\Andrew\Analysis"

*lead
eststo clear

reg lead_share scmp acq acq_scmp, vce(robust)
eststo

reg lead_share scmp acq acq_scmp dev_alexa_scmp, vce(robust)
eststo

reg lead_share scmp acq acq_scmp gtrends_scmp, vce(robust)
eststo

*xh

reg xinhua_share scmp acq acq_scmp, vce(robust)
eststo

reg xinhua_share scmp acq acq_scmp dev_alexa_scmp, vce(robust)
eststo

reg xinhua_share scmp acq acq_scmp gtrends_scmp, vce(robust)
eststo

*coll

reg coll_share scmp acq acq_scmp, vce(robust)
eststo

reg coll_share scmp acq acq_scmp dev_alexa_scmp, vce(robust)
eststo

reg coll_share scmp acq acq_scmp gtrends_scmp, vce(robust)
eststo

esttab using "reg.rtf", replace compress ci r2
esttab, se r2

sum lead_share xinhua_share coll_share if month < 9
************************************************
twoway (line lead_share month if scmp == 1) (line lead_share month if scmp == 0)
graph export "lead_share.png", replace
twoway (line xinhua_share month if scmp == 1) (line xinhua_share month if scmp == 0)
graph export "xinhua_share.png", replace
twoway (line coll_share month if scmp == 1) (line coll_share month if scmp == 0)
graph export "coll_share.png", replace

foreach control of varlist dev_alexa_scmp gtrends_scmp {
	reg lead_share `control'
	predict lead_net, re
	reg xinhua_share `control'
	predict xinhua_net, re
	reg coll_share `control'
	predict coll_net, re

	twoway (line lead_net month if scmp == 1) (line lead_net month if scmp == 0)
	graph export `"lead_share_`control'.png"', replace
	twoway (line xinhua_net month if scmp == 1) (line xinhua_net month if scmp == 0)
	graph export `"xinhua_share_`control'.png"', replace
	twoway (line coll_net month if scmp == 1) (line coll_net month if scmp == 0)
	graph export `"coll_share_`control'.png"', replace
	drop lead_net
	drop xinhua_net
	drop coll_net
	}

*falsification

gen acq_f = 0
gen acq_scmp_f = 0
gen histo = .

*falsification for leader
forvalues i = 2/14 {
	replace acq_f = 0
	replace acq_f = 1 if month >= `i'
	replace acq_scmp_f = 0
	replace acq_scmp_f = acq_f * scmp
	reg lead_share scmp acq_f acq_scmp_f
	mat b = e(b)
	scalar b`i' = b[1, 3]
}

scalar list

replace histo = .
qui forval i = 2/14 {
	replace histo = scalar(b`i') if _n == `i'
}
label var histo "Leader share coefficients"
hist histo
graph save fals_lead, replace
*with controls
forvalues i = 2/14 {
	replace acq_f = 0
	replace acq_f = 1 if month >= `i'
	replace acq_scmp_f = 0
	replace acq_scmp_f = acq_f * scmp
	reg lead_share scmp acq_f acq_scmp_f dev_alexa_scmp
	mat b = e(b)
	scalar b`i' = b[1, 3]
}

scalar list

replace histo = .
qui forval i = 2/14 {
	replace histo = scalar(b`i') if _n == `i'
}
label var histo "Leader share coefficients, with control"
hist histo
graph save fals_lead_c, replace

*falsification for xinhua
forvalues i = 2/14 {
	replace acq_f = 0
	replace acq_f = 1 if month >= `i'
	replace acq_scmp_f = 0
	replace acq_scmp_f = acq_f * scmp
	reg xinhua_share scmp acq_f acq_scmp_f
	mat b = e(b)
	scalar b`i' = b[1, 3]
}

scalar list

replace histo = .
qui forval i = 2/14 {
	replace histo = scalar(b`i') if _n == `i'
}
label var histo "Xinhua share coefficients"
hist histo
graph save fals_xinhua, replace
*with controls
forvalues i = 2/14 {
	replace acq_f = 0
	replace acq_f = 1 if month >= `i'
	replace acq_scmp_f = 0
	replace acq_scmp_f = acq_f * scmp
	reg xinhua_share scmp acq_f acq_scmp_f dev_alexa_scmp
	mat b = e(b)
	scalar b`i' = b[1, 3]
}

scalar list

replace histo = .
qui forval i = 2/14 {
	replace histo = scalar(b`i') if _n == `i'
}
label var histo "Xinhua share coefficients, with control"
hist histo
graph save fals_xinhua_c, replace


*falsification for coll
forvalues i = 2/14 {
	replace acq_f = 0
	replace acq_f = 1 if month >= `i'
	replace acq_scmp_f = 0
	replace acq_scmp_f = acq_f * scmp
	qui reg coll_share scmp acq_f acq_scmp_f
	mat b = e(b)
	scalar b`i' = b[1, 3]
}

scalar list

replace histo = .
qui forval i = 2/14 {
	replace histo = scalar(b`i') if _n == `i'
}
label var histo "Coll action share coefficients"
hist histo
graph save fals_coll, replace
forvalues i = 2/14 {
	replace acq_f = 0
	replace acq_f = 1 if month >= `i'
	replace acq_scmp_f = 0
	replace acq_scmp_f = acq_f * scmp
	qui reg coll_share scmp acq_f acq_scmp_f
	mat b = e(b)
	scalar b`i' = b[1, 3]
}

scalar list

replace histo = .
qui forval i = 2/14 {
	replace histo = scalar(b`i') if _n == `i'
}
label var histo "Coll action share coefficients, with control"
hist histo
graph save fals_coll_c, replace

graph combine fals_lead.gph fals_xinhua.gph fals_coll.gph fals_lead_c.gph fals_xinhua_c.gph fals_coll_c.gph
graph export "fals.png", replace

graph drop _all
