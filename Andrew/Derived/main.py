from analyze import build_data
from analyze_extreme import bigrams_XH_ET
from analyze_extreme_cos import cos_dist_XH_ET
from datetime import date

bigrams_XH_ET(20, 2014, 4, 2017, 2)
bigrams_XH_ET(30, 2014, 4, 2017, 2)
cos_dist_XH_ET(2014, 4, 2017, 2)

for paper in ['SCMP', 'STD']:
    for d in [0, 1]:
        build_data(paper, 2014, 4, 2017, 2, d)
