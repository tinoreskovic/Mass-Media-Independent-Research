**LILY comments: There should be an input here: so:  use filename; is this a dataset in the google drive? 
** 2) to shorten code, you can abbreviate variable names with *, so pct_15_to_19 pct_20_to_24 pct_25_to_29 pct_30_to_34 can all
** be represented by pct*
** 3) You should be saving your plots and regressions results here to a github folder. 
** For example: twoway (scatter enc_viol month) saving("~/Mass-Media-Independent-Research/George/plots/name_plot", replace)


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
