clear
use "~/Google Drive/Mass Media/Tin/Data/raw data.dta"
//PART 1: guardian, independent, telegraph:
reg logvalue logmentions primary i.pos i.transfer_year transfer_age games
rvfplot
predict inestimate, xb
predict inresiduals, r
twoway (scatter inestimate logvalue) (lfit inestimate logvalue)
twoway (scatter logvalue logmentions) (lfitci logvalue logmentions)
reg secondary primary logmentions // (PUSH TO APPENDIX)
// regression with standardized primary for scale comparison of effects
reg logvalue logmentions st_primary i.pos i.transfer_year transfer_age games
// other iterations of (I)  (INCLUDE IN APPENDIX)
reg logvalue logmentions primary i.pos i.transfer_year i.transfer_age games
reg logvalue logmentions primary i.pos i.transfer_year transfer_age agesq games
//without media best
reg logvalue primary i.pos i.transfer_year transfer_age games
rvfplot
predict nomediaestimate, xb
predict nomediaresiduals, r
twoway (scatter nomediaestimate logvalue) (lfit nomediaestimate logvalue)
//team top 5 revenuewise
reg logvalue logmentions primary i.pos i.transfer_year transfer_age games if team
reg logvalue logmentions team i.team#c.logmentions primary i.pos i.transfer_year transfer_age games
rvfplot
predict teamestimate, xb
predict teamresiduals, r
replace teamestimate = . if (team==0)
replace teamresiduals = . if (team==0)
twoway (scatter teamestimate logvalue) (lfit teamestimate logvalue)
twoway (scatter logvalue logmentions if team) (lfitci logvalue logmentions if team)
reg secondary primary logmentions if team
//without media best for top 5
reg logvalue primary i.pos i.transfer_year transfer_age games if team
rvfplot
predict topnomediaestimate, xb
predict topnomediaresiduals, r
twoway (scatter topnomediaestimate logvalue) (lfit topnomediaestimate logvalue)
//>5
reg logvalue logmentions primary i.pos i.transfer_year transfer_age games if valuegroup5
rvfplot
predict fiveestimate if valuegroup5, xb
predict fiveresiduals if valuegroup5, r
reg secondary primary logmentions if valuegroup5
//>10
reg logvalue logmentions primary i.pos i.transfer_year transfer_age games if valuegroup10
rvfplot
predict tenestimate if valuegroup10, xb
predict tenresiduals if valuegroup10, r
reg secondary primary logmentions if valuegroup10
//>15
reg logvalue logmentions primary i.pos i.transfer_year transfer_age games if valuegroup15
rvfplot
predict fiftestimate if valuegroup15, xb
predict fiftresiduals if valuegroup15, r
reg secondary primary logmentions if valuegroup15
//>20
reg logvalue logmentions primary i.pos i.transfer_year transfer_age games if valuegroup20
rvfplot
predict twestimate if valuegroup20, xb
predict twresiduals if valuegroup20, r
twoway (scatter twestimate logvalue) (lfit twestimate logvalue)
twoway (scatter logvalue logmentions if valuegroup20) (lfitci logvalue logmentions if valuegroup20)
reg secondary primary logmentions if valuegroup20
twoway (scatter value mentionseng3 if valuegroup20) (lfitci value mentionseng3 if valuegroup20)
//smaller than 10, 20; larger than 5, 10, 15, 20
reg logvalue logmentions primary i.pos i.transfer_year transfer_age  if valuegroupfirst10 
rvfplot
predict first10inestimate, xb
predict first10inresiduals, r
twoway (scatter first10inestimate value) (lfit first10inestimate value)
twoway (scatter value mentionseng3) (lfitci value mentionseng3)
reg secondary primary mentionseng3 if valuegroupfirst10
//smaller than 20
reg logvalue logmentions primary i.pos i.transfer_year transfer_age  if valuegroupfirst20 
rvfplot
predict first20inestimate, xb
predict first20inresiduals, r
twoway (scatter first20inestimate value) (lfit first20inestimate value)
twoway (scatter value mentionseng3) (lfitci value mentionseng3)
reg secondary primary mentionseng3 if valuegroupfirst20
// INTERACTIONS
reg logvalue logmentions primary c.primary#i.team i.pos i.transfer_year transfer_age games
reg logvalue logmentions c.logmentions#i.team primary i.pos i.transfer_year transfer_age games
reg logvalue logmentions c.logmentions#i.team primary c.primary#i.team i.pos i.transfer_year transfer_age games
reg logvalue logmentions c.logmentions#i.team primary c.primary#i.team i.pos i.transfer_year transfer_age c.transfer_age#i.team games c.games#i.team
reg logvalue logmentions c.logmentions#i.team primary c.primary#i.team i.pos i.pos#i.team i.transfer_year i.transfer_year#i.team transfer_age c.transfer_age#i.team games c.games#i.team
reg logvalue primary team c.primary#i.team
reg logvalue primary c.primary#i.team 


<<<<<<< Updated upstream
=======
reg secondary primary mentionseng3 if valuegroup20

>>>>>>> Stashed changes
