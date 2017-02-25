** Run regressions for radio analysis ** 
clear all

log using  "/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/logfiles/6_set_up_analysis", replace

global input "~/Google Drive/Mass Media/Lily/Data/"
global temp "~/Google Drive/Mass Media/Lily/Temp/"
global output "~/Google Drive/Mass Media/Lily/Output/"


*** reshape for analysis 
loc year = "1910 1912 1912 1914 1916 1916 1918 1920 1920 1922 1924 1924 1926 1928 1928 1930 1932 1932 1934 1936 1936 1938 1940 1940 1942 1944 1944 1946 1948 1948 1950"
loc pres = "0100100100100100100100100100100"


loc j = 1
forvalues i = 1/31 {
 use "${output}panel_data.dta", clear
 rename (dem`i' rep`i' total_vote`i' percent_vote`i') (Democrat Republican overall turnout)
drop dem* rep* total_vote* percent_vote*
gen presidential = substr("`pres'", `i', 1)
gen year= substr("`year'", `j', 4)
loc j = `j' + 5

save "${temp}part`i'", replace
}

	forvalues i = 1/30 {
		append using "${temp}part`i'"
	}
	destring year, replace
	destring presidential, replace
	assert !missing(year)

gen dma_ind = 1 if first_dma <= year & !missing(first_dma)
replace dma_ind = 0 if missing(dma_ind)
gen county_ind = 1 if first_county <= year & !missing(first_county) 
replace county_ind = 0 if missing(county_ind)

** Create variables of interest ***  
bys year: egen president_year = max(presidential)
 
	gen interest = dma_ind*(year-first_dma)
	replace interest = . if mi(dmaindex)

gen interest_county = county_ind*(year-first_county)
replace interest_county = 0 if county_ind ==0 
egen county_id = group(county state)
egen county_year = group(county_id year)
label var turnout "Overall Turnout" 

save "${output}analysis", replace

replace turnout = turnout/100

 merge m:1 county state using "${input}census_part1", keep(1 3) nogen keepusing(area urb930 totpop density area tillit10 totunemp whtot)
 gen percent_urban = urb930/totpop
 gen percent_nonwhite = 1-(whtot/totpop)
 gen percent_illit = tillit10/totpop
 gen percent_unemploy = totunemp/totpop
 gen log_pop = log(totpop)
label var log_pop "Log Population" 

preserve
keep famtot totpop year dma_ind county state
duplicates drop
isid year county state
bys year: egen total_pop  = sum(totpop)
qui sum total_pop
assert r(min) == r(max) 
loc j= r(min)
collapse (sum) famtot totpop, by(year dma_ind)
keep if dma_ind == 1
keep if year >= 1920 & year <= 1930
gen percentage_broad = totpop/`j'*100
sort year
loc i = round(`j'/1000000)
scatter  percentage_broad year, title("Same DMA Broadcasting") subtitle("Total Population `i' Million") ytitle("Percentage of Population") connect(l) ysc(range(0 100)) ylabel(0(10)100) ///
title("Same DMA Broadcasting Available to 1930 Population") saving("/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/plots/scatter_population_access", replace) 
restore

preserve
keep famtot totpop year county_ind county state
duplicates drop
isid year county state
bys year: egen total_pop  = sum(totpop)
qui sum total_pop
assert r(min) == r(max) 
loc j= r(min)
collapse (sum) famtot totpop, by(year county_ind)
keep if county_ind == 1
keep if year >= 1920 & year <= 1930
gen percentage_broad = totpop/`j'*100
sort year
loc i = round(`j'/1000000)
scatter  percentage_broad year, title("Same County Broadcasting") subtitle("Total Population `i' Million") ytitle("Percentage of Population") connect(l) ysc(range(0 100)) ylabel(0(10)100) ///
title("Same County Broadcasting Available to 1930 Population") saving("/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/plots/scatter_population_county_access", replace) 
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

///drop if (year < 1921 | year > 1931)

foreach var in  percent_urban percent_nonwhite log_pop party_diff{
gen inter_`var' = interest_county * `var'
gen dma_inter_`var' = interest* `var'
}


preserve
keep first_dma first_county county state_code percent_nonwhite percent_illit log_pop state
duplicates drop 
isid state county 
save "${temp}merge_newspaper", replace
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
 


 save "${output}analysis_setup", replace
 
 
