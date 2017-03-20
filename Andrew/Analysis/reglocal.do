clear
capture cd "C:\Users\Andrew\Dropbox\Research\SCMP\Mass_Media\Andrew\"
capture cd "C:\Users\awjia\Dropbox\Research\SCMP\Mass_Media\Andrew\"
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

/*
import delimited using "Derived\alexa_hket.csv", varn(nonames) asfloat clear
ren (v1 v2) (month alexa)
merge 1:m month using "Analysis\Data_domestic.dta"
drop _merge
*/

ren (v1 v2 v3 v4 v5) (xinhua_count coll_count lead_count count acq)
gen acq_scmp = scmp*acq
gen xinhua_share = xinhua_count / count
gen coll_share = coll_count / count
gen lead_share = lead_count / count

sort scmp month
save "Analysis\Data_domestic.dta", replace

*regressions

/*
bysort scmp: egen av_alexa = mean(alexa)
gen dev_alexa = -(alexa-av_alexa)/av_alexa
gen dev_alexa_scmp = dev_alexa * scmp
*/

gen gtrends_scmp = gtrends * scmp

egen offset = min(month) if acq == 1
qui sum offset
replace offset = r(mean)
replace month = month - offset
drop offset

label var scmp "SCMP"
label var acq "Acquired"
label var acq_scmp "Acquired * SCMP"
label var gtrends_scmp "SCMP * Google Trends"

save "Analysis\Data_domestic.dta", replace

capture cd "C:\Users\Andrew\Dropbox\Research\SCMP\Mass_Media\Andrew\Analysis"
capture cd "C:\Users\awjia\Dropbox\Research\SCMP\Mass_Media\Andrew\Analysis"

*lead
eststo clear

reg lead_share scmp acq acq_scmp, vce(robust)
eststo lead1

reg lead_share scmp acq acq_scmp gtrends_scmp, vce(robust)
eststo lead2

*xh

reg xinhua_share scmp acq acq_scmp, vce(robust)
eststo xh1

reg xinhua_share scmp acq acq_scmp gtrends_scmp, vce(robust)
eststo xh2

*coll

reg coll_share scmp acq acq_scmp, vce(robust)
eststo coll1

reg coll_share scmp acq acq_scmp gtrends_scmp, vce(robust)
eststo coll2

capture esttab lead1 lead2 using "C:\Users\Andrew\Google Drive\Mass Media\Andrew\Tables\domestic_lead.tex", replace compress se r2 label title(Domestic Results: Leader Share) width(0.75\textwidth)
capture esttab lead1 lead2 using "C:\Users\awjia\Google Drive\Mass Media\Andrew\Tables\domestic_lead.tex", replace compress se r2 label title(Domestic Results: Leader Share) width(0.75\textwidth)

capture esttab xh1 xh2 using "C:\Users\Andrew\Google Drive\Mass Media\Andrew\Tables\domestic_xh.tex", replace compress se r2 label title(Domestic Results: Xinhua Share) width(0.75\textwidth)
capture esttab xh1 xh2 using "C:\Users\awjia\Google Drive\Mass Media\Andrew\Tables\domestic_xh.tex", replace compress se r2 label title(Domestic Results: Xinhua Share) width(0.75\textwidth)

capture esttab coll1 coll2 using "C:\Users\Andrew\Google Drive\Mass Media\Andrew\Tables\domestic_coll.tex", replace compress se r2 label title(Domestic Results: Collective Action Share) width(0.75\textwidth)
capture esttab coll1 coll2 using "C:\Users\awjia\Google Drive\Mass Media\Andrew\Tables\domestic_coll.tex", replace compress se r2 label title(Domestic Results: Collective Action Share) width(0.75\textwidth)

esttab using "domestic.rtf", replace compress se r2 label
************************************************
sort month

twoway (line lead_share month if scmp == 1) (line lead_share month if scmp == 0)
graph export "lead_share_domestic.png", replace
twoway (line xinhua_share month if scmp == 1) (line xinhua_share month if scmp == 0)
graph export "xinhua_share_domestic.png", replace
twoway (line coll_share month if scmp == 1) (line coll_share month if scmp == 0)
graph export "coll_share_domestic.png", replace

/*
foreach control of varlist gtrends_scmp {
	reg lead_share `control'
	predict lead_net, re
	reg xinhua_share `control'
	predict xinhua_net, re
	reg coll_share `control'
	predict coll_net, re

	twoway (line lead_net month if scmp == 1) (line lead_net month if scmp == 0), legend(label(1 "SCMP") label(2 "STD"))
	graph export `"lead_share_`control'_domestic.png"', replace
	twoway (line xinhua_net month if scmp == 1) (line xinhua_net month if scmp == 0), legend(label(1 "SCMP") label(2 "STD"))
	graph export `"xinhua_share_`control'_domestic.png"', replace
	twoway (line coll_net month if scmp == 1) (line coll_net month if scmp == 0), legend(label(1 "SCMP") label(2 "STD"))
	graph export `"coll_share_`control'_domestic.png"', replace
	drop lead_net
	drop xinhua_net
	drop coll_net
	}
*/
******************************falsification*************************************

qui sum month
scalar def start_f = r(min) + 1
scalar def end_f = r(max) - 1

gen acq_f = 0
gen acq_scmp_f = 0
gen histo = .

*falsification for leader
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

*falsification for xinhua
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

*falsification for coll
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

graph combine fals_lead.gph fals_xinhua.gph fals_coll.gph fals_lead_c.gph fals_xinhua_c.gph fals_coll_c.gph
graph export "fals_domestic.png", replace

graph drop _all
