clear all
** Program 2: Creates county-town crossawalk; merges radio stations to respective counties

global output "\Users\lshoffma\Google Drive\Mass Media\Lily\Output\"
global input "\Users\lshoffma\Google Drive\Mass Media\Lily\Data\State County Lists\"


*** Compile County-Town crosswalk *** 
import excel "C:${input}CT_county.xlsx", firstrow clear
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


foreach state in \AL \MA \NH \RI \VT \DE  \RI \VT \DE \NJ \NY \PA \IL \IN \MI \OH \WI \IA \KS \MN  \NE \ND \SD \VA \AR \FL \GA \LA \MS \NC \SC \TX ///
\KY \MD \OK \TN \WV \AZ \CO \ID \MT \NV \NM \UT \WY \CA \OR \WA  {
loc i = "\Users\lshoffma\Google Drive\Mass Media\Lily\Data\State County Lists`state'_county.xlsx"
import excel "`i'", sheet("Sheet1") firstrow clear
gen state = substr("`state'", 2, 2)
drop ZipCode ZipCodeMap
duplicates drop 
rename (City County) (town county)
drop if town == ""
drop if county == ""
save "C:${output}`state'_county", replace
loc j = "\Users\lshoffma\Google Drive\Mass Media\Lily\Output`state'_county"
save "`j'", replace
}

foreach state in \AL \MA \NH \RI \VT \DE  \RI \VT \DE \NJ \NY \PA \IL \IN \MI \OH \WI \IA \KS \MN  \NE \ND \SD \VA \AR \FL \GA \LA \MS \NC \SC \TX ///
\KY \MD \OK \TN \WV \AZ \CO \ID \MT \NV \NM \UT \WY \CA \OR \CT \ME \MO {
append using "\Users\lshoffma\Google Drive\Mass Media\Lily\Output`state'_county"
}
drop ipCode
duplicates drop 
isid town county state

duplicates tag town state, gen(dups)
drop if dups > 0 // ~1% (figure out by hand) 
drop dups 
isid town state 
save "${output}town_county_crosswalk", replace

*******************************************************************************

