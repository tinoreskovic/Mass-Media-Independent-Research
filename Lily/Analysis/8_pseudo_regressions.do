clear all

log using  "/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/logfiles/8_analysis", replace

global input "~/Google Drive/Mass Media/Lily/Data/"
global temp "~/Google Drive/Mass Media/Lily/Temp/"
global output "~/Google Drive/Mass Media/Lily/Output/"


use "${output}analysis_part2", clear

drop if year > 1932

areg turnout inter_2_19*  inter_3_19* i.year, absorb(county_id)
predict county_predict, xb
collapse (mean) county_predict, by(year group president_year) 

sort year
twoway (scatter county_predict year if group == 1 & president_year ==1, connect(l)) ///
(scatter county_predict year if group == 2 & president_year ==1, connect(l)) ///
(scatter county_predict year if group == 3 & president_year ==1, connect(l)), ///
 legend(label(1 "Radio: 1922-1923")  label(2 "Radio: 1924-1931") label(3 "Radio: 1932 onward")) title("County: Predicted Turnout") subtitle("Presidential Year") ytitle("Mean Linear Prediction") ///
 note("Controlling for year-group interaction, year, and county fixed effects")
 
 twoway (scatter county_predict year if group == 1 & president_year ==0 , connect(l)) ///
(scatter county_predict year if group == 2 & president_year ==0, connect(l)) ///
(scatter county_predict year if group == 3 & president_year ==0, connect(l)), ///
 legend(label(1 "Group 1")  label(2 "Group 2") label(3 "Group 3")) title("County: Predicted Turnout") subtitle("Non-Presidential Year") ytitle("Mean Linear Prediction") ///
 note("Controlling for year-group interaction, year, and county fixed effects")
 
restore 
	
***************

		
		
	gen type_election = 1 if presidential == 1 
	replace type_election = 2 if presidential ==0 & president_year == 1
	replace type_election = 3 if president_year == 0 
		
		assert !mi(type_election)
		
gen pseudo_turnout = turnout if year <= first_county
		bys county_id type_election: egen max_year = max(year) if !mi(pseudo_turnout) & !mi(first_county)
		gen previous_year = turnout if year == max_year
	
	bys county_id type: egen max_type = max(previous_year)
	replace previous_year = max_type
	
	replace pseudo_turnout = previous_year + .032 if mi(pseudo_turnout) & !mi(first_county) 

		forvalues i = 1/3 {
		reg pseudo_turnout  i.year if group == `i', absorb(county_id)
		predict pseudo_turnout_`i', xb
		}
		gen psuedo_turnout = pseudo_turnout_1
		replace  psuedo_turnout = pseudo_turnout_2 if mi(pseudo_turnout)
		replace psuedo_turnout = pseudo_turnout_3 if mi(pseudo_turnout)
		
		preserve
		
		
** graph the coefficients ** 
gen group_ps_2 = . 
gen group_ps_3 = . 
	forvalues i = 1920(2)1942 {
		replace group_ps_2 = _b[inter_2_`i'] if year == `i' & group == 2
		replace group_ps_3 = _b[inter_3_`i'] if year == `i' & group == 3

		}
	sort year

	sort year
twoway (scatter group_ps_2 year if president_year == 1 & year <= 1932, connect(l) xline(1922) xline(1929)) ///
(scatter group_ps_3 year if president_year == 1 & year <= 1932, connect(l) xline(1922) xline(1929)), ///
ytitle("Year-Group Interaction") subtitle("Relative to First Group to Receive Radio") ///
 note("Year and county controls") xtitle("Year") title("Pseudo Presidential Year Turnout: Year-Group Interaction") subtitle("3.2 Percentage Point") legend(lab(1 "Group 2") lab(2 "Group 3"))
		
				collapse (mean) pseudo_turn, by(year president_year group)


		sort year
		
		twoway (scatter pseudo_turn year if group == 1 & president_year ==1, connect(l)) ///
(scatter pseudo_turn year if group == 2 & president_year ==1, connect(l)) ///
(scatter pseudo_turn year if group == 3 & president_year ==1, connect(l)), ///
 legend(label(1 "Radio: 1922-1923")  label(2 "Radio: 1924-1931") label(3 "Radio: 1932 onward")) title("County: Pseudo Turnout") subtitle("Presidential Year: 3.2 Percentage Point Increase") ytitle("Mean Linear Prediction") ///
 note("Controlling for year-group interaction, year, and county fixed effects")
 
 twoway (scatter pseudo_turn year if group == 1 & president_year ==0, connect(l)) ///
(scatter pseudo_turn year if group == 2 & president_year ==0, connect(l)) ///
(scatter pseudo_turn year if group == 3 & president_year ==0, connect(l)), ///
 legend(label(1 "Radio: 1922-1923")  label(2 "Radio: 1924-1931") label(3 "Radio: 1932 onward")) title("County: Pseudo Turnout") subtitle("Non-Presidential Year: .9% Decrease") ytitle("Mean Linear Prediction") ///
 note("Controlling for year-group interaction, year, and county fixed effects")
 
 
		restore
		

	
*** 0 Percent Increase **** 

************** Lag regression *****************

drop if year == 1918
drop if year == 1932

gen radio = year > first_county
areg turnout radio i.year if president_year == 1, absorb(county_id) vce(cluster county_id)


 
 ********* Lag coefficients ************* 
 cap program drop lag_coeff
 program lag_coeff 
 
 syntax, variable(string)   title(string) figure(string) name(string) type(string) [reg_var(string) ]
 
 gen interest_0 = (year-`variable')==0 
 gen interest_1 = (year-`variable') ==1
  gen interest_2 = (year-`variable') == 2
 
 

gen interest_minus1 = (year-`variable') == -1
gen interest_minus2 = (year-`variable') == -2

if `type' == 3 {
eststo: areg  turnout interest_minus2 interest_minus1 interest_0  interest_1 interest_2  `reg_var' i.year, absorb(county_id) vce(cluster county_id)
	}

if `type' == 1 {
eststo: areg  turnout interest_minus2 interest_minus1 interest_0  interest_1 interest_2  `reg_var' i.year if president_year == 1, absorb(county_id) vce(cluster county_id)
	}

if `type' == 0 {
eststo: areg  turnout interest_minus2 interest_minus1 interest_0  interest_1 interest_2  `reg_var' i.year if president_year == 0, absorb(county_id) vce(cluster county_id)
	}
	
predict prediction, xb

gen interest_axis = year-`variable'


 mat define b = e(b)
 mat define v= e(V)
 gen coeff = . 
 gen upper_bound = . 
gen lower_bound = . 
 
 loc j = 1
 forvalues i = -2/2 {
 replace coeff = b[1,`j'] if interest_axis == `i'
 replace lower_bound = b[1,`j'] - 1.96*sqrt(v[`j', `j']) if interest_axis == `i'
  replace upper_bound = b[1,`j'] + 1.96*sqrt(v[`j', `j']) if interest_axis == `i'

	loc j = `j' + 1
	}
	
sort interest_axis


twoway (scatter coeff interest_axis, connect(l)) ///
(scatter upper_bound interest_axis, mcolor(red) msymbol(D)) (scatter lower_bound interest_axis, mcolor(red) msymbol(D) )  if abs(interest_axis) <= 2, ///
title("Figure `figure': Graph of Lag Coefficients: `title'") ///
saving("/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/plots/`name'", replace) xtitle("Time Since Broadcasting Introduced (years)") ///
 ytitle("Voting Turnout") legend(off)
 
 drop interest_0 interest_1 interest_2 interest_minus* coeff prediction interest_axis upper_bound lower_bound
 
 end

 lag_coeff, variable(first_county) title(All Years) figure(1) type(3) name(lag_county)  
 
  lag_coeff, variable(first_county) title(Presidential Years) figure(2) type(1) name(lag_count_pres)
  
    lag_coeff, variable(first_county) title(Non-presidential Years) figure(3) type(0) name(lag_count_nonpres)


 
 

 lag_coeff, variable(first_dma) title(DMA) figure(11) name(lag_dma)
 ** Now do this for county level ** 
 




	
