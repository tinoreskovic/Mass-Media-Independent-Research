clear
use "~/Google Drive/Mass Media/Tin/Data/raw data.dta"
log using "/Users/tinoreskovic/Desktop/research media/folding_analysis_log.log", replace
//10 random groups: 10-folding
set seed 123456789
generate rannum = uniform()
sort rannum
generate grp1 = .
replace grp1 = 0 in 1/360
replace grp1 = 1 in 361/401
//
gen grp2 = 0
replace grp2 = 1 in 321/360
gen grp3 = 0
replace grp3 = 1 in 281/320
gen grp4 = 0
replace grp4 = 1 in 241/280
gen grp5 = 0
replace grp5 = 1 in 201/240
gen grp6 = 0
replace grp6 = 1 in 161/200
gen grp7 = 0
replace grp7 = 1 in 121/160
gen grp8 = 0
replace grp8 = 1 in 81/120
gen grp9 = 0
replace grp9 = 1 in 41/80
gen grp10 = 0
replace grp10 = 1 in 1/40
//
gen fold1 = 0
replace fold1 = 1 if grp1 == 0
gen fold2 = 0
replace fold2 = 1 if grp2 == 0
gen fold3 = 0
replace fold3 = 1 if grp3 == 0
gen fold4 = 0
replace fold4 = 1 if grp4 == 0
gen fold5 = 0
replace fold5 = 1 if grp5 == 0
gen fold6 = 0
replace fold6 = 1 if grp6 == 0
gen fold7 = 0
replace fold7 = 1 if grp7 == 0
gen fold8 = 0
replace fold8 = 1 if grp8 == 0
gen fold9 = 0
replace fold9 = 1 if grp9 == 0
gen fold10 = 0
replace fold10 = 1 if grp10 == 0
//
reg logvalue logmentions primary i.pos i.transfer_year i.transfer_age games if fold1
predict fold1_estimate if grp1 
predict fold1_residuals if grp1, r 
reg logvalue logmentions primary i.pos i.transfer_year i.transfer_age games if fold2
predict fold2_estimate if grp2
predict fold2_residuals if grp2, r
reg logvalue logmentions primary i.pos i.transfer_year i.transfer_age games if fold3
predict fold3_estimate if grp3
predict fold3_residuals if grp3, r
reg logvalue logmentions primary i.pos i.transfer_year i.transfer_age games if fold4
predict fold4_estimate if grp4
predict fold4_residuals if grp4, r
reg logvalue logmentions primary i.pos i.transfer_year i.transfer_age games if fold5
predict fold5_estimate if grp5
predict fold5_residuals if grp5, r
reg logvalue logmentions primary i.pos i.transfer_year i.transfer_age games if fold6
predict fold6_estimate if grp6
predict fold6_residuals if grp6, r
reg logvalue logmentions primary i.pos i.transfer_year i.transfer_age games if fold7
predict fold7_estimate if grp7
predict fold7_residuals if grp7, r
reg logvalue logmentions primary i.pos i.transfer_year i.transfer_age games if fold8
predict fold8_estimate if grp8
predict fold8_residuals if grp8, r
reg logvalue logmentions primary i.pos i.transfer_year i.transfer_age games if fold9
predict fold9_estimate if grp9
predict fold9_residuals if grp9, r
reg logvalue logmentions primary i.pos i.transfer_year i.transfer_age games if fold10
predict fold10_estimate if grp10
predict fold10_residuals if grp10, r
//
gen cross_estimate = fold1_estimate if grp1
replace cross_estimate = fold2_estimate if grp2
replace cross_estimate = fold3_estimate if grp3
replace cross_estimate = fold4_estimate if grp4
replace cross_estimate = fold5_estimate if grp5
replace cross_estimate = fold6_estimate if grp6
replace cross_estimate = fold7_estimate if grp7
replace cross_estimate = fold8_estimate if grp8
replace cross_estimate = fold9_estimate if grp9
replace cross_estimate = fold10_estimate if grp10
//
gen cross_residual = fold1_residual if grp1
replace cross_residual = fold2_residual if grp2
replace cross_residual = fold3_residual if grp3
replace cross_residual = fold4_residual if grp4
replace cross_residual = fold5_residual if grp5
replace cross_residual = fold6_residual if grp6
replace cross_residual = fold7_residual if grp7
replace cross_residual = fold8_residual if grp8
replace cross_residual = fold9_residual if grp9
replace cross_residual = fold10_residual if grp10
//
twoway (scatter cross_estimate logvalue) (lfit cross_estimate logvalue)
