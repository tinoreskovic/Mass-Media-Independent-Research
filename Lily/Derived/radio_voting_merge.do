clear all
global input "/Users/lilyhoffman/Desktop/MMPaper/Input/"
global output "/Users/lilyhoffman/Desktop/MMPaper/Output/"
global temp "/Users/lilyhoffman/Desktop/MMPaper/Temp/"
global set "/Users/lilyhoffman/Desktop/MMPaper/Set_up/"

** Program: Creates county-town crossawalk; merges radio stations to respective counties; merges radio stations
** to the voting data; merges voting data to the 1930 radio ownership census 

*** Compile County-Town crosswalk *** 
import excel ${input}CT_County.xlsx, sheet("Sheet1") firstrow clear
keep Townname County 
gen state = "CT"
duplicates drop 
rename (Townname County) (town county) 
save ${output}CT_county, replace 

import excel ${input}ME_County.xlsx, sheet("Sheet1") firstrow clear
drop ipCode
gen state = "ME"
duplicates drop
rename (Town County) (town county)
save ${output}ME_county, replace

import excel ${input}MO_County.xlsx, sheet("Sheet1") firstrow clear
keep B C
replace B = "" in 12
replace C = "" in 12 
rename (B C) (town county) 
drop if count == "" 
gen state = "MO"
save ${output}MO_county, replace



foreach state in AL MA NH RI VT DE  RI VT DE NJ NY PA IL IN MI OH WI IA KS MN  NE ND SD VA AR FL GA LA MS NC SC TX ///
KY MD OK TN WV AZ CO ID MT NV NM UT WY CA OR WA  {
import excel ${input}`state'_County.xlsx, sheet("Sheet1") firstrow clear
gen state = "`state'"
drop ZipCode ZipCodeMap
duplicates drop 
rename (City County) (town county)
drop if town == ""
drop if county == ""
save ${output}`state'_county, replace
}

foreach state in AL MA NH RI VT DE  RI VT DE NJ NY PA IL IN MI OH WI IA KS MN NE ND SD VA AR FL GA LA MS NC SC TX ///
KY MD OK TN WV AZ CO ID MT NV NM UT WY CA OR CT ME MO {
append using ${output}`state'_county
}
drop ipCode
duplicates drop 
isid town county state

duplicates tag town state, gen(dups)
drop if dups > 0 // ~1% (figure out by hand) 
drop dups 
isid town state 
save ${output}town_county, replace

***** Merge county to radio data *****

merge 1:m town state using ${output}radio_compile, keep(2 3)
preserve
keep if _merge == 3
save ${output}merged_county, replace
assert county != ""
restore

keep if _merge == 2  
drop _merge
drop if missing(town)
drop county
merge m:1 town state using ${output}unmatched
drop if _merge ==1
drop _merge 
append using ${output}merged_county
drop if county == "" // 13 observations 
replace county = lower(county) 

** by hand: correct counties for crosswalk ** 
replace county = "orange" if county == "santa ana"
replace county = "dade" if county == "miami-dade"
replace county = "de kalb" if county == "dekalb"
replace county = "du page" if county == "dupage"
replace county = "du page" if county == "dupage"
replace county = "la salle" if county == "lasalle"
replace county = "la porte" if county == "laporte"
replace county = "miami/lykins" if county == "miami"
replace county = "caddo" if county == "caddo parish"
replace county = "st clair" if county == "saint clair"
replace county = "kittson/pembina" if (county == "kittson" & state == "MN")
replace county = "st louis" if (county == "st. louis" & state == "MO")
replace county = "st louis" if (county == "saint louis" & state == "MN")
replace county = "wilkin/toombs" if (county == "wilkin" & state == "MN")
replace county = "arlington/alexand" if (county == "arlington" & state == "VA")
replace county = "hampton" if (county == "hampton city" & state == "VA")
replace county = "lynchburg" if (county == "lynchburg city" & state == "VA")
replace county = "newport news" if (county == "newport news city" & state == "VA")
replace county = "portsmouth" if (county == "portsmouth city" & state == "VA")
replace county = "virginia beach" if (county == "virginia beach city" & state == "VA")
replace county = "johnson/johnston" if (county == "johnson" & state == "NE")
replace county = "la crosse" if (county == "crosse" & state == "WI")
replace county = "stephens/buchanan" if (county == "stephens" & state == "TX")
replace county = "orange/mosquito" if (county == "orange" & state == "FL")
replace county = "calhoun/benton" if (county == "calhoun" & state == "AL")
replace county = "kings" if (county == "brooklyn" & state == "NY")
drop if county == "washington" & state == "DC"
replace county = "dinwiddie" if (county == "huntingdon " & state == "VA")
replace state = "NV" if town == "Reno"

*****************************************************************************
drop _merge
save ${output}county_radio_compile, replace
**********************************************

use ${input}voting, clear
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

merge 1:1 state county using ${input}dma_county_crosswalk, keep(1 3) nogen keepusing(dma* state)
save ${output}voting_clean, replace
******************************************************
merge 1:m state county using ${output}county_radio_compile

preserve
keep if _merge == 3
drop _merge 
save ${temp}merge_matched, replace
restore

keep if _merge == 2
keep state county town year frequency station
gen id_using = _n
save ${temp}id_unmatched, replace

gen matching_char = county + " " + state
** fuzzy match ** 
matchit id_using matching_char using ${output}voting_clean.dta, idusing(id_master) txtusing(matching_char) override
gen state1 = substr(matching_char, -2, .)
gen state2 = substr(matching_char1, -2, .)
keep if state1 == state2
keep if similscore > .75
isid id_using
merge 1:1 id_using using  ${temp}id_unmatched 
preserve
keep if _merge == 2
save ${temp}final_unmatched, replace
restore
keep if _merge ==3 
drop state1 state2 _merge id_using matching_char matching_char1 similscore
rename county county_radio
merge m:1 id_master using ${output}voting_clean, keep(3) nogen
drop county_radio  matching_char id_master
append using ${temp}merge_matched
drop town

bys station state county year: egen mean_freq = mean(frequency)
replace frequency = mean_freq
drop mean_freq 
duplicates drop 
isid station state year county
merge m:1 county state using ${output}voting_clean
drop matching_char  id_master _merge
 
gen station_num = 1 if station != ""
bys county state year: egen total_station = total(station_num)
** Merge to radio ownership for measuring crowd out, impact, etc
merge m:1 state_code county using ${input}family_census_1930, keepusing(county state_code famtot totpop radiorep) keep(1 3) nogen

gen fraction_radio_fam = radiorep/famtot
save ${output}merged_radio_voting, replace

