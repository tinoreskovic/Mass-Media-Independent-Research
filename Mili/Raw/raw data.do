/*

1. Disaster data 
Source: http://www.emdat.be/database
Route: HomePage-->Disaster List --> Select following filters:
Filters: Period from 2010:2016, Country: India, DisasterType: [Biological Climatological Geophysical Hydrological Metereological], Total Deaths, Total Affacted] 

This enabled the direct creation of following variables: startdate, endate, country, location, disastertype, disastersubtype, totaldeaths, totalaffected

Additional Variables generate in excel using basic functions:
	(i) Year = year(startdate)

	(ii) enddatenews = enddate+10 [This suggests the end of the news search period, assumtion: disaster reporting reduces to negligible 10 days after disaster ends]

	
	Location specific: 

		(iii) onlystateslocation = 1 if location is specified just in terms of states; else 0

		(iv) 3statesormorelocation = 1 if location description includes more than 3 states
		
		(v) urbanstateslocationcount = number of 'urban states' in location description
		
		(vi) urbancitylocation = 1 if location description contains name of atleast one of the top 20 urban cities
		
		(vii) northeastlocation = 1 if location description contains no state outside the 7 'NorthEast' States

******************************************************************************
		
		
2. News Coverage Data
Source: Access World News DataBase

Number of articles in 4 leading English dailies for a given disaster. Notes:
	(i) date range 'startdate : enddatenews'		
	(ii) All pairwise combinations of search terms chosen and maximum number of articles used as final 'coverage' value

This enabled the direct creation of following variale: coverage

******************************************************************************

3. Google Trends ' Reader Interest' Data
Source: Google Trends

This enabled the direct creation of the following variables: disastersearch, constanttermsearch, altconstantterm
*/


replace totaldeaths=0 if totaldeaths==.

replace totalaffected=totaldeaths if totalaffected==.
//40 changes made, i.e. only ~60% total affected data available through emdat

replace totalaffected=totaldeaths if totalaffected<totaldeaths
//3 changes made, could be tabulating errors
//tin: meaning these entries were such in the original dataset that you accessed online?

gen threestatesandurbanlocation = 1 if threestatesormorelocation==1 & urbanstateslocationcount>0

replace threestatesandurbanlocation=0 if threestatesandurbanlocation==.

gen twourbanstateslocation=1 if urbanstateslocationcount>1

replace twourbanstateslocation=0 if twourbanstateslocation==.

gen urbanlocation=1 if urbancitylocation==1 | threestatesandurbanlocation==1 | twourbanstateslocation==1

replace urbanlocation=0 if urbanlocation==.

tab urbanlocation

gen ratio1 = disastersearch/altconstantterm

