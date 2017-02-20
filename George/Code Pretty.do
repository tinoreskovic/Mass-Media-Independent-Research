twoway (scatter enc_viol month)

total enc_viol, over(month)

twoway (line total_enc_viol month)

reg ln_viol ln_evm

twoway (line viol month)

reg ln_viol ln_evm ln_black ln_white ln_19 ln_24 ln_29 ln_34 jan feb mar apr jun jul aug sep oct nov dc

twoway (scatter viol total_enc_viol)

reg ln_stl ln_evm ln_stlb ln_stlw

reg ln_chi ln_evm ln_chib ln_chiw

reg viol total_words_month pct_white pct_black jan feb mar apr jun jul aug sep oct nov dc pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34

reg prev_viol total_words_month pct_white pct_black jan feb mar apr jun jul aug sep oct nov dc pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34

reg viol total_words_month pct_white pct_black jan feb mar apr jun jul aug sep oct nov dc year pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34

predict pred_viol

twoway (line pred_viol month) (line viol month)

reg prev_viol total_words_month pct_white pct_black jan feb mar apr jun jul aug sep oct nov dc year pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34

reg ln_viol ln_evm ln_black ln_white jan feb mar apr jun jul aug sep oct nov dc year ln_19 ln_24 ln_29 ln_34

reg ln_prev ln_evm ln_black ln_white jan feb mar apr jun jul aug sep oct nov dc year ln_19 ln_24 ln_29 ln_34

sum viol if jan==1
sum viol if feb==1
sum viol if mar==1
sum viol if apr==1
sum viol if may==1
sum viol if jun==1
sum viol if jul==1
sum viol if aug==1
sum viol if sep==1
sum viol if oct==1
sum viol if nov==1
sum viol if dc==1

gen viol_time_1 = viol - 109492.8 if jan==1
replace viol_time_1 = viol - 96804.11 if feb==1
replace viol_time_1 = viol - 114253.8 if mar==1
replace viol_time_1 = viol - 114556.3 if apr==1
replace viol_time_1 = viol - 124016.7 if may==1
replace viol_time_1 = viol - 121164.4 if jun==1
replace viol_time_1 = viol - 128319.2 if jul==1
replace viol_time_1 = viol - 127467.2 if aug==1
replace viol_time_1 = viol - 122078.5 if sep==1
replace viol_time_1 = viol - 122206.8 if oct==1
replace viol_time_1 = viol - 109199.5 if nov==1
replace viol_time_1 = viol - 109299.8 if dc==1

gen words_scale = total_words_month*100
twoway (line viol_time_1 month) (line words_scale month) 
reg viol_time_1 total_words_month pct_white pct_black jan feb mar apr jun jul aug sep oct nov dc year pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34

gen two_thou = 0
gen oh_one = 0
gen oh_two = 0
gen oh_3 = 0
gen oh_4 = 0
gen oh_5 = 0
gen oh_6 = 0

replace two_thou = 1 if month==1
replace two_thou = 1 if month==2
replace two_thou = 1 if month==3
replace two_thou = 1 if month==4
replace two_thou = 1 if month==5
replace two_thou = 1 if month==6
replace two_thou = 1 if month==7
replace two_thou = 1 if month==8
replace two_thou = 1 if month==9
replace two_thou = 1 if month==10
replace two_thou = 1 if month==11
replace two_thou = 1 if month==12

replace oh_one = 1 if month==13
replace oh_one = 1 if month==14
replace oh_one = 1 if month==15
replace oh_one = 1 if month==16
replace oh_one = 1 if month==17
replace oh_one = 1 if month==18
replace oh_one = 1 if month==19
replace oh_one = 1 if month==20
replace oh_one = 1 if month==21
replace oh_one = 1 if month==22
replace oh_one = 1 if month==23
replace oh_one = 1 if month==24

replace oh_two = 1 if month==25
replace oh_two = 1 if month==26
replace oh_two = 1 if month==27
replace oh_two = 1 if month==28
replace oh_two = 1 if month==29
replace oh_two = 1 if month==30
replace oh_two = 1 if month==31
replace oh_two = 1 if month==32
replace oh_two = 1 if month==33
replace oh_two = 1 if month==34
replace oh_two = 1 if month==35
replace oh_two = 1 if month==36

replace oh_3 = 1 if month==37
replace oh_3 = 1 if month==38
replace oh_3 = 1 if month==39
replace oh_3 = 1 if month==40
replace oh_3 = 1 if month==41
replace oh_3 = 1 if month==42
replace oh_3 = 1 if month==43
replace oh_3 = 1 if month==44
replace oh_3 = 1 if month==45
replace oh_3 = 1 if month==46
replace oh_3 = 1 if month==47
replace oh_3 = 1 if month==48

replace oh_4 = 1 if month==49
replace oh_4 = 1 if month==50
replace oh_4 = 1 if month==51
replace oh_4 = 1 if month==52
replace oh_4 = 1 if month==53
replace oh_4 = 1 if month==54
replace oh_4 = 1 if month==55
replace oh_4 = 1 if month==56
replace oh_4 = 1 if month==57
replace oh_4 = 1 if month==58
replace oh_4 = 1 if month==59
replace oh_4 = 1 if month==60

replace oh_5 = 1 if month==61
replace oh_5 = 1 if month==62
replace oh_5 = 1 if month==63
replace oh_5 = 1 if month==64
replace oh_5 = 1 if month==65
replace oh_5 = 1 if month==66
replace oh_5 = 1 if month==67
replace oh_5 = 1 if month==68
replace oh_5 = 1 if month==69
replace oh_5 = 1 if month==70
replace oh_5 = 1 if month==71
replace oh_5 = 1 if month==72

replace oh_6 = 1 if month==73
replace oh_6 = 1 if month==74
replace oh_6 = 1 if month==75
replace oh_6 = 1 if month==76
replace oh_6 = 1 if month==77
replace oh_6 = 1 if month==78
replace oh_6 = 1 if month==79
replace oh_6 = 1 if month==80
replace oh_6 = 1 if month==81
replace oh_6 = 1 if month==82
replace oh_6 = 1 if month==83
replace oh_6 = 1 if month==84

reg viol_time_1 total_words_month pct_white pct_black jan feb mar apr jun jul aug sep oct nov dc year pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34 two_thou oh_one oh_two oh_3 oh_4 oh_5 oh_6

gen viol_jan = 0
replace viol_jan = viol if jan==1
gen words_jan = 0
replace words_jan = total_words_month if jan==1

preserve
gen words_jan_scale = words_jan*10000
keep if jan==1
replace month=2 if month==13
replace month=3 if month==25
replace month=4 if month==37
replace month=5 if month==49
replace month=6 if month==61
replace month=7 if month==73
reg viol_jan words_jan pct_white pct_black pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34 two_thou oh_one oh_two oh_3 oh_4 oh_5 oh_6
twoway (line viol_jan month) (line words_jan_scale month)
restore

gen viol_feb = 0
replace viol_feb = viol if feb==1
gen words_feb = 0
replace words_feb = total_words_month if feb==1

preserve
gen words_feb_scale = words_feb*10000
keep if feb==1
replace month=1 if month==2
replace month=2 if month==14
replace month=3 if month==26
replace month=4 if month==38
replace month=5 if month==50
replace month=6 if month==62
replace month=7 if month==74
reg viol_feb words_feb pct_white pct_black pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34 two_thou oh_one oh_two oh_3 oh_4 oh_5 oh_6
twoway (line viol_feb month) (line words_feb_scale month)
restore

gen viol_mar = 0
replace viol_mar = viol if mar==1
gen words_mar = 0
replace words_mar = total_words_month if mar==1

preserve
gen words_mar_scale = words_mar*10000
keep if mar==1
replace month=1 if month==3
replace month=2 if month==15
replace month=3 if month==27
replace month=4 if month==39
replace month=5 if month==51
replace month=6 if month==63
replace month=7 if month==75
reg viol_mar words_mar pct_white pct_black pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34 two_thou oh_one oh_two oh_3 oh_4 oh_5 oh_6
twoway (line viol_mar month) (line words_mar_scale month)
restore

gen viol_apr = 0
replace viol_apr = viol if apr==1
gen words_apr = 0
replace words_apr = total_words_month if apr==1

preserve
gen words_apr_scale = words_apr*10000
keep if apr==1
replace month=1 if month==4
replace month=2 if month==16
replace month=3 if month==28
replace month=4 if month==40
replace month=5 if month==52
replace month=6 if month==64
replace month=7 if month==76
reg viol_apr words_apr pct_white pct_black pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34 two_thou oh_one oh_two oh_3 oh_4 oh_5 oh_6
twoway (line viol_apr month) (line words_apr_scale month)
restore

gen viol_may = 0
replace viol_may = viol if may==1
gen words_may = 0
replace words_may = total_words_month if may==1

preserve
gen words_may_scale = words_may*10000
keep if may==1
replace month=1 if month==5
replace month=2 if month==17
replace month=3 if month==29
replace month=4 if month==41
replace month=5 if month==53
replace month=6 if month==65
replace month=7 if month==77
reg viol_may words_may pct_white pct_black pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34 two_thou oh_one oh_two oh_3 oh_4 oh_5 oh_6
twoway (line viol_may month) (line words_may_scale month)
restore

gen viol_jun = 0
replace viol_jun = viol if jun==1
gen words_jun = 0
replace words_jun = total_words_month if jun==1

preserve
gen words_jun_scale = words_jun*10000
keep if jun==1
replace month=1 if month==6
replace month=2 if month==18
replace month=3 if month==30
replace month=4 if month==42
replace month=5 if month==54
replace month=6 if month==66
replace month=7 if month==78
reg viol_jun words_jun pct_white pct_black pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34 two_thou oh_one oh_two oh_3 oh_4 oh_5 oh_6
twoway (line viol_jun month) (line words_jun_scale month)
restore

gen viol_jul = 0
replace viol_jul = viol if jul==1
gen words_jul = 0
replace words_jul = total_words_month if jul==1

preserve
gen words_jul_scale = words_jul*10000
keep if jul==1
replace month=1 if month==7
replace month=2 if month==19
replace month=3 if month==31
replace month=4 if month==43
replace month=5 if month==55
replace month=6 if month==67
replace month=7 if month==79
reg viol_jul words_jul pct_white pct_black pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34 two_thou oh_one oh_two oh_3 oh_4 oh_5 oh_6
twoway (line viol_jul month) (line words_jul_scale month)
restore

gen viol_aug = 0
replace viol_aug = viol if aug==1
gen words_aug = 0
replace words_aug = total_words_month if aug==1

preserve
gen words_aug_scale = words_aug*10000
keep if aug==1
replace month=1 if month==8
replace month=2 if month==20
replace month=3 if month==32
replace month=4 if month==44
replace month=5 if month==56
replace month=6 if month==68
replace month=7 if month==80
reg viol_aug words_aug pct_white pct_black pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34 two_thou oh_one oh_two oh_3 oh_4 oh_5 oh_6
twoway (line viol_aug month) (line words_aug_scale month)
restore

gen viol_sep = 0
replace viol_sep = viol if sep==1
gen words_sep = 0
replace words_sep = total_words_month if sep==1

preserve
gen words_sep_scale = words_sep*10000
keep if sep==1
replace month=1 if month==9
replace month=2 if month==21
replace month=3 if month==33
replace month=4 if month==45
replace month=5 if month==57
replace month=6 if month==69
replace month=7 if month==81
reg viol_sep words_sep pct_white pct_black pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34 two_thou oh_one oh_two oh_3 oh_4 oh_5 oh_6
twoway (line viol_sep month) (line words_sep_scale month)
restore

gen viol_oct = 0
replace viol_oct = viol if oct==1
gen words_oct = 0
replace words_oct = total_words_month if oct==1

preserve
gen words_oct_scale = words_oct*10000
keep if oct==1
replace month=1 if month==10
replace month=2 if month==22
replace month=3 if month==34
replace month=4 if month==46
replace month=5 if month==58
replace month=6 if month==70
replace month=7 if month==82
reg viol_oct words_oct pct_white pct_black pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34 two_thou oh_one oh_two oh_3 oh_4 oh_5 oh_6
twoway (line viol_oct month) (line words_oct_scale month)
restore

gen viol_nov = 0
replace viol_nov = viol if nov==1
gen words_nov = 0
replace words_nov = total_words_month if nov==1

preserve
gen words_nov_scale = words_nov*10000
keep if nov==1
replace month=1 if month==11
replace month=2 if month==23
replace month=3 if month==35
replace month=4 if month==47
replace month=5 if month==59
replace month=6 if month==71
replace month=7 if month==83
reg viol_nov words_nov pct_white pct_black pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34 two_thou oh_one oh_two oh_3 oh_4 oh_5 oh_6
twoway (line viol_nov month) (line words_nov_scale month)
restore

gen viol_dc = 0
replace viol_dc = viol if dc==1
gen words_dc = 0
replace words_dc = total_words_month if dc==1

preserve
gen words_dc_scale = words_dc*10000
keep if dc==1
replace month=1 if month==12
replace month=2 if month==24
replace month=3 if month==36
replace month=4 if month==48
replace month=5 if month==60
replace month=6 if month==72
replace month=7 if month==84
reg viol_dc words_dc pct_white pct_black pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34 two_thou oh_one oh_two oh_3 oh_4 oh_5 oh_6
twoway (line viol_dc month) (line words_dc_scale month)
restore

gen prev_words =0
replace prev_words = 3 if month==1
replace prev_words = 4 if month == 2
replace prev_words = 4 if month == 3
replace prev_words = 4 if month == 4
replace prev_words = 1 if month == 6
replace prev_words = 9 if month == 11
replace prev_words = 3 if month == 12
replace prev_words = 5 if month == 13
replace prev_words = 5 if month == 14
replace prev_words = 5 if month == 15
replace prev_words = 4 if month == 16
replace prev_words = 1 if month == 17
replace prev_words = 1 if month == 18
replace prev_words = 1 if month == 19
replace prev_words = 6 if month == 21
replace prev_words = 2 if month == 22
replace prev_words = 3 if month == 23
replace prev_words = 2 if month == 24
replace prev_words = 1 if month == 25
replace prev_words = 4 if month == 26
replace prev_words = 6 if month == 27
replace prev_words = 7 if month == 28
replace prev_words = 3 if month == 29
replace prev_words = 4 if month == 30
replace prev_words = 6 if month == 31
replace prev_words = 3 if month == 32
replace prev_words = 14 if month == 33
replace prev_words = 31 if month == 34
replace prev_words = 26 if month == 35
replace prev_words = 19 if month == 36
replace prev_words = 7 if month == 37
replace prev_words = 9 if month == 38
replace prev_words = 9 if month == 39
replace prev_words = 12 if month == 40
replace prev_words = 21 if month == 41
replace prev_words = 16 if month == 42
replace prev_words = 9 if month == 43
replace prev_words = 5 if month == 44
replace prev_words = 6 if month == 45
replace prev_words = 7 if month == 46
replace prev_words = 14 if month == 47
replace prev_words = 12 if month == 48
replace prev_words = 17 if month == 49
replace prev_words = 19 if month == 50
replace prev_words = 10 if month == 51
replace prev_words = 14 if month == 52
replace prev_words = 8 if month == 53
replace prev_words = 10 if month == 54
replace prev_words = 10 if month == 55
replace prev_words = 8 if month == 56
replace prev_words = 11 if month == 57
replace prev_words = 13 if month == 58
replace prev_words = 9 if month == 59
replace prev_words = 28 if month == 60
replace prev_words = 31 if month == 61
replace prev_words = 25 if month == 62
replace prev_words = 21 if month == 63
replace prev_words = 21 if month == 64
replace prev_words = 13 if month == 65
replace prev_words = 10 if month == 66
replace prev_words = 11 if month == 67
replace prev_words = 6 if month == 68
replace prev_words = 19 if month == 69
replace prev_words = 13 if month == 70
replace prev_words = 4 if month == 71
replace prev_words = 5 if month == 72
replace prev_words = 9 if month == 73
replace prev_words = 10 if month == 74
replace prev_words = 2 if month == 75
replace prev_words = 6 if month == 76
replace prev_words = 6 if month == 77
replace prev_words = 14 if month == 78
replace prev_words = 9 if month == 79
replace prev_words = 7 if month == 80
replace prev_words = 21 if month == 81
replace prev_words = 14 if month == 82
replace prev_words = 2 if month == 83
replace prev_words = 8 if month == 84

gen delta_viol = viol - prev_viol
gen delta_words = total_words_month - prev_words
reg delta_viol delta_words
reg delta_viol delta_words pct_white pct_black jan feb mar apr jun jul aug sep oct nov dc pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34 two_thou oh_one oh_two oh_3 oh_4 oh_5 oh_6
gen delta_sum = sum(delta_words)
reg delta_viol delta_sum
twoway (plot delta_sum month month) (line delta_sum month)
