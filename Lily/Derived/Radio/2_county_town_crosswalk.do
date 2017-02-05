clear all
** Program 2: Creates county-town crossawalk; merges radio stations to respective counties

log using  "/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/logfiles/2_county_town_crosswalk", replace

global input "~/Google Drive/Mass Media/Lily/Data/State County Lists/"
global output "~/Google Drive/Mass Media/Lily/Output/"

*** Compile County-Town crosswalk *** 
import excel "${input}CT_county.xlsx", firstrow clear
keep Townname County 
gen state = "CT"
duplicates drop 
rename (Townname County) (town county) 
save "${output}CT_county", replace 

import excel "${input}ME_county.xlsx",  firstrow clear
drop ipCode
gen state = "ME"
duplicates drop
rename (Town County) (town county)
save "${output}ME_county", replace

import excel "${input}MO_county.xlsx", firstrow clear
keep B C
replace B = "" in 12
replace C = "" in 12 
rename (B C) (town county) 
drop if count == "" 
gen state = "MO"
save "${output}MO_county", replace


foreach state in AL MA NH RI VT DE RI VT DE NJ NY PA IL IN MI OH WI IA KS MN NE ND SD VA AR FL GA LA MS NC SC TX ///
	KY MD OK TN WV AZ CO ID MT NV NM UT WY CA OR WA  {
import excel "${input}`state'_county.xlsx", sheet("Sheet1") firstrow clear
gen state = substr("`state'", 1, 2)
drop ZipCode ZipCodeMap
duplicates drop 
rename (City County) (town county)
drop if town == ""
drop if county == ""
save "${output}`state'_county", replace
loc j = "~/Google Drive/Mass Media/Lily/Output/`state'_county"
save "`j'", replace
}



foreach state in AL MA NH RI VT DE RI VT DE NJ NY PA IL IN MI OH WI IA KS MN NE ND SD VA AR FL GA LA MS NC SC TX ///
	KY MD OK TN WV AZ CO ID MT NV NM UT WY CA OR WA CA OR CT ME MO {

append using "~/Google Drive/Mass Media/Lily/Output/`state'_county"
}

drop ipCode
duplicates drop 
isid town county state

duplicates tag town state, gen(dups)
drop if dups > 0 // ~1% (figure out by hand) 
drop dups 
isid town state 
save "${output}town_county_crosswalk", replace

unique state, detail
assert r(N) == 48 

log close

*******************************************************************************

