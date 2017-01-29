

global input "/Users/lilyhoffman/Desktop/MMPaper/Input/"

import excel ${input}CT_county.xlsx, sheet("Sheet1") firstrow clear
rename  Townname town 
isid town
replace town = trim(town)
gen state = "CT"
merge 1:m  town using ${output}radio_compile, keep(2 3)
assert state == "CT" if _merge == 3
count if state == "CT" & _merge == 2 // all Storrs
replace County = "Tolland" if state == "CT" & _merge == 2
 
use ${input}voting, clear // county data 
rename V2 county
rename V1 state_code
gen state = "" 
loc i = 1
foreach var in CT ME MA NH RI VT {
replace state = "`var'" if state_code == `i'
loc i = `i' + 1
}
cap program drop state_assign
program state_assign
syntax, num(string) states(namelist)
loc j = `num'
foreach var in `states' {
replace state = "`var'" if state_code == `j'
loc j = `j' + 1
}
end 

state_assign, num(11) states(DE NJ NY PA) 
state_assign, num(21) states(IL IN MI OH WI)
state_assign, num(31) states(IA KS MN MO NE ND SD)
state_assign, num(40) states(VA AL AR FL GA LA MS NC SC TX)
state_assign, num(51) states(KY MD OK TN)
state_assign, num(56) states(WV)
state_assign, num(61) states(AZ CO ID MT NV NM UT WY)
state_assign, num(71) states(CA OR WA)
state_assign, num(81) states(AL HI) 
assert state != "" 
order state, first

isid state county
