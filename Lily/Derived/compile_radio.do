clear all
global input "/Users/lilyhoffman/Desktop/MMPaper/Input/"
global output "/Users/lilyhoffman/Desktop/MMPaper/Output/"

cap program drop set_up 
program set_up
replace A = "" in 3
replace A = "" in 1
drop if A == ""
gen frequency = regexs(0) if regexm(A, "[0-9][0-9[0-9]+") ==1 
replace frequency = "" if frequency != A
replace frequency = frequency[_n-1] if !missing(frequency[_n-1]) & missing(frequency) 
replace frequency = "" if frequency == A
drop if frequency == ""
destring frequency, replace

gen station = substr(A, 1, 4)
replace station = strrtrim(station) 
replace A = substr(A, 5, .)
gen state = regexs(0) if regexm(A, "[ ][A-Z][A-Z]") ==1 
end 

cap program drop town 
program town
gen placement = strpos(A, state)
gen town = substr(A, 1, placement)
replace town = strrtrim(town)
drop A placement
end
****************************************************************************
import excel ${input}radio_1922.xlsx, sheet("Sheet1") firstrow
rename (Call City State) (station town state)
gen frequency = 833 
drop Licensee
gen year = 1922
save radio_1922, replace

import excel ${input}radio_1923.xlsx, sheet("Sheet1") clear
gen year = 1923
set_up
replace state = " ND" if state == "" 
town 
save radio_1923, replace

import excel ${input}radio_1924.xlsx, sheet("Sheet1") clear
gen year = 1924
set_up
town 
save radio_1924, replace

import excel ${input}radio_1925.xlsx, sheet("Sheet1") clear
gen year = 1925
set_up
town 
save radio_1925, replace

import excel ${input}radio_1926.xlsx, sheet("Sheet1") clear
gen year = 1926
drop if A == ""
gen frequency = regexs(0) if regexm(A, "[0-9][0-9[0-9]+") ==1 
destring frequency, replace
replace A = substr(A, 5,.)
replace A = strrtrim(A) 
gen station = substr(A, 1, 6)
replace station = strrtrim(station) 
replace A = substr(A, 7, .)
gen state = regexs(0) if regexm(A, "[ ][A-Z][A-Z]") ==1 
town
save radio_1926, replace
import excel ${input}radio_1927.xlsx, sheet("Sheet1") clear
gen year = 1927
set_up
town 
save radio_1927, replace
import excel ${input}radio_1928.xlsx, sheet("Sheet1") clear
gen year = 1928
set_up
town
save radio_1928, replace

import excel ${input}radio_1929.xlsx, sheet("Sheet1") clear
gen year = 1929
gen frequency = regexs(0) if regexm(A, "[0-9][0-9[0-9]+") ==1 
replace frequency = "" if frequency != A
replace frequency = frequency[_n-1] if !missing(frequency[_n-1]) & missing(frequency) 
replace frequency = "" if frequency == A
drop if frequency == ""
destring frequency, replace
drop if A == ""
gen station = substr(A, 1, 4)
replace A = substr(A, 5,.)
replace A = strrtrim(A)
gen state = regexs(0) if regexm(A, "[ ][A-Z][A-Z]") ==1 
town
save radio_1929, replace

import excel ${input}radio_1930.xlsx, sheet("Sheet1") clear
gen year = 1930
set_up 
town 
save radio_1930, replace
import excel ${input}radio_1931.xlsx, sheet("Sheet1") clear
gen year = 1931
set_up 
town 
save radio_1931, replace
**** Combine all files
forvalues i = 1922/1930 {
append using radio_`i'
} 

replace town = regexr(town, ",", "") 
replace town = strrtrim(town)
foreach var in state town{ 
replace `var' = trim(`var')
}
drop if state == "AK" // state not create yet
drop if state == "HI" // state not create yet
drop if state == "PI" // state not create yet

replace state = "MO" if town == "Joplin"
save ${output}radio_compile, replace


preserve 
use ${output}voting_clean, clear
keep state county
duplicates drop 
gen town = county

save ${output}major_county, replace
restore






