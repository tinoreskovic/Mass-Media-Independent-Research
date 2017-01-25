import numpy as np
import csv
import os
import re
newsmonth = np.zeros((17, 5))
authorarray = np.array([])

#'index' 'xinhua' 'collcount' 'corrcount' 'artcount'

#artunit = np.zeros(25270, 3)
#artunit[0, 0] = 'index'
#newsmonth[0, 1] = 'controcount'
#newsmonth[0, 2] = 'artcount'

for filename in os.listdir():
    if filename.endswith(".txt") and filename != 'corr.txt' and filename != 'coll.txt' and filename != 'legco56.txt' and filename != 'ccp1516.txt':
        with open(filename, 'r', encoding = 'utf-8') as f:
            data = f.readlines()
            year = int(data[0][:-1])
            month = int(data[1][:-1])
            day = int(data[2][:-1])
            author = data[3][:-1]
            authorarray = np.append(authorarray, [author])
            try:
                text = data[4].lower()
            except:
                continue
            index = year%2015 * 12 - 7 + month
            newsmonth[index, 0] = index
        #if 'hong kong' not in text and 'china' not in text:
        #    continue
        if 'xinhua' in author or 'xinhua' in text:
            newsmonth[index, 1] += 1
        with open('coll.txt', 'r') as fcoll:
            for line in fcoll:
                if line in text:
                    newsmonth[index, 2] += 1
        with open('legco56.txt', 'r') as legco:
            for line in legco:
                line1 = re.sub(r'\W+', ' ', line).lower()
                if line1 in text:
                    newsmonth[index, 3] += 1
        with open('ccp1516.txt', 'r') as ccp:
            for line in ccp:
                line1 = re.sub(r'\W+', ' ', line).lower()
                if line1 in text:
                    newsmonth[index, 3] += 1
        newsmonth[index, 4] += 1

print(newsmonth)

authorarray = np.unique(authorarray)

np.savetxt("scmp.csv", newsmonth, delimiter = ',')
np.savetxt("scmp_author.csv", authorarray, delimiter = ',', fmt = '%s')
