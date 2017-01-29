clear all
global input "/Users/lilyhoffman/Desktop/MMPaper/Input/"
global output "/Users/lilyhoffman/Desktop/MMPaper/Output/"
global temp "/Users/lilyhoffman/Desktop/MMPaper/Temp/"
global set "/Users/lilyhoffman/Desktop/MMPaper/Set_up/"


use ${output}merged_radio_voting, clear
** clean by outcome (voting) 
** elections: 
forvalues i = 4/401 {
drop V`i'
}
forvalues i = 511/759 {
drop V`i'
}
loc j = 1
foreach var in V402 V409 V418 V428 V434 V443 V452 V458 V468 V477 V483 V490 V498 V504 {
replace `var' = . if `var' > 100
replace `var' = . if `var' == 0 
rename `var' dem`j'
loc j = `j' + 1
}
loc k = 1
foreach var in V403 V410 V419 V429 V435 V444 V453 V459 V469 V478 V484 V491 V499 V505 {
replace `var' = . if `var' > 100
replace `var' = . if `var' == 0 
rename `var' rep`k'
loc k = `k' + 1
}
loc i = 1
foreach var in V408 V417 V427 V433 V442 V451 V457 V467 V476 V482 V489 V497 V503 V510 {
replace `var' = . if `var' > 100
replace `var' = . if `var' == 0 
rename `var' percent_vote`i'
loc i = `i' + 1
}


loc i = 1
foreach var in V407 V416 V426 V432 V441 V450 V456 V466 V475 V481 V488 V496 V502 V509 {
replace `var' = . if `var' == 9999999
replace `var' = . if `var' == 0 
rename `var' total_vote`i'
loc i = `i' + 1
}

drop V*
egen max_total_vote = rowmax(total_vote*) 
egen max_total_perc = rowmax(percent_vote*)
drop if missing(max_total_perc) & missing(max_total_vote) & station == ""
drop max_total_perc max_total_vote


replace frequency = . if frequency >= 99999
bys dmaindex year: egen min_freq_dma = min(frequency) 
bys dmaindex year: egen total_dma = total(total_station)

drop  station frequency
duplicates drop

preserve 
keep dmaindex year total_dma min_freq_dma
duplicates drop
 duplicates tag dmaindex year if !missing(year), gen(dups)
assert dups == 0  if !missing(dups)
drop dups 
save ${temp}frequency, replace
restore

bys dmaindex: egen first_dma = min(year)
bys dmaindex2: egen first_dma2 = min(year) 
replace first_dma = first_dma2 if first_dma2 < first_dma & !missing(dmaindex2) 
bys county state: egen first_county = min(year)

duplicates drop
preserve
drop if missing(year)
isid state year county
collapse (sum) total_station, by(year)
sort year
scatter total_station year, mlabel(total_station) ytitle("Total Stations") title("Total Broadcasting Stations by Year") connect(l) subtitle("Yearly Measurement: June 30th")
restore 

drop total_station year total_dma min_freq_dma
duplicates drop 
isid state county


preserve
hist first_dma, frequency ytitle("Total Counties") title("Year of First Broadcasting Station") xtitle("Year") subtitle("By DMA")
hist first_county, frequency ytitle("Total Counties") title("Year of First Broadcasting Station") xtitle("Year") subtitle("By County")
restore
/*
 gen percent_unemploy = unemptot/totpop
 lab var percent_unemploy "Percent Unemployed"
 
 gen percent_rural = rural30/totpop 
  sort percent_rural
  gen rural_order = _n if !missing(percent_rural)
 
 hist first_dma if rural_order < 978 
 
 hist first_dma if rural_order <= 978 & !missing(rural_order), frequency ytitle("Total Counties") title("Year of First Broadcasting Station") xtitle("Year") subtitle("By DMA: Lowest Third Rural")
 hist first_dma if rural_order > 978 & rural_order <= 1957 & !missing(rural_order)
 hist first_dma if rural_order > 1957 & !missing(rural_order), frequency ytitle("Total Counties") title("Year of First Broadcasting Station") xtitle("Year") subtitle("By DMA: Top Third Rural")
sum first_dma if rural_order <= 978 & !missing(rural_order)
display r(sd)^2
sum first_dma if  rural_order > 1957 & !missing(rural_order) & !missing(rural_order)
display r(sd)^2
 */
save ${temp}merged_first_year, replace
** Table of mean by first year


preserve

collapse (sum) radiorep famtot, by(first_dma)
sort first_dma
gen percent_radio = radiorep/famtot
twoway scatter percent_radio first_dma, ysc(range(0 .5)) ylabel(0(.1).5) ytitle("Families Radio Ownership") xtitle("First Year Broadcasting in DMA") title("Family Radio Ownership by DMA First Broadcasting Year") subtitle("1930 Census") 
restore

*** reshape for analysis 
loc year = "1916 1916 1918 1920 1920 1922 1924 1924 1926 1928 1928 1930 1932 1932"
loc pres = "10010010010010"

loc j = 1
forvalues i = 1/14 {
use ${temp}merged_first_year, clear
rename (dem`i' rep`i' total_vote`i' percent_vote`i') (Democrat Republican overall turnout)
drop dem* rep* total_vote* percent_vote*
gen presidential = substr("`pres'", `i', 1)
gen year= substr("`year'", `j', 4)
loc j = `j' + 5
save ${temp}part`i', replace
}

forvalues i = 1/13 {
append using ${temp}part`i'
}
destring year, replace
destring presidential, replace
assert !missing(year)


gen dma_ind = 1 if first_dma <= year & !missing(first_dma)
replace dma_ind = 0 if missing(dma_ind)
gen county_ind = 1 if first_county <= year & !missing(first_county) 
replace county_ind = 0 if missing(county_ind)
** merge to frequency during that year
merge m:1 dmaindex year using ${temp}frequency, keep(1 3) nogen

 

 bys year: egen president_year = max(presidential)
 
gen interest = dma_ind*(year-first_dma)
 replace interest = . if mi(dmaindex)

gen interest_county = county_ind*(year-first_county)
replace interest_county = 0 if county_ind ==0 
egen county_id = group(county state)
egen county_year = group(county_id year)
label var turnout "Overall Turnout" 

save ${output}analysis, replace


replace turnout = turnout/100

 merge m:1 county state using ${set}census_part1, keep(1 3) nogen keepusing(area urb930 totpop density area tillit10 totunemp whtot)
 gen percent_urban = urb930/totpop
 gen percent_nonwhite = 1-(whtot/totpop)
 gen percent_illit = tillit10/totpop
 gen percent_unemploy = totunemp/totpop
 gen log_pop = log(totpop)
label var log_pop "Log Population" 

preserve
collapse (sum) famtot totpop, by(year dma_ind)
sort year
keep if year >= 1920 & year <= 1930
replace totpop = totpop/1000000
twoway (scatter totpop year if dma_ind == 1) (scatter totpop year if dma_ind == 0), ytitle("Population Total (Millions)") ///
legend(order(1 "Broadcasting" 2 "No Broadcasting")) title("Same DMA Broadcasting Available to 1930 Population")

 restore

 ** Include absolute percentage differences between replubican and democrat percentages
 gen percent_rep = Republican/overall
 replace percent_rep = . if percent_rep > 1
 gen percent_dem = Democrat/overall 
 replace percent_dem = . if percent_dem > 1
 
 gen party_diff = abs(percent_rep - percent_dem) 
label var party_diff "Party Difference"

label var interest "Years Broadcasting"


gen interest_dma = interest_county if dma_ind == 1
count if dma_ind == 1 & county_ind == 0
assert dma_ind != 0 if county_ind ==1
lab var dma_ind "DMA Broadcasting"

gen interest_pres_county = interest_county*president_year
gen interest_pres = interest*president_year
label var interest_pres "Years Broadcasting * Presidential"

label var interest_pres_county "Pres. Interaction"
gen interest_sq = interest*interest
label var interest_sq "Quadratic Years Broadcasting"

gen county_sq = interest_county * interest_county

drop if (year < 1921 | year > 1931)

foreach var in  percent_urban percent_nonwhite log_pop party_diff{
gen inter_`var' = interest_county * `var'
gen dma_inter_`var' = interest* `var'
}


preserve
keep first_dma first_county county state_code percent_nonwhite percent_illit log_pop state
duplicates drop 
isid state county 
save ${temp}merge_newspaper, replace
restore

label var inter_percent_nonwhite "Percent Nonwhite"
label var inter_percent_urban "Percent Urban"
label var inter_log_pop "Log Population"
lab var interest_county "Years Broadcasting"
lab var turnout "Turnout"
label var interest_pres_county "Years Broadcasting * Presidential Year" 
label var dma_ind "DMA Broadcasting"
label var county_sq "Quadratic Years Broadcasting"
 label var president_year "Presidential Year"
 label var dma_inter_percent_urban "Percent Urban * Years Broadcasting"
 label var dma_inter_percent_nonwhite "Percent Nonwhite * Years Broadcasting" 
 label var dma_inter_log_pop "Log Population * Years Broadcasting" 
 

eststo: areg turnout interest_county i.year,   absorb(county_id) vce(cluster county_id)
eststo: areg turnout interest_county interest_pres_county president_year  i.year, absorb(county_id) vce(cluster county_id)
eststo: areg turnout interest_county interest_pres_county president_year party_diff county_sq i.year, absorb(county_id) vce(cluster county_id)


 esttab est1 est2 est3 using ${output}county.csv, label star se stats(ar2 N) replace drop(*.year) 


** Allowing heteregenoeity in time and years broadcasting by 
eststo: areg turnout interest_county i.year#c.percent_nonwhite i.year#c.percent_urban i.year#c.log_pop  i.year,   absorb(county_id) vce(cluster county_id)
eststo: areg turnout interest_county interest_pres_county president_year i.year#c.percent_nonwhite i.year#c.percent_urban i.year#c.log_pop  i.year, absorb(county_id) vce(cluster county_id)
eststo: areg turnout interest_county interest_pres_county president_year party_diff i.year#c.percent_nonwhite i.year#c.percent_urban i.year#c.log_pop  i.year, absorb(county_id) vce(cluster county_id)

** Interacted terms ** 

eststo: areg turnout interest_county interest_pres_county president_year party_diff inter_percent_urban i.year#c.percent_nonwhite i.year#c.percent_urban i.year#c.log_pop  i.year, absorb(county_id) vce(cluster county_id)
eststo: areg turnout interest_county interest_pres_county president_year party_diff inter_percent_nonwhite i.year#c.percent_nonwhite i.year#c.percent_urban i.year#c.log_pop  i.year, absorb(county_id) vce(cluster county_id)
eststo: areg turnout interest_county interest_pres_county president_year party_diff inter_log_pop i.year#c.percent_nonwhite i.year#c.percent_urban i.year#c.log_pop  i.year, absorb(county_id) vce(cluster county_id)

 esttab est4 est5 est7 est8 est9  using ${output}county_2.csv, label star se stats(ar2 N) replace drop(*.year *c.*) 




** DMA indicators
 
 eststo: areg turnout interest i.year, absorb(county_id) vce(cluster county_id)
  eststo: areg turnout interest interest_pres president_year i.year, absorb(county_id) vce(cluster county_id)
  eststo: areg turnout interest interest_pres president_year party_diff interest_sq i.year, absorb(county_id) vce(cluster county_id)
esttab est10 est11 est12 using ${output}dma_reg.csv, label star se stats(ar2 N) replace  drop(*.year)
  
 eststo: areg turnout interest i.year#c.percent_urban i.year#c.log_pop i.year , absorb(county_id) vce(cluster county_id)
  eststo: areg turnout interest interest_pres president_year i.year#c.percent_urban i.year#c.log_pop i.year, absorb(county_id) vce(cluster county_id)
  eststo: areg turnout interest interest_pres president_year interest_sq i.year#c.percent_urban i.year#c.log_pop i.year, absorb(county_id) vce(cluster county_id)
    eststo: areg turnout interest interest_pres president_year interest_sq dma_inter_percent_urban i.year#c.percent_urban i.year#c.log_pop i.year, absorb(county_id) vce(cluster county_id)
	    eststo: areg turnout interest interest_pres president_year interest_sq dma_inter_percent_nonwhite i.year#c.percent_urban i.year#c.log_pop i.year, absorb(county_id) vce(cluster county_id)
		    eststo: areg turnout interest interest_pres president_year interest_sq dma_inter_log_pop i.year#c.percent_urban i.year#c.log_pop i.year, absorb(county_id) vce(cluster county_id)

 esttab est13 est13 est14 est15 est16 est17 est18  using ${output}dma_reg_inter.csv, label star se stats(ar2 N) replace drop(*.year *c.*) 

 
 ********* Lag coefficients ************* 
 cap program drop lag_coeff
 program lag_coeff 
 
 syntax, variable(string)  reg_var(varlist) title(string) figure(string)
 
 gen interest_0 = (year-`variable')==0 
 gen interest_1 = (year-`variable') ==1
  gen interest_2 = (year-`variable') == 2
 
 

gen interest_minus1 = (year-`variable') == -1
gen interest_minus2 = (year-`variable') == -2

eststo: areg  turnout interest_minus2 interest_minus1 interest_0  interest_1 interest_2  `reg_var' i.year#c.percent_nonwhite i.year#c.percent_urban i.year#c.log_pop i.year, absorb(county_id) vce(cluster county_id)
predict prediction, xb

gen interest_axis = year-`variable'


 mat define b = e(b)
 gen coeff = . 
 
 loc j = 1
 forvalues i = -2/2 {
 replace coeff = b[1,`j'] if interest_axis == `i'
	loc j = `j' + 1
	}
sort interest_axis
scatter coeff interest_axis if abs(interest_axis) <= 2, title("Figure `figure': Graph of Lag Coefficients: `title' Level") xtitle("Time Since Broadcasting Introduced (years)") ytitle("Voting Turnout") connect(l)
 
 drop interest_0 interest_1 interest_2 interest_minus* coeff prediction interest_axis 
 
 end
 
 lag_coeff, variable(first_county) reg_var(president_year party_diff ) title(County) figure(10) 

 lag_coeff, variable(first_dma) reg_var(president_year party_diff) title(DMA) figure(11) 
 ** Now do this for county level ** 
 
 

save ${output}final_analysis, replace 

* 
