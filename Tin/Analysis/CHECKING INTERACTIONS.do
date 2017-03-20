clear
use "~/Google Drive/Mass Media/Tin/Data/raw data.dta"
reg logvalue logmentions i.POSI i.transfer_year transfer_age games if team==1
predict valueQ_r5, r 
reg primary logmentions i.POSI i.transfer_year transfer_age games if team==1
predict primary_r5, r 



reg logvalue primary i.POSI i.transfer_year transfer_age games if team==1
predict valueP_r5, r
reg logmentions primary i.POSI i.transfer_year transfer_age games if team==1
predict prominence_r5, r
//
reg logvalue logmentions i.POSI i.transfer_year transfer_age games if team==0
predict valueQ_r0, r
reg primary logmentions i.POSI i.transfer_year transfer_age games if team==0
predict primary_r0, r

reg logvalue primary i.POSI i.transfer_year transfer_age games if team==0
predict valueP_r0, r
reg logmentions primary i.POSI i.transfer_year transfer_age games if team==0
predict prominence_r0, r
//
reg valueQ_r5 primary_r5 if team==1
reg valueQ_r0 primary_r0 if team==0
reg valueP_r5 prominence_r5 if team==1
reg valueP_r0 prominence_r0 if team==0
//
gen valueP_r = 0
replace valueP_r = valueP_r5 if team==1
replace valueP_r = valueP_r0 if team==0
gen valueQ_r = 0
replace valueQ_r = valueQ_r5 if team==1
replace valueQ_r = valueQ_r0 if team==0
gen primary_r = 0
replace primary_r = primary_r5 if team==1
replace primary_r = primary_r0 if team==0
gen prominence_r = 0
replace prominence_r = prominence_r5 if team==1
replace prominence_r = prominence_r0 if team==0
