capture cd "C:\Users\awjia\OneDrive\Documents\School\2016-2017\Fall 2016\ECON 1400\HW\Project\V2"
capture cd "C:\Users\Andrew\OneDrive\Documents\School\2016-2017\Fall 2016\ECON 1400\HW\Project\V2"
import excel "DataStata.xlsx", sheet("Sheet1") firstrow clear case(lower)
set more off

*replace acq = 0
*replace acq = 1 if month >= 5

gen scmp = 0
replace scmp = 1 if outlet == "SCMP"
gen acq_scmp = scmp*acq

*regressions
*scmp (prestige/resources) interacted with eventfulness
bysort outlet: egen av_alexa = mean(alexa)
gen dev_alexa = -(alexa-av_alexa)/av_alexa
gen dev_alexa_scmp = dev_alexa * scmp

*lead
eststo clear

reg lead_share scmp acq acq_scmp, vce(robust)
eststo

reg lead_share scmp acq acq_scmp dev_alexa_scmp, vce(robust)
eststo

*xh

reg xinhua_share scmp acq acq_scmp, vce(robust)
eststo

reg xinhua_share scmp acq acq_scmp dev_alexa_scmp, vce(robust)
eststo

*coll

reg coll_share scmp acq acq_scmp, vce(robust)
eststo

reg coll_share scmp acq acq_scmp dev_alexa_scmp, vce(robust)
eststo

esttab using "Output/reg.rtf", replace compress ci r2
esttab, se r2

sum lead_share xinhua_share coll_share if month < 9
************************************************
reg lead_share dev_alexa_scmp
predict lead_net, re
reg xinhua_share dev_alexa_scmp
predict xinhua_net, re
reg coll_share dev_alexa_scmp
predict coll_net, re

sort outlet month

twoway (line lead_net month if scmp == 1) (line lead_net month if scmp == 0)
twoway (line xinhua_net month if scmp == 1) (line xinhua_net month if scmp == 0)
twoway (line coll_net month if scmp == 1) (line coll_net month if scmp == 0)


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
hist histo, saving(fals_lead)
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
hist histo, saving(fals_lead_c)

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
hist histo, saving(fals_xinhua)
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
hist histo, saving(fals_xinhua_c)


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
hist histo, saving(fals_coll)
*graph save "Output/fals_coll", replace
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
hist histo, saving(fals_coll_c)

graph combine fals_lead.gph fals_xinhua.gph fals_coll.gph fals_lead_c.gph fals_xinhua_c.gph fals_coll_c.gph
graph export "Output/fals.png", replace

graph drop _all
