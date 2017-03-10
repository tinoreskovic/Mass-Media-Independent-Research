clear all

log using  "/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/logfiles/8_analysis", replace

global input "~/Google Drive/Mass Media/Lily/Data/"
global temp "~/Google Drive/Mass Media/Lily/Temp/"
global output "~/Google Drive/Mass Media/Lily/Output/"


use "${output}analysis_part2", clear
drop if year > 1932
drop if year < 1920


areg turnout i.year#i.group i.year, absorb(county_id)
predict county_predict, xb
collapse (mean) county_predict, by(year group president_year) 

sort year
twoway (scatter county_predict year if group == 1 & president_year ==1, connect(l)) ///
(scatter county_predict year if group == 2 & president_year ==1, connect(l)) ///
(scatter county_predict year if group == 3 & president_year ==1, connect(l)), ///
 legend(label(1 "Radio: 1922-1923")  label(2 "Radio: 1924-1931") label(3 "Radio: 1932 onward")) title("County: Predicted Turnout") subtitle("Presidential Year") ytitle("Mean Linear Prediction") ///
 note("Controlling for year, group, and year-group interactions")
 
 twoway (scatter county_predict year if group == 1 & president_year ==0 , connect(l)) ///
(scatter county_predict year if group == 2 & president_year ==0, connect(l)) ///
(scatter county_predict year if group == 3 & president_year ==0, connect(l)), ///
 legend(label(1 "Group 1")  label(2 "Group 2") label(3 "Group 3")) title("County: Predicted Turnout") subtitle("Non-Presidential Year") ytitle("Mean Linear Prediction") ///
 note("Controlling for year, group, and year-group interactions")
 
restore 
	
***************

		
		
	gen type_election = 1 if presidential == 1 
	replace type_election = 2 if presidential ==0 & president_year == 1
	replace type_election = 3 if president_year == 0 
		
gen pseudo_turnout = turnout if year <= first_county
		bys county_id type_election: egen max_year = max(year) if !mi(pseudo_turnout) & !mi(first_county)
		gen previous_year = turnout if year == max_year
	
	bys county_id type: egen max_type = max(previous_year)
	replace previous_year = max_type
	
	replace pseudo_turnout = (1.032) *previous_year if mi(pseudo_turnout) & !mi(first_county)
		
		reg pseudo_turnout i.year##i.group
		predict pseudo_turn, xb
		
		preserve
		
				collapse (mean) pseudo_turn, by(year president_year group)


		sort year
		twoway (scatter pseudo_turn year if group == 1 & president_year == 1 & year < 1936,   xline(1922) xline(1929) connect(l))  (scatter pseudo_turn year if group == 2 &  president_year == 1 & year < 1936, connect(l)) ///
		(scatter pseudo_turn year if group == 3 &  president_year == 1 & year < 1936, connect(l)), ///
		legend(label(1 "Group 1") label(2 "Group 2") label(3 "Group 2")) title("Turnout: Presidential Election Year") ytitle("Percent Turnout (Mean Linear Prediction)") 
		
		twoway (scatter pseudo_turn year if group == 1 & president_year == 0 & year < 1936,   xline(1922) xline(1929) connect(l))  (scatter pseudo_turn year if group == 2 &  president_year == 0 & year < 1936, connect(l)) ///
		(scatter pseudo_turn year if group == 3 &  president_year == 0 & year < 1936, connect(l)), ///
		legend(label(1 "Group 1") label(2 "Group 2") label(3 "Group 3")) title("Turnout: Non-Presidential Election Year") ytitle("Percent Turnout (Mean Linear Prediction)") 
		
		restore
		

	
	****** For new grouping : By actual county **** 
	
	preserve 
	
reg turnout i.year##i.group

		predict turnout_actual, xb	
		
		drop if year < 1918
		
		collapse (mean) turnout_actual, by(year president_year group)
		sort year
	
		
		twoway (scatter turnout_actual year if group == 1 & president_year == 1 & year < 1936,   xline(1922) xline(1929) connect(l))  (scatter turnout_actual year if group == 2 &  president_year == 1 & year < 1936, connect(l)), ///
		legend(label(1 "Radio: 1922-1928") label(2 "Radio: 1929-onward")) title("Turnout: Presidential Election Year") ytitle("Percent Turnout (Mean Linear Prediction)") 
		
		twoway (scatter turnout_actual year if group == 1 & president_year == 0 & year < 1936,   xline(1922) xline(1929) connect(l))  (scatter turnout_actual year if group == 2 &  president_year == 0 & year < 1936, connect(l)), ///
		legend(label(1 "Radio: 1922-1928") label(2 "Radio: 1929-onward")) title("Turnout: Non-Presidential Election Year") ytitle("Percent Turnout (Mean Linear Prediction)") 
		
		
		restore
