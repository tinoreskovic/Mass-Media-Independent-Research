clear all

log using  "/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/logfiles/7_analysis", replace

global input "~/Google Drive/Mass Media/Lily/Data/"
global temp "~/Google Drive/Mass Media/Lily/Temp/"
global output "~/Google Drive/Mass Media/Lily/Output/"

use "${output}analysis_setup", clear

**** Group for counties and DMAs****
gen group = 1  if (first_county <= 1923)
replace group = 2 if (first_county >= 1924 & first_county <= 1931) 
replace group = 3 if first_county > 1931

	assert !mi(group) 

gen group_dma = 1  if (first_dma <= 1923) & !mi(dmaindex)
replace group_dma = 2 if (first_dma >= 1924 & first_dma <= 1931) & !mi(dmaindex)
replace group_dma = 3 if first_dma > 1931 & !mi(dmaindex)

assert mi(group_dma) if mi(dmaindex)
assert mi(dmaindex) if mi(group_dma)

****************************************************

forvalues i = 1920(2)1942 {
	gen inter_2_`i' = (group == 2 & year == `i')
	gen inter_2_dma_`i'= (group_dma == 2 & year == `i') 
	gen inter_3_`i' = (group == 3 & year == `i')
	gen inter_3_dma_`i'= (group_dma == 3 & year == `i') 
		}
		

	preserve
		keep group totpop county_id
		duplicates drop 
		isid county_id
		gen scal_totpop = totpop/1000000
		graph hbar (sum) scal_totpop , over(group) ytitle("Population (Millions)") title("Waves of Radio by 1930 Population") 
	restore 

drop if year > 1942
drop if year < 1918
** Include interaction because group is completely determine by 
areg turnout inter_2_19*  inter_3_19* i.year, absorb(county_id)

** graph the coefficients ** 
gen group_2 = . 
gen group_3 = . 
	forvalues i = 1920(2)1942 {
		replace group_2 = _b[inter_2_`i'] if year == `i' & group == 2
		replace group_3 = _b[inter_3_`i'] if year == `i' & group == 3

		}
	sort year

	sort year
twoway (scatter group_2 year if president_year == 1 & year <= 1932, connect(l) xline(1922) xline(1929)) ///
(scatter group_3 year if president_year == 1 & year <= 1932, connect(l) xline(1922) xline(1929)), ///
ytitle("Year-Group Interaction") subtitle("Relative to First Group to Receive Radio") ///
 note("Year and county controls") xtitle("Year") title("Turnout: Year-Group Interaction") legend(lab(1 "Group 2") lab(2 "Group 3"))
 
graph export  "/Users/lilyhoffman/Desktop/intercept_pres.png", as(png) replace

twoway (scatter group_2 year if president_year == 0 & year <= 1932, connect(l) xline(1922) xline(1929)) ///
(scatter group_3 year if president_year == 0 & year <= 1932, connect(l) xline(1922) xline(1929)), ///
ytitle("Year-Group Interaction") subtitle("Relative to First Group to Receive Radio") ///
 note("Year and county controls") xtitle("Year") title("Turnout: Year-Group Interaction") legend(lab(1 "Group 2") lab(2 "Group 3"))
 
graph export  "/Users/lilyhoffman/Desktop/intercept_nonpres.png", as(png) replace

****** DMA interactions ********** 

preserve
drop if  mi(dmaindex)

areg turnout inter_2_dma_* inter_3_dma_* i.year, absorb(county_id)

gen group_dma_2 = .
gen group_dma_3 = .
** graph the coefficients ** 
	forvalues i = 1920(2)1932 {
		replace group_dma_2 = _b[inter_2_dma_`i'] if year == `i' & group == 2
		replace group_dma_3 = _b[inter_3_dma_`i'] if year == `i' & group == 3

		}
					
twoway (scatter group_dma_2 year if president_year == 1 & year <= 1932, connect(l) xline(1922) xline(1929)) ///
(scatter group_dma_3 year if president_year == 1 & year <= 1932, connect(l) xline(1922) xline(1929)), ///
ytitle("Year-Group Interaction") subtitle("Relative to First Group to Receive Radio") ///
 note("Year and county controls. DMA Level Analysis") xtitle("Year") title("Turnout: Year-Group Interaction") legend(lab(1 "Group 2") lab(2 "Group 3")) 
 
graph export  "/Users/lilyhoffman/Desktop/intercept_pres_dma.png", as(png) replace

twoway (scatter group_dma_2 year if president_year == 0 & year <= 1932, connect(l) xline(1922) xline(1929)) ///
(scatter group_dma_3 year if president_year == 0 & year <= 1932, connect(l) xline(1922) xline(1929)), ///
ytitle("Year-Group Interaction") subtitle("Relative to First Group to Receive Radio") ///
 note("Year and county controls. DMA Level Analysis") xtitle("Year") title("Turnout: Year-Group Interaction") legend(lab(1 "Group 2") lab(2 "Group 3"))

 
 restore
****************************

preserve 

keep if year >= 1920 & year <= 1931	
*** Simple panel regression: DMA *****

gen dma_avail = year > first_dma if !mi(first_dma)
replace dma_avail = 0 if mi(first_dma)
	
label var dma_avail "DMA Access"

eststo: areg turnout dma_avail i.year, absorb(county_id) vce(cluster dmaindex)
eststo: areg turnout dma_avail i.year if president_year == 1 , absorb(county_id) vce(cluster dmaindex)
eststo: areg turnout dma_avail i.year if president_year == 0 , absorb(county_id) vce(cluster dmaindex)
*************************************************************************************

*** Simple panel regression: County *****

gen radio = year > first_county if !mi(first_county)
replace radio = 0 if mi(first_county)
assert !mi(radio)

eststo: areg turnout radio i.year, absorb(county_id) vce(cluster county_id)
eststo: areg turnout radio i.year if president_year == 1 , absorb(county_id) vce(cluster county_id)
eststo: areg turnout radio i.year if president_year == 0 , absorb(county_id) vce(cluster county_id)

****************************************************************************************************************************** END
restore

save "${output}analysis_part2", replace



	
drop if year >= 1932 | year < 1920	

gen radio = year > first_county

eststo: areg turnout radio  i.year  ,   absorb(county_id) vce(cluster county_id)

eststo: areg turnout radio  i.year  if president_year == 1,   absorb(county_id) vce(cluster county_id)
 eststo: areg turnout radio  i.year  if president_year == 0,   absorb(county_id) vce(cluster county_id)




 
	
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
