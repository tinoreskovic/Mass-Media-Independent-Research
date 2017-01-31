**** Program 4: Merge Voting Data to Radio-County-DMA data **** 
global input "\Users\lshoffma\Google Drive\Mass Media\Lily\Data\"
global output "\Users\lshoffma\Google Drive\Mass Media\Lily\Output\"
global temp "\Users\lshoffma\Google Drive\Mass Media\Lily\Temp\"

use "${input}voting", clear
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
drop if state == "" // Alaska and Hawaii 
order state, first
isid state county
replace county = lower(county)
gen id_master = _n
gen matching_char = county + " " + state

merge 1:1 state county using "${input}dma_county_crosswalk", keep(1 3) nogen keepusing(dma* state)
save "${output}voting_clean", replace
******************************************************
merge 1:m state county using "${output}county_radio_compile"

preserve
keep if _merge == 3
drop _merge 
save "${temp}merge_matched", replace
restore

keep if _merge == 2
keep state county town year frequency station
gen id_using = _n
save "${temp}id_unmatched", replace

gen matching_char = county + " " + state
** fuzzy match ** 
matchit id_using matching_char using "${output}voting_clean.dta", idusing(id_master) txtusing(matching_char) override
gen state1 = substr(matching_char, -2, .)
gen state2 = substr(matching_char1, -2, .)
keep if state1 == state2
keep if similscore > .75
isid id_using
merge 1:1 id_using using  "${temp}id_unmatched" 
preserve
keep if _merge == 2
save "${temp}final_unmatched", replace
restore
keep if _merge ==3 
drop state1 state2 _merge id_using matching_char matching_char1 similscore
rename county county_radio
merge m:1 id_master using "${output}voting_clean", keep(3) nogen
drop county_radio  matching_char id_master
append using "${temp}merge_matched"
drop town

bys station state county year: egen mean_freq = mean(frequency)
replace frequency = mean_freq
drop mean_freq 
duplicates drop 
isid station state year county
merge m:1 county state using "${output}voting_clean"
drop matching_char  id_master _merge
 
gen station_num = 1 if station != ""
bys county state year: egen total_station = total(station_num)
** Merge to radio ownership for measuring crowd out, impact, etc
merge m:1 state_code county using "${input}family_census_1930", keepusing(county state_code famtot totpop radiorep) keep(1 3) nogen

gen fraction_radio_fam = radiorep/famtot
save "${output}merged_radio_voting", replace

