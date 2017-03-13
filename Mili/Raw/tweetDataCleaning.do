*This code takes the raw data file of tweets, 4 observations per disaster, one for each source, 
*and combines the rows such that new variables of tweetactivity by source are generated and dataset is again just n=103 variables"

cd "Users/milisanwalka/Desktop/Brown/Classes/Spring2017/massmediamania/datasets"

use "tweet_data_raw.dta"

gen tweets_toi = n_tweets if source=="timesofindia"
gen tweets_ht = n_tweets if source=="htTweets"
gen tweets_dna = n_tweets if source=="dna"
gen tweets_hindu = n_tweets if source=="the_hindu"

gen avg_rt_toi = avg_rt if source =="timesofindia"
gen avg_rt_ht = avg_rt if source =="htTweets"
gen avg_rt_dna = avg_rt if source =="dna"
gen avg_rt_hindu = avg_rt if source =="the_hindu"

gen avg_fav_toi = avg_fav if source =="timesofindia"
gen avg_fav_ht = avg_fav if source =="htTweets"
gen avg_fav_dna = avg_fav if source =="dna"
gen avg_fav_hindu = avg_fav if source =="the_hindu"

gen max_rt_toi = avg_rt if source =="timesofindia"
gen max_rt_ht = avg_rt if source =="htTweets"
gen max_rt_dna = avg_rt if source =="dna"
gen max_rt_hindu = avg_rt if source =="the_hindu"

gen max_fav_toi = avg_fav if source =="timesofindia"
gen max_fav_ht = avg_fav if source =="htTweets"
gen max_fav_dna = avg_fav if source =="dna"
gen max_fav_hindu = avg_fav if source =="the_hindu"

drop source n_tweets link avg_rt avg_fav max_rt max_fav

egen toi_tweets = sum(tweets_toi), by(disasterid)
egen ht_tweets = sum(tweets_ht), by(disasterid)
egen dna_tweets = sum(tweets_dna), by(disasterid)
egen hindu_tweets = sum(tweets_hindu), by(disasterid)

egen toi_avg_rt = sum(avg_rt_toi), by(disasterid)
egen ht_avg_rt = sum(avg_rt_ht), by(disasterid)
egen dna_avg_rt = sum(avg_rt_dna), by(disasterid)
egen hindu_avg_rt = sum(avg_rt_hindu), by(disasterid)

egen toi_avg_fav = sum(avg_fav_toi), by(disasterid)
egen ht_avg_fav = sum(avg_fav_ht), by(disasterid)
egen dna_avg_fav = sum(avg_fav_dna), by(disasterid)
egen hindu_avg_fav = sum(avg_fav_hindu), by(disasterid)

egen toi_max_rt = sum(max_rt_toi), by(disasterid)
egen ht_max_rt = sum(max_rt_ht), by(disasterid)
egen dna_max_rt = sum(max_rt_dna), by(disasterid)
egen hindu_max_rt= sum(max_rt_hindu), by(disasterid)

egen toi_max_fav = sum(max_fav_toi), by(disasterid)
egen ht_max_fav = sum(max_fav_ht), by(disasterid)
egen dna_max_fav = sum(max_fav_dna), by(disasterid)
egen hindu_max_fav = sum(max_fav_hindu), by(disasterid)

drop tweets_toi tweets_ht tweets_dna tweets_hindu

drop avg_rt_toi avg_rt_ht avg_rt_dna avg_rt_hindu

drop avg_fav_toi avg_fav_ht avg_fav_dna avg_fav_hindu

drop max_rt_toi max_rt_ht max_rt_dna max_rt_hindu

drop max_fav_toi max_fav_ht max_fav_dna max_fav_hindu

drop duplicates
