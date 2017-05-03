import csv
import datetime
from datetime import date, timedelta
import os
import numpy as np
import re

def build_data(paper, start_yr = 2014, start_mo = 4, end_yr = 2017, end_mo = 2, d = 0):
    if 'Derived' in str(os.getcwd()):
        os.chdir(os.path.join('..', '..'))

    start_date = date(start_yr, start_mo, 1)
    end_date = date(end_yr, end_mo+1, 1) - timedelta(days=1)

    coll_act = list()
    legco_pb = list()
    legco_pd = list()
    legco_i_l = list()
    ccp = list()

    with open('Andrew\\Derived\\collective_action.txt', 'r') as f_coll_act:
        for line in f_coll_act:
            coll_act.append((re.sub(r'[^\w\s]', '', line.lower())).strip())
    with open('Andrew\\Derived\\legco56_pb.txt', 'r') as f_legco_pb:
        for line in f_legco_pb:
            legco_pb.append((re.sub(r'[^\w\s]', '', line.lower())).strip())
    with open('Andrew\\Derived\\legco56_pd.txt', 'r') as f_legco_pd:
            for line in f_legco_pd:
                legco_pd.append((re.sub(r'[^\w\s]', '', line.lower())).strip())
    with open('Andrew\\Derived\\legco56_i_l.txt', 'r') as f_legco_i_l:
        for line in f_legco_i_l:
            legco_i_l.append((re.sub(r'[^\w\s]', '', line.lower())).strip())
    with open('Andrew\\Derived\\ccp1516.txt', 'r') as f_ccp:
        for line in f_ccp:
            ccp.append((re.sub(r'[^\w\s]', '', line.lower())).strip())

    author_array = np.array([])
    month_count = int(end_date.year - start_date.year)*12 + int(end_date.month-start_date.month) + 1
    #'xinhua count' 'collective action count' 'pb count' 'pd count' 'local count' 'leader count' 'article count' 'acquired'
    data = np.zeros((month_count, 8))

    for filename in os.listdir('Andrew\\Raw\\Data\\' + paper):
        if '.txt' not in filename:
            continue
        with open('Andrew\\Raw\\Data\\' + paper + '\\' + filename, 'r', encoding = 'utf-8') as f:
            article_data = f.readlines()
            if len(article_data) < 5:
                continue
            year = int(article_data[0][:-1])
            month = int(article_data[1][:-1])
            day = int(article_data[2][:-1])
            author = re.sub(r'[^\w\s]', '', article_data[3][:-1]).lower()
            author = re.sub(r'[^\x00-\x7F]+',' ', author).strip()
            author_array = np.append(author_array, [author])

            article_text_list = article_data[4:]
            article_text = ''
            for line in article_text_list:
                article_text = article_text + line + ' '

            article_text = re.sub(r'[^\w\s]', '', article_text)
            article_text = re.sub(r'[0-9_]', '', article_text).lower()
            article_text = re.sub(r'[^\x00-\x7F]+',' ', article_text).strip()

            if d == 1 and 'china' not in article_text and 'chinese' not in article_text and 'hong kong' not in article_text:
                continue
            index = (year - int(start_date.year)) * 12 + (month - int(start_date.month))
            if index > month_count - 1:
                continue
        if 'xinhua' in author or 'xinhua' in article_text:
            data[index, 0] += 1

        for line in coll_act:
            if line in article_text:
                if "gather" in line and "gatherer" in article_text:
                    continue
                if "assembl" in line and "assembler" in article_text:
                    continue
                data[index, 1] += 1
                break

        for line in legco_pb:
            if line in article_text or 'leung chunying' in article_text:
                data[index, 2] += 1
                data[index, 4] += 1
                break
        for line in legco_pd:
            if line in article_text:
                data[index, 3] += 1
                data[index, 4] += 1
                break
        for line in legco_i_l:
            if line in article_text:
                data[index, 4] += 1
                break

        for line in ccp:
            if line in article_text:
                data[index, 5] += 1
                break

        data[index, 6] += 1

        if year >= 2016 and month >= 4:
            data[index, 7] = 1
    author_array = np.unique(author_array)

    domestic = ''
    if d == 1:
        domestic = '_domestic'
    np.savetxt('Andrew\\Derived\\' + paper + domestic + '_data.csv', data, delimiter = ',')
    np.savetxt('Andrew\\Derived\\' + paper + domestic + '_author.csv', author_array, delimiter = ',', fmt = '%s')

    return
