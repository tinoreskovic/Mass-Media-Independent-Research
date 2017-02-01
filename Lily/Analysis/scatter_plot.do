clear all
** Program 1: Make scatter plots  ** 
global output "\Users\lshoffma\Google Drive\Mass Media\Lily\Output\"

use "${output}merged_radio_voting", clear
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
scatter total_station year, mlabel(total_station) ytitle("Total Stations") title("Total Broadcasting Stations by Year") connect(l) subtitle("Yearly Measurement: June 30th") saving("${output}scatter_total_stations.jpg", replace)
restore 

drop total_station year total_dma min_freq_dma
duplicates drop 
isid state county

hist first_dma, frequency ytitle("Total Counties") title("Year of First Broadcasting Station") xtitle("Year") subtitle("By DMA") saving("${output}hist_dma.jpg", replace)
hist first_county, frequency ytitle("Total Counties") title("Year of First Broadcasting Station") xtitle("Year") subtitle("By County") saving("${output}hist_county.jpg", replace)

** Table of mean by first year

preserve

collapse (sum) radiorep famtot, by(first_dma)
sort first_dma
gen percent_radio = radiorep/famtot
twoway scatter percent_radio first_dma, ysc(range(0 .5)) ylabel(0(.1).5) ytitle("Families Radio Ownership") xtitle("First Year Broadcasting in DMA") ///
 title("Family Radio Ownership by DMA First Broadcasting Year") subtitle("1930 Census") saving("${output}radio_ownership.jpg", replace)
restore

save "${ouput}panel_data", replace
