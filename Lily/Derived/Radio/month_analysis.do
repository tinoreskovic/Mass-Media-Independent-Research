clear all 

global input "~/Google Drive/Mass Media/Lily/Output/"
global temp "~/Google Drive/Mass Media/Lily/Temp/"
global output "~/Google Drive/Mass Media/Lily/Output/"
global data "~/Google Drive/Mass Media/Lily/Data/"


import excel "/Users/lilyhoffman/Google Drive/Mass Media/Lily/Data/Month/Radio Data by Month.xlsx", sheet("Sheet1") firstrow clear
rename *, lower
drop if mi(year)
rename city town
duplicates drop
drop if year == . 
replace town = lower(town)

replace month = "February" if month == "Feburary" 
tostring year, replace
gen date_radio= month + " 1 " + year

destring year, replace


gen radio_date = date(date_radio, "MDY")
format %td radio_date
	drop date_radio month year
	
bys town state: egen min_date = min(radio_date)
		keep if radio_date == min_date
		drop min_date
	save "${temp}month_radio", replace
	drop if town == ""
drop if town == "washington"
drop station
merge m:1  town state using "${output}town_county_crosswalk", keep(1 3) nogen


drop if state == "AK"

*** County assignment by hand ** 

replace county = "Potter" if state == "TX" & town == "amarillo"
replace county = "Fulton" if state == "GA" & town == "atlanta"
gen county2 = "Dekalb" if state == "GA" & town == "atlanta"
replace county = "Travis" if state == "TX" & town == "austin"
replace county = "Denver" if state == "CO" & town == "denver"
replace county = "Hamilton" if state == "OH" & town == "cincinnati" 
replace county = "Hamilton" if state == "OH" & town == "cincinnatti" 
replace county = "Hamilton" if state == "OH" & town == "cincinnati " 

replace county = "Philadelphia" if state == "PA" & town == "philadelphia"
replace county = "Montgomery" if state == "OH" & town == "dayton"
replace county = "Harris" if state == "TX" & town == "houston"
replace county = "Hennepin" if state == "MN" & town == "minneapolis"

replace county = "Charleston" if state == "SC" & town == "charleston"
replace county = "Cheshire" if state == "NH" & town == "chesham"
replace county = "Franklin" if state == "OH" & town == "columbus"
replace county2 = "Delaware" if state == "OH" & town == "columbus"
gen county3 = "Fairfield" if state == "OH" & town == "columbus"
replace county = "Baltimore" if state == "MD" & town == "baltimore"
replace county = "Dallas" if state == "TX" & town == "dallas"
replace county2 = "Collin" if state == "TX" & town == "dallas"
replace  county3 = "Denton" if state == "TX" & town == "dallas"
gen  county4 = "Kaufman" if state == "TX" & town == "dallas"
gen  county5 = "Rockwall" if state == "TX" & town == "dallas"

replace county = "Los Angeles" if state == "CA" & town == "hollywood"
replace county = "Marion" if state == "IN" & town == "indianapolis"
replace county = "Windham" if state == "VT" & town == "bellows falls"
replace county = "Madison" if state == "TN" & town == "bemis"
replace county = "Brazos" if state == "TX" & town == "boonville"

replace county = "St louis" if state == "MO" & town == "brentwood"
replace county = "Douglas" if state == "NE" & town == "omaha"
replace county = "Multnomah" if state == "OR" & town == "portland"
replace county = "New Orleans" if state == "LA" & town == "new orleans"
replace county2 = "Metairie" if state == "LA" & town == "new orleans"
replace county3 = "Hammond" if state == "LA" & town == "new orleans"
replace county = "San Francisco" if state == "CA" & town == "san francisco"

replace county = "Jackson" if state == "MO" & town == "kansas city"
replace county2 = "Clay" if state == "MO" & town == "kansas city"
replace county3 = "Cass" if state == "MO" & town == "kansas city"
replace county4 = "Platte" if state == "MO" & town == "kansas city"

replace county = "Duval" if state == "FL" & town == "jacksonville"
replace county = "Guilford" if state == "NC" & town == "greensboro"

replace county = "Oklahoma" if state == "OK" & town == "oklahoma city"
replace county = "Tulsa" if state == "OK" & town == "tulsa"
replace county = "Richmond" if state == "VA" & town == "richmond"

replace county = "Ingham" if state == "MI" & town == "lansing"
replace county2 = "Eaton" if state == "MI" & town == "lansing"
replace county2 = "Clinton" if state == "MI" & town == "lansing"

replace county = "Lucas" if state == "OH" & town == "toledo"
replace county = "Coos" if state == "OR" & town == "marshfield"
replace county = "Volusia" if state == "FL" & town == "de land"
replace county = "Jefferson" if state == "AL" & town == "birmingham"

replace county = "Marion" if state == "IN" & town == "fort benjamin harrison"
replace county = "Lawton" if state == "OK" & town == "fort sill"
replace county = "Greenville" if state == "SC" & town == "greenville"
replace county = "San Mateo" if state == "CA" & town == "hillsborough"
replace county = "Cabell" if state == "WV" & town == "huntington"
replace county2 = "Wayne" if state == "WV" & town == "huntington"

replace county = "Jefferson" if state == "CO" & town == "lakeside"
replace county = "Houghton" if state == "MI" & town == "laurium"
replace county = "Allen" if state == "OH" & town == "lima"
replace county = "Marin" if state == "CA" & town == "san antonio"
replace county = "Bexar" if state == "TX" & town == "san antonio"
replace county = "Marion" if state == "KS" & town == "marion"
replace county = "Hamilton" if state == "IL" & town == "mcleansboro"
replace county = "Westmoreland" if state == "PA" & town == "arnold" 
replace county = "Hamilton" if state == "OH" & town == "norwood"
replace county = "Roanoke" if state == "VA" & town == "roanoke"
replace county = "Richmond" if state == "NY" & town == "rossville"
replace county = "Russell" if state == "KS" & town == "russell"
replace county = "Marion" if state == "OR" & town == "salem"
replace county = "Lincoln" if state == "SD" & town == "sioux falls"
replace county = "Windsor" if state == "VT" & town == "springfield"
replace county = "Stearns" if state == "MN" & town == "st cloud"
replace county = "Buchanan" if state == "MO" & town == "st joseph"
replace county = "St Louis" if state == "MO" & town == "st louis"
replace county = "St Louis" if state == "MO" & town == "st. louis"
replace county = "Ramsey" if state == "MN" & town == "st paul"
replace county = "Ramsey" if state == "MN" & town == "st. paul"

replace county = "Polk" if state == "WI" & town == "st. croix falls"
replace county = "Pinellas" if state == "FL" & town == "st. petersburg"
replace county = "Pitkin" if state == "CO" & town == "thomasville"
replace county = "Mercer" if state == "NJ" & town == "trenton"
replace county = "Rensselaer" if state == "NY" & town == "troy"
replace county = "Lancaster" if state == "NE" & town == "university place"
replace county = "Fairfax" if state == "VA" & town == "westhampton"
replace county = "Luzerne" if state == "PA" & town == "wilkes-barre"
replace county = "Mahaska" if state == "IA" & town == "okaloosa"
replace county = "St Louis" if state == "MO" & town == "webster groves"

drop town
drop if mi(county)
rename county county1
duplicates drop

egen id = group( state county1)
reshape long county, i(id state radio_date) j(county_ov)
drop county_ov id
drop if mi(county)

 bys county state: egen min_county = min(radio_date)
 keep if min_county == radio_date
 drop min_county
 isid county state

	
	replace county = lower(county)
	
	replace state = "MO" if county == "saint louis"
	replace county = "st louis" if county == "saint louis"
	replace county = "st clair" if county == "saint clair"
	replace county = "de kalb" if county == "dekalb" & state == "GA"
	replace county = "portsmouth" if county == "portsmouth city" & state == "VA"
	replace county = "orange/mosquito" if county == "orange" & state == "FL"
	replace county = "cass/van buren" if county == "cass" & state == "MO"
	replace county = "hampton" if county == "hampton city" & state == "VA"
	replace county = "tangipahoa" if county == "hammond" & state == "LA"
	replace county = "dade" if county == "miami-dade" & state == "FL"
	replace county = "comanche" if county == "lawton"  & state == "OK"
	replace county = "nemaha" if county == "johnson" & state == "NE"
	replace county = "du page" if county == "dupage" & state == "IL"
	merge m:1 county state using "${output}voting_clean", nogen keep(3) 
	
	drop id_master matching_char dmaindex dma dmaindex2 dma2 
	
	rename (V417 V408 V427 V440 V433 V451 V457 V467) (cong_1916 pres_1916 cong_1918 cong_1920 pres_1920 cong_1922 pres_1924 cong_1924)

	collapse (first) radio_date, by(state county  cong_1916 pres_1916 cong_1918 cong_1922 pres_1924 cong_1924 cong_1920 pres_1920)
	
	foreach var in cong_1916 pres_1916 cong_1918 cong_1920 pres_1920 cong_1922 pres_1924 cong_1924 {
	replace `var' = . if `var' > 100
	}	

	
	gen month = month(radio_date)
	gen year = year(radio_date) 
	
		forvalues i = 1916(2)1924 {
			gen year_diff =  `i' - year
			replace year_diff = 0 if year_diff < 0
			gen month_diff = 11 - month 
			replace month_diff = 0 if year > `i'
			replace month_diff = 0 if month_diff < 0
			gen month_`i' = year_diff*12 + month_diff
			drop month_diff year_diff
			}
			drop year month
			
			
			
			reshape long pres_ cong_ month_, i(state county) j(year)
			
				merge m:1 county state using "${data}census_part1.dta", keep(1 3) nogen keepusing(rural20 rural30 totpop urban20 urb930 whtot )

				gen percent_white = whtot/totpop*100
				gen percent_urban = urb930/totpop*100
				
 		replace cong_ = . if cong_ == 0
		replace pres_ = . if pres_ == 0
			
			
	save "${output}month_analysis", replace
		gen year_rad = year(radio_date)
	   gen month_rad = month(radio_date)	
	   
		preserve
		use "${output}month_analysis",clear
		
	    gen group = 1 if year_rad == 1922 & month_rad <=9
        replace group = 1 if year_rad == 1923 & month_rad <=9		
		keep if year == 1922 | year == 1918
		keep if group == 1
		
		isid county state year
		gen time = year == 1922
		
     gen treated =  year_rad == 1922 & month_rad <=9	
		reg cong_ time##treated 
		reg cong_ time##treated percent_urban percent_white
		
		restore
		
		
		
				
			 use "${output}month_analysis", clear
			 gen year_rad = year(radio_date)
			 gen month_rad = month(radio_date)
	    gen group = 1 if radio_date == date("2/1/1925", "MDY") | radio_date == date("3/1/1925", "MDY") | radio_date == date("4/1/1925", "MDY") | radio_date == date("12/1/1924", "MDY")
 	replace group = 1 if year_rad == 1924 & month_rad <= 8
		
		keep if year == 1924 | year == 1920
		keep if group == 1
		
		isid county state year
		gen time = year == 1924
		
		gen treated = year_rad == 1924 & month_rad <= 8
		
		
		reg pres_ time##treated 
		eststo: reg pres_ time##treated percent_urban percent_white
		
		
		restore
		
		
		
		
		
		
		
		
		
		
		
		
