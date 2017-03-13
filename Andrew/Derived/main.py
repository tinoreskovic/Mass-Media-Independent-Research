from analyze import build_data
from analyze_extreme_cos import cos_dist_XH_ET
from datetime import date

# bigrams_XH_ET(20, 2015, 7, 2016, 11)
# bigrams_XH_ET(30, 2015, 7, 2016, 11)
# cos_dist_XH_ET(2015, 7, 2016, 11)

for paper in ['SCMP', 'STD']:
    for d in [0, 1]:
        build_data(paper, date(2015, 7, 1), date(2016, 11, 30), d)
        build_data(paper, date(2015, 7, 1), date(2016, 11, 30), d)
