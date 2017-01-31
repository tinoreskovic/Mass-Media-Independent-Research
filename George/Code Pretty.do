gen weight = 1/sqrt(rank)

gen enc_viol = weight*words

twoway (scatter enc_viol month)

total enc_viol, over(month)

twoway (line evm month)

gen ln_viol = log(viol)

gen ln_evm = log(evm)

reg ln_viol ln_evm

twoway (line viol month

gen ln_white = log(pct_white)

gen ln_black = log(pct_black)

gen ln_native = log(pct_native)

gen ln_asian = log(pct_asian)

gen ln_pacific = log(pct_pacific)

reg ln_viol ln_evm ln_black ln_white ln_19 ln_24 ln_29 ln_34 jan feb mar apr jun jul aug sep oct nov dc

twoway (scatter viol evm)

reg ln_stl ln_evm ln_stlb ln_stlw

reg ln_chi ln_evm ln_chib ln_chiw

gen ln_prev = log(prev_viol)

reg viol mwords pct_white pct_black jan feb mar apr jun jul aug sep oct nov dc pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34

reg prev_viol mwords pct_white pct_black jan feb mar apr jun jul aug sep oct nov dc pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34

reg viol mwords pct_white pct_black jan feb mar apr jun jul aug sep oct nov dc year pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34

predict pred_viol

twoway (line pred_viol month) (line viol month)

reg prev_viol mwords pct_white pct_black jan feb mar apr jun jul aug sep oct nov dc year pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34

reg ln_viol ln_evm ln_black ln_white jan feb mar apr jun jul aug sep oct nov dc year ln_19 ln_24 ln_29 ln_34

reg ln_prev ln_evm ln_black ln_white jan feb mar apr jun jul aug sep oct nov dc year ln_19 ln_24 ln_29 ln_34
