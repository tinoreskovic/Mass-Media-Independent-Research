tsset month
local `season_controls' two_thou oh_one oh_two oh_3 oh_4 oh_5 oh_6 jan feb mar apr may jun jul aug sep oct nov dc
gen beta_minus3=L3.delta_words
gen beta_minus2=L2.delta_words
gen beta_minus1=L.delta_words
gen beta=delta_words
gen beta1=F.delta_words
gen beta2=F2.delta_words
gen beta3=F3.delta_words
eststo: reg delta_viol beta_minus3 beta_minus2 beta_minus1 beta beta1 beta2 beta3 `season_controls'
coefplot, drop(_cons) xline(0) levels(99.9 99 95)  mfcolor(white) vertical 

