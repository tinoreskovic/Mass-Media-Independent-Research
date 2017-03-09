clear all
** Program 5: makes scatter plots and save in github 
log using  "/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/logfiles/5_scatter_plot", replace
cd "~/Google Drive/Mass Media/Lily/Output/"
global output "~/Google Drive/Mass Media/Lily/Output/"

use "${output}merged_radio_voting", clear
** clean by outcome (voting) 
** elections: 
forvalues i = 4/369 {
	drop V`i'
	}	
forvalues i = 604/759 {
	drop V`i'
	}
loc j = 1
foreach var in V370 V378 V385 V393 V402 V409 V418 V428 V434 V443 V452 V458 V468 V477 V483 V490 V498 V504 ///
		V511 V521 V527 V536 V546 V552 V559 V567 V573 V580 V586 V593 V599 {
	replace `var' = . if `var' > 100
	replace `var' = . if `var' == 0 
	rename `var' dem`j'
	loc j = `j' + 1
	}
loc k = 1
foreach var in V371 V379 V386 V394 V403 V410 V419 V429 V435 V444 V453 V459 V469 V478 V484 V491 V499 V505 ///
	V512 V522 V528 V537 V547 V553 V560 V568 V574 V581 V587 V594 V600 {
	replace `var' = . if `var' > 100
	replace `var' = . if `var' == 0 
	rename `var' rep`k'
	loc k = `k' + 1
	}
loc i = 1
foreach var in  V377 V384 V390 V401 V408 V417 V427 V433 V442 V451 V457 V467 V476 V482 V489 V497 V503 V510 ///
	V520 V526 V535 V545 V551 V558  V566 V572 V579 V585 V592 V598 V603 {
	replace `var' = . if `var' > 100
	replace `var' = . if `var' == 0 
	rename `var' percent_vote`i'
	loc i = `i' + 1
	}

loc i = 1
foreach var in V376 V383 V391 V400  V407 V416 V426 V432 V441 V450 V456 V466 V475 V481 V488 V496 V502 V509 ///
		V519 V525 V534 V544 V550 V557 V565 V571 V578 V584 V591 V597 V602 {
	replace `var' = . if `var' == 9999999
	replace `var' = . if `var' == 0 
	rename `var' total_vote`i'
	loc i = `i' + 1
	}

drop V*
egen max_total_vote = rowmax(total_vote*) 
egen max_total_perc = rowmax(percent_vote*)
drop if missing(max_total_perc) & missing(max_total_vote) 
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
scatter total_station year, mlabel(total_station) ytitle("Total Stations") title("Total Broadcasting Stations by Year") connect(l) subtitle("Yearly Measurement: June 30th") saving("/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/plots/total_stations", replace)
restore 

drop total_station year total_dma min_freq_dma
duplicates drop 
isid state county

hist first_dma, frequency ytitle("Total Counties") title("Year of First Broadcasting Station") xtitle("Year") subtitle("By DMA") saving("/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/plots/hist_dma", replace)
hist first_county, frequency ytitle("Total Counties") title("Year of First Broadcasting Station") xtitle("Year") subtitle("By County") saving("/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/plots/hist_county", replace)

** Table of mean by first year
restore 

preserve

collapse (sum) radiorep famtot, by(first_dma)
sort first_dma
gen percent_radio = radiorep/famtot
twoway scatter percent_radio first_dma, ysc(range(0 .5)) ylabel(0(.1).5) ytitle("Families Radio Ownership") xtitle("First Year Broadcasting in DMA") ///
 title("Family Radio Ownership by DMA First Broadcasting Year") subtitle("1930 Census") saving("/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/plots/radio_ownership_dma", replace)
restore

preserve
collapse (sum) radiorep famtot, by(first_county)
sort first_county
gen percent_radio = radiorep/famtot
twoway scatter percent_radio first_county, ysc(range(0 .5)) ylabel(0(.1).5) ytitle("Families Radio Ownership") xtitle("First Year Broadcasting in County") ///
 title("Family Radio Ownership by County First Broadcasting Year") subtitle("1930 Census") saving("/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/plots/radio_ownership_county", replace)
restore

save "${ouput}panel_data", replace

log close
