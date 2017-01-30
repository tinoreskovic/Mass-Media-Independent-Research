
clear all
global input "/Users/lilyhoffman/Desktop/MMPaper/Input/"
global output "/Users/lilyhoffman/Desktop/MMPaper/Output/"
global temp "/Users/lilyhoffman/Desktop/MMPaper/Temp/"
global set "/Users/lilyhoffman/Desktop/MMPaper/Set_up/"


*****************************************************
use "C:\Users\lshoffma\Google Drive\Mass Media\Lily\Data\family_census_1930.dta", clear

keep fips state_code county 
drop if missing(fips)
isid fips
save ${temp}fips_county_crosswalk, replace
*********************************************
*********************
use "/Users/lilyhoffman/Desktop/MMPaper/Input/newspaper_circulation.dta", clear
merge m:1 CITYPERMID using "/Users/lilyhoffman/Desktop/MMPaper/Input/newspaper_city.dta", keep(3) nogen assert(3) 
merge m:1 CITYPERMID using   "/Users/lilyhoffman/Desktop/MMPaper/Input/newspaper_city.dta", keep(3) nogen
isid CITYPERMID YEAR

rename *, lower
keep citypermid year icitypop numdailies circ circ_polaff_r circ_polaff_d ///
cityname_constant cnty90 state state cityname_constant miss_circ


rename cityname_constant city
rename cnty90 fips


foreach var in city state {
replace `var' = lower(`var')
}

keep if year >= 1916 & year <= 1960
drop if state == "alaska"| state == "hawaii"

merge m:1 fips using ${temp}fips_county_crosswalk

replace county = "ormsby"  if _merge == 1 & city == "carson city"
replace state_code = 65  if _merge == 1 & city == "carson city"
replace county = "fairfax" if _merge ==1 & city == "carson city"
replace state_code = 40 if _merge ==1 & city == "carson city"
replace county = "wise" if _merge == 1 & city == "norton"
replace state_code = 40 if _merge ==1 & city == "norton"
replace county = "esmeralda" if _merge ==1 & city == "goldfield"
replace state_code = 65 if _merge ==1 & city == "goldfield"

drop if missing(state_code)
drop if _merge ==2 
drop _merge

 isid county year state citypermid
 
merge m:1 state_code county using ${temp}merge_newspaper

keep if _merge == 3
drop _merge

isid state county year citypermid
assert !mi(citypermid)
save ${output}circulation_analysis, replace
*** Analysis *** 
keep if year > 1920 & year < 1932

egen county_id = group(county state_code)
drop if mi(first_county) 

gen county_year = (year-first_county) if year > first_county
replace county_year = 0 if mi(county_year)

gen circ_pop = (circ/icitypop)*1000
gen log_pop_city = log(icitypop)
label var circ_pop "Circulation Per 1000 People" 

gen log_newspaper = log(numdailies)


gen county_sq = county_year * county_year

gen circ_diff = abs(circ_polaff_d-circ_polaff_r)/icitypop
gen log_num = log(numdailies)

foreach var in percent_nonwhite percent_illit {
gen inter_`var' = county_year * `var'
}

lab var county_year "Years Broadcasting"
lab var county_sq "Quadratic Years Broadcasting"
lab var circ_diff "Party Difference Circulation Per 1000 People" 
lab var log_num "Log Number Newspapers"
lab var county_sq "Quadratic Years Broadcasting"

eststo: areg circ_pop county_year i.year, absorb(county_id) vce(cluster county_id)
eststo: areg circ_pop county_year county_sq circ_diff i.year, absorb(county_id) vce(cluster county_id)
eststo: areg circ_pop county_year county_sq circ_diff log_num i.year, absorb(county_id) vce(cluster county_id)

eststo: areg circ_pop county_year county_sq circ_diff log_num log_pop_city i.year#c.percent_nonwhite i.year#c.percent_illit i.year#c.log_pop_city i.year, absorb(county_id) vce(cluster county_id)


esttab est1  est2 est3 using ${output}circ_news.csv, label star se stats(ar2 N) replace noconstant drop(*.year)

keep citypermid first_county
duplicates drop


