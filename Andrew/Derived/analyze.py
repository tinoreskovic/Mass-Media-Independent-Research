import csv
import datetime
import os
import numpy as np
import re

def build_data(paper, start_date, end_date, d = 0)
    month_count = int(end_date.year - start_date.year)*12 + int(end_date.month-start_date.month)

    #'xinhua count' 'collective action count' 'leader count' 'article count'
    data = np.array((month_count, 4))

    for filename in os.listdir('..\\Mass Media\\Andrew\\Raw\\' + paper)
        with open(filename, 'r', encoding = 'utf-8') as f:
            article_data = f.readlines()
            year = int(article_data[0][:-1])
            month = int(article_data[1][:-1])
            day = int(article_data[2][:-1])
            author = article_data[3][:-1]
            author_array = np.append(authorarray, [author])
            try:
                text = article_data[4]
                text = re.sub(r'\W+', ' ', text).lower()
            except:
                text = 'Multimedia'
                continue
            if d == 1:
                if 'china' in text or 'hong kong' in text:
                    continue
            index = (year - int(start_date.year)) * 12 + (month - int(start_date.month))

        if 'xinhua' in author or 'xinhua' in text:
            data[index, 1] += 1
        with open('collective_action.txt', 'r') as f_collact:
            for line in f_collact:
                if line in text:
                    data[index, 2] += 1
        with open('legco56.txt', 'r') as f_legco:
            for line in f_legco:
                line1 = re.sub(r'\W+', ' ', line).lower()
                if line in text:
                    data[index, 3] += 1
        with open('ccp1516.txt', 'r') as f_ccp:
            for line in f_ccp:
                line1 = re.sub(r'\W+', ' ', line).lower()
                if line1 in text:
                    data[index, 3] += 1
        data[index, 4] += 1

    author_array = np.unique(author_array)

    np.savetxt('..\\Mass Media\\Andrew\\Derived\\' + paper + '_data.csv', data, delimiter = ',')
    np.savetxt('..\\Mass Media\\Andrew\\Derived\\' + paper + '_author.csv', author_array, delimiter = ',', fmt = '%s')

return
