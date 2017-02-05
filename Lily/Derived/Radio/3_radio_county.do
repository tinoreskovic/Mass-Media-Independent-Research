***** Program 3: Merge county to radio data *****
clear all
log using  "/Users/lilyhoffman/Documents/Mass-Media-Independent-Research/Lily/logfiles/3_radio_county", replace


global output "~/Google Drive/Mass Media/Lily/Output/"
global temp "~/Google Drive/Mass Media/Lily/Temp/"
global input "~/Google Drive/Mass Media/Lily/Data/"


use "${output}town_county_crosswalk", clear

merge 1:m town state using "${output}radio_compile", keep(2 3)
preserve
keep if _merge == 3
save "${temp}merged_county", replace
assert county != ""
restore

keep if _merge == 2  
drop _merge
drop if missing(town)
drop county
merge m:1 town state using "${input}unmatched"
drop if _merge ==1
drop _merge 
append using "${temp}merged_county"
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
save "${output}county_radio_compile", replace
log close
**********************************************
