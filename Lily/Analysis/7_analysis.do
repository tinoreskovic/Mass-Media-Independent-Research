clear all

log using  "/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/logfiles/7_analysis", replace

global input "~/Google Drive/Mass Media/Lily/Data/"
global temp "~/Google Drive/Mass Media/Lily/Temp/"
global output "~/Google Drive/Mass Media/Lily/Output/"

use "${output}analysis_setup", clear

gen group = 1  if (first_county < 1924)
replace group = 2 if (first_county >= 1924 & first_county <= 1931)
replace group = 3 if mi(first_county)

** Include interaction because group is completely determine by 
reg turnout i.group##i.year i.state_code

** graph the coefficients ** 
gen group_2 = . 
gen group_3 = . 
	forvalues i = 1912(2)1950 {
		replace group_2 = _b[2.group#`i'.year] if year == `i' & group == 2
		replace group_3 = _b[3.group#`i'.year] if year == `i' & group == 3
		}
	sort year	
twoway (scatter group_2 year, connect(l) xline(1924) xline(1922)) (scatter group_3 year, xline(1932) connect(l)) if president_year == 1, title("Presidential Year") ///
ytitle("Turnout: Year-Group Interaction") subtitle("Relative to First Group to Receive Radio") note("Group, year, and state controls") xtitle("Year") ///
legend(label(1 "Group 2") label(2 "Group 3")) 

twoway (scatter group_2 year, connect(l)) (scatter group_3 year, connect(l)) if president_year == 0, title("Non-presidential Year") ///
ytitle("Turnout: Year-Group Interaction") subtitle("Relative to First Group to Receive Radio") note("Group, year, and state controls") xtitle("Year") ///
legend(label(1 "Group 2") label(2 "Group 3")) 

areg turnout i.group#i.year i.year i.state_code, absorb(county_id) 
predict linear_predict, xb

gen group_2_county = . 
gen group_3_county = . 
	forvalues i = 1912(2)1950 {
		replace group_2_county = _b[2.group#`i'.year] if year == `i' & group == 2
		replace group_3_county = _b[3.group#`i'.year] if year == `i' & group == 3
		}

	twoway (scatter group_2_county year, xline(1924) xline(1922) xline(1932) connect(l)) (scatter group_3_county year, connect(l)) if president_year == 1, title("Presidential Year") ///
ytitle("Turnout: Year-Group Interaction") subtitle("Relative to First Group to Receive Radio") note("Year and county controls") xtitle("Year") ///
legend(label(1 "Group 2") label(2 "Group 3")) 

twoway (scatter group_2_county year, connect(l)) (scatter group_3_county year, connect(l)) if president_year == 0, title("Non-presidential Year") ///
ytitle("Turnout: Year-Group Interaction") subtitle("Relative to First Group to Receive Radio") note("Year and county controls") xtitle("Year") ///
legend(label(1 "Group 2") label(2 "Group 3")) 



gen group_dma = 1  if (first_dma < 1925)
replace group_dma = 2 if (first_dma >= 1925 & first_dma <= 1931)
replace group_dma = 3 if mi(first_dma)

preserve
collapse (mean) linear_predict, by(year group_dma presidential president_year) 

sort year
twoway (scatter linear_predict year if group_dma == 1 & president_year ==1, connect(l)) (scatter linear_predict year if group_dma == 3 & president_year ==1, ///
connect(l)), legend(label(1 "Radio: 1922-1925") label(2 "Radio: 1932 onward")) title("Predicted Turnout") subtitle("Presidential Election") ytitle("Mean Linear Prediction") ///
 note("Controlling for year, state, group, and year-group interactions")

twoway (scatter linear_predict year if group_dma == 1 & presidential ==1, connect(l)) (scatter linear_predict year if group_dma== 2 & presidential ==1, ///
connect(l)), legend(label(1 "Radio: 1922-1925") label(2 "Radio: 1926-1931"))  ///
title("Predicted Turnout") subtitle("Presidential Election") ytitle("Mean Linear Prediction") ///
 note("Controlling for year, state, group, and year-group interactions")


twoway (scatter linear_predict year if group_dma == 1 & president_year ==0, connect(l)) (scatter linear_predict year if group_dma == 3 & president_year ==0, ///
connect(l)), legend(label(1 "Radio: 1922-1925") label(2 "Radio: 1932 onward")) title("Predicted Turnout") subtitle("Non-Presidential Election Years") ytitle("Mean Linear Prediction") ///
 note("Controlling for year, state, group, and year-group interactions")

twoway (scatter linear_predict year if group_dma == 1 & president_year ==0, connect(l)) (scatter linear_predict year if group_dma == 2 & president_year ==0, ///
connect(l)), legend(label(1 "Radio: 1922-1925") label(2 "Radio: 1926-1931"))  ///
title("Predicted Turnout") subtitle("Non-presidential Election Years") ytitle("Mean Linear Prediction") ///
 note("Controlling for year, state, group, and year-group interactions")


restore 
	
	
	***************
		//drop if year > 1931 & year < 1920
		
gen pseudo_turnout = turnout if year <= first_county
		bys county_id: egen max_year = max(year) if !mi(pseudo_turnout) 
		gen previous_year = turnout if year == max_year
	bys county_id: egen t_prev= max(previous_year)
	replace previous_year = t_prev
		
		replace pseudo_turnout = 1.01*previous_year if year > first_county

		
		
areg pseudo_turnout i.group#i.year i.year, absorb(county_id) 
		predict lin_pseud, xb
		
		collapse (mean) lin_pseud, by(year presidential group)
		sort year
		twoway (scatter lin_pseud year if group == 1 & presidential == 1, connect(l))  (scatter lin_pseud year if group == 2 & presidential == 1, connect(l))
**** pseudo regressions ***		

gen pseudo_turnout = turnout if year <= first_county

preserve 


gen previous_year = . 
forvalues j = 0/4 {	
	bys county_id: replace previous_year = turnout if year == (first_county-`j') & mi(previous_year)
	bys county_id: egen max_prev = max(previous_year)
		replace previous_year = max_prev
		drop max_prev
		}
	
replace pseudo_turnout = previous_year*(1.01)^interest_county if first_county < year 
		

reg pseudo_turnout i.group##i.year i.state_code 
predict linear_predict_pseud, xb	
		
preserve 

drop if year > 1938
	collapse (mean) linear_predict_pseud, by(presidential president_year year group)	
	sort year	
		twoway (scatter linear_predict_pseud year if group == 1 & presidential ==1, connect(l)) (scatter linear_predict_pseud year if group == 2 & presidential ==1, ///
connect(l)), legend(label(1 "Radio: 1922-1925") label(2 "Radio: 1926-1932")) title("Predicted Turnout") subtitle("Presidential Election Years") ytitle("Mean Linear Prediction") ///
 note("Controlling for year, state, group, and year-group interactions")

		
keep if year < 1932

twoway (scatter linear_predict_pseud year if group == 1 & presidential ==1, connect(l)) (scatter linear_predict_pseud year if group == 2 & presidential ==1, ///
connect(l)) (scatter linear_predict_pseud year if group == 3 & presidential ==1, connect(l)), legend(label(1 "Radio: 1922-1925") label(2 "Radio: 1926-1932") label(3 "1932-onward")) title("Predicted Turnout") subtitle("Presidential Election") ytitle("Mean Linear Prediction") ///
 note("Controlling for year, state, group, and year-group interactions")
 
 
 twoway (scatter linear_predict_pseud year if group == 1 & president_year ==0, connect(l)) (scatter linear_predict_pseud year if group == 2 & president_year ==0, ///
connect(l)) (scatter linear_predict_pseud year if group == 3 & president_year ==0, connect(l)), legend(label(1 "Radio: 1922-1925") label(2 "Radio: 1926-1932") label(3 "1932-onward")) title("Predicted Turnout") subtitle("Non-presidential Election Year") ytitle("Mean Linear Prediction") ///
 note("Controlling for year, state, group, and year-group interactions")
	
restore


drop if year >= 1932 | year < 1920	

eststo: areg turnout interest_county  i.year if president_year == 1 ,   absorb(county_id) vce(cluster county_id)


eststo: areg turnout interest_county county_sq i.year,   absorb(county_id) vce(cluster county_id)

eststo: areg turnout c.interest_county#president_year  i.year ,  absorb(county_id) vce(cluster county_id)




eststo: areg turnout interest_county  i.year ,   absorb(county_id) vce(cluster county_id)
	predict resid_1, residuals
	predict linear_1, xb
	
	
	preserve
collapse (mean) linear_1, by(year president_year)
sort year

scatter linear_1 year if president_year == 0, connect(l)
scatter linear_1 year if president_year == 1, connect(l)


restore

	
	replace first_county = 9999 if mi(first_county) 
	
	program_fit, var(1)
	
 esttab est1  using "/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/plots/model_1.csv", label star se stats(ar2 N) replace drop(*.year) 

			eststo: areg turnout   c.interest_county#president_year i.year,  absorb(county_id) vce(cluster county_id)

	eststo: areg turnout county_sq  c.interest_county#president_year i.year,  absorb(county_id) vce(cluster county_id)
	
		predict resid_2, residuals
		predict linear_2, xb
		
			program_fit, var(2)
			
 esttab est2  using "/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/plots/model_2.txt", label star se stats(ar2 N) replace drop(*.year) 

	

	predict resid_3, residuals
		predict linear_3, xb
		
			program_fit, var(3)

eststo: areg turnout c.interest_county#president_year    i.year  i.year#c.log_pop ,  absorb(county_id) vce(cluster county_id)
eststo: areg turnout c.interest_county#president_year    i.year  i.year#c.percent_urban ,  absorb(county_id) vce(cluster county_id)




 esttab est1 est2 est3 using "/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/plots/county.csv", label star se stats(ar2 N) replace drop(*.year) 


 *** Visual graph *** 
 
 reg turnout i.year i.county_id if year < 1926
 
 
** Allowing heteregenoeity in time and years broadcasting by 
eststo: areg turnout interest_county i.year#c.percent_nonwhite i.year#c.percent_urban i.year#c.log_pop  i.year,   absorb(county_id) vce(cluster county_id)


** Interacted terms ** 


 esttab est4 est5 est7 est8 est9  using "/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/plots/county_2.csv", label star se stats(ar2 N) replace drop(*.year *c.*) 




** DMA indicators
 
 eststo: areg turnout interest i.year, absorb(county_id) vce(cluster dmaindex)
  eststo: areg turnout c.interest#i.president_year i.year, absorb(county_id) vce(cluster dmaindex)

  
  esttab est10 est11 est12 using "/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/plots/dma_reg.csv", label star se stats(ar2 N) replace  drop(*.year)
  
 eststo: areg turnout interest i.year#c.percent_urban i.year#c.log_pop i.year , absorb(county_id) vce(cluster county_id)
  eststo: areg turnout interest interest_pres president_year i.year#c.percent_urban i.year#c.log_pop i.year, absorb(county_id) vce(cluster county_id)
  eststo: areg turnout interest interest_pres president_year interest_sq i.year#c.percent_urban i.year#c.log_pop i.year, absorb(county_id) vce(cluster county_id)
    eststo: areg turnout interest interest_pres president_year interest_sq dma_inter_percent_urban i.year#c.percent_urban i.year#c.log_pop i.year, absorb(county_id) vce(cluster county_id)
	    eststo: areg turnout interest interest_pres president_year interest_sq dma_inter_percent_nonwhite i.year#c.percent_urban i.year#c.log_pop i.year, absorb(county_id) vce(cluster county_id)
		    eststo: areg turnout interest interest_pres president_year interest_sq dma_inter_log_pop i.year#c.percent_urban i.year#c.log_pop i.year, absorb(county_id) vce(cluster county_id)

 esttab est13 est13 est14 est15 est16 est17 est18  using "/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/plots/dma_reg_inter.csv", label star se stats(ar2 N) replace drop(*.year *c.*) 

 
 ********* Lag coefficients ************* 
 cap program drop lag_coeff
 program lag_coeff 
 
 syntax, variable(string)   title(string) figure(string) name(string) [reg_var(string)]
 
 gen interest_0 = (year-`variable')==0 
 gen interest_1 = (year-`variable') ==1
  gen interest_2 = (year-`variable') == 2
 
 

gen interest_minus1 = (year-`variable') == -1
gen interest_minus2 = (year-`variable') == -2

eststo: areg  turnout interest_minus2 interest_minus1 interest_0  interest_1 interest_2  `reg_var' i.year, absorb(county_id) vce(cluster county_id)
	
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
scatter coeff interest_axis if abs(interest_axis) <= 2, title("Figure `figure': Graph of Lag Coefficients: `title' Level") ///
saving("/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/plots/`name'", replace) xtitle("Time Since Broadcasting Introduced (years)") ytitle("Voting Turnout") connect(l)
 
 drop interest_0 interest_1 interest_2 interest_minus* coeff prediction interest_axis 
 
 end

 lag_coeff, variable(first_county)title(County) figure(10) name(lag_county)  
 
  lag_coeff, variable(first_county) title(County_sq) figure(10) name(lag_county_sq) reg_var(county_sq)

 
 

 lag_coeff, variable(first_dma) title(DMA) figure(11) name(lag_dma)
 ** Now do this for county level ** 
 
 

save "${output}final_analysis", replace 

log close
* 
