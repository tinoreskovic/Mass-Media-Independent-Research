import csv
from datetime import date, timedelta
import os
import nltk
from nltk.util import ngrams
from nltk.corpus import stopwords
from nltk.stem.porter import PorterStemmer
import numpy as np
import re
import time

def bigrams_XH_ET(top = 20, start_yr = 2015, start_mo = 7, end_yr = 2016, end_mo = 11):
    start_date = date(start_yr, start_mo, 1)
    end_date = date(end_yr, end_mo+1, 1) - timedelta(days=1)
    period_length = (end_date.year - start_date.year) * 12 + (end_date.month - start_date.month) + 1
    #start in C:\Users\Andrew\Google Drive\Mass-Media-Independent-Research
    if 'Derived' in str(os.getcwd()):
        os.chdir(os.path.join('..', '..'))

    ################################################################################

    for paper in ['XH', 'ET']:
        path = 'Andrew\\Raw\\Data\\' + paper
        stop_words = set(stopwords.words('english'))
        # stop_words.update(['.', ',', '"', "'", '?', '!', ':', ';', '(', ')', '[', ']', '{', '}', '--', '>', '<', '/', '\\'])
        stemmer = PorterStemmer()
        tokens_stem = list()
        for filename in os.listdir(path):
            if '.ini' in filename:
                continue
            if paper == 'ET' and '_e' not in filename:
                continue
            with open((os.path.split(os.path.dirname(__file__))[0] + '\\' + 'Raw' + '\\' + 'Data' + '\\' + paper + '\\' + filename), 'r', encoding = 'utf-8') as f:
                text = f.read()
                if 'China' not in text and 'Chinese' not in text and 'Hong Kong' not in text:
                    continue
                if paper == 'XH' and '(Xinhua) --' in text:
                    text = text[(text.index('(Xinhua) --') + 11):-1]
                text = re.sub(r'[^\w\s]', '', text).lower()
                text = re.sub(r'[0-9_]', '', text)
                text = re.sub(r'[^\x00-\x7F]+',' ', text).strip()
                #text = re.sub(r'\b-\b', '', text)
                #text = re.sub(r'\W+', '', text).strip()

                tokens = nltk.wordpunct_tokenize(text)
                for i in tokens:
                    if i in stop_words:
                        continue
                    tokens_stem.append(stemmer.stem(i))
        fdist_bg = nltk.FreqDist(nltk.bigrams(tokens_stem))
        fdist_ug = nltk.FreqDist(tokens_stem)
        with open('Andrew\\Derived\\' + paper + '_ug' + '.csv', 'w', newline = '') as fp:
            a = csv.writer(fp, delimiter=',')
            a.writerows(fdist_ug.most_common(200))
        with open('Andrew\\Derived\\' + paper + '_bg' + '.csv', 'w', newline = '') as fp:
            a = csv.writer(fp, delimiter=',')
            a.writerows(fdist_bg.most_common(200))

    ug = list()
    bg = list()
    diff_ug = list()
    diff_bg = list()
    ug_XH = list()
    ug_XH_count = list()
    bg_XH = list()
    bg_XH_count = list()
    ug_ET = list()
    ug_ET_count = list()
    bg_ET = list()
    bg_ET_count = list()

    with open('Andrew\\Derived\\' + 'XH' + '_ug' + '.csv') as fp:
        a = csv.reader(fp, delimiter=',')
        for row in a:
            ug_XH.append(row[0])
            ug_XH_count.append(int(row[1]))
    with open('Andrew\\Derived\\' + 'XH' + '_bg' + '.csv') as fp:
        a = csv.reader(fp, delimiter=',')
        for row in a:
            bg_XH.append(row[0])
            bg_XH_count.append(int(row[1]))
    with open('Andrew\\Derived\\' + 'ET' + '_ug' + '.csv') as fp:
        a = csv.reader(fp, delimiter=',')
        for row in a:
            ug_ET.append(row[0])
            ug_ET_count.append(int(row[1]))
    with open('Andrew\\Derived\\' + 'ET' + '_bg' + '.csv') as fp:
        a = csv.reader(fp, delimiter=',')
        for row in a:
            bg_ET.append(row[0])
            bg_ET_count.append(int(row[1]))

    print(bg_XH)

    ug = ug_XH
    bg = bg_XH
    ug_XH_share = [i/sum(ug_XH_count) for i in ug_XH_count]
    bg_XH_share = [i/sum(bg_XH_count) for i in bg_XH_count]
    ug_ET_share = [i/sum(ug_ET_count) for i in ug_ET_count]
    bg_ET_share = [i/sum(bg_ET_count) for i in bg_ET_count]

    #how much more does XH use these words?
    for i in range(0, len(ug_XH)):
        try:
            diff = ug_XH_share[i] - ug_ET_share[ug_ET.index(ug_XH[i])]
        except:
            diff = ug_XH_share[i]
        diff_ug.append(diff)
    for i in range(0, len(bg_XH)):
        try:
            diff = bg_XH_share[i] - bg_ET_share[bg_ET.index(bg_XH[i])]
        except:
            diff = bg_XH_share[i]
        diff_bg.append(diff)

    #other side
    for i in range(0, len(ug_ET)):
        if ug_ET[i] in ug_XH:
            continue
        ug.append(ug_ET[i])
        diff = -1* ug_ET_share[i]
        diff_ug.append(diff)
    for i in range(0, len(bg_XH)):
        if bg_ET[i] in bg_XH:
            continue
        bg.append(bg_ET[i])
        diff = -1 * bg_ET_share[i]
        diff_bg.append(diff)

    ug_array = np.array([ug, diff_ug])
    bg_array = np.array([bg, diff_bg])

    print(np.transpose(ug_array))
    print(np.transpose(bg_array))

    with open('Andrew\\Derived\\' + 'rel' + '_ug' + '.csv', 'w', newline = '') as fp:
        a = csv.writer(fp, delimiter=',')
        a.writerows(np.transpose(ug_array))
    with open('Andrew\\Derived\\' + 'rel' + '_bg' + '.csv', 'w', newline = '') as fp:
        a = csv.writer(fp, delimiter=',')
        a.writerows(np.transpose(bg_array))

    bg_array_sort = np.sort(np.transpose(bg_array))
    ug_array_sort = np.sort(np.transpose(ug_array))

    bg_array_sort = bg_array_sort[:, 0]

    print(bg_array_sort)

    bg_array_sort_XH = bg_array_sort[0:top]
    bg_array_sort_ET = (bg_array_sort[::-1])[0:top]

    print('Sorted array, XH')
    print(bg_array_sort_XH)

    print('Sorted array, ET')
    print(bg_array_sort_ET)

    for paper in ['SCMP', 'STD']:
        paper_array_XH = np.zeros((period_length, 2))
        paper_array_ET = np.zeros((period_length, 2))
        for filename in os.listdir('Andrew\\Raw\\Data\\' + paper):
            if 'ini' in filename:
                continue
            with open('Andrew\\Raw\\Data\\' + paper + '\\' + filename, 'r', encoding = 'utf-8') as f:
                article_data = f.readlines()
            if len(article_data) < 5:
                continue
            year = int(article_data[0][:-1])
            month = int(article_data[1][:-1])
            day = int(article_data[2][:-1])
            index = (year - start_date.year) * 12 + (month - start_date.month)
            if index < 0 or (index > period_length - 1):
                continue
            author = article_data[3][:-1].lower()
            author = author.strip()
            article_text_list = article_data[4:]
            article_text = ''
            for line in article_text_list:
                article_text = article_text + line + ' '
            article_text = re.sub(r'[^\w\s]', '', article_text).lower()
            article_text = re.sub(r'[0-9_]', '', article_text)
            article_text = re.sub(r'[^\x00-\x7F]+',' ', article_text).strip()
            if ('xinhua' == author or 'reuters' in author or 'agenc' in author or 'business insider' == author
                or 'ap' == author or 'press' in author or 'afp' == author or 'bloom' in author
                or 'guardian' in author or 'gdn' == author or 'post' in author or 'tribune news service' == author or 'tns' == author
                or 'new york times' == author or 'nyt' == author or 'wire' == author or 'la times' == author or 'kyodo' == author):
                continue
            if 'china' not in article_text and 'chinese' not in article_text and 'hong kong' not in article_text:
                continue
            paper_array_XH[index, 1] += 1
            paper_array_ET[index, 1] += 1
            article_tokens = nltk.wordpunct_tokenize(article_text)
            article_tokens_stem = list()

            for word in article_tokens:
                if word in stop_words:
                    continue
                if len(word) <= 3:
                    article_tokens_stem.append(word)
                    continue
                article_tokens_stem.append(stemmer.stem(word))
            article_bigrams = list(nltk.bigrams(article_tokens_stem))

            #check share of articles containing at least one bigram from XH/ET
            flag_XH = 0
            flag_ET = 0
            for j in range(0, len(bg_array_sort_XH)):
                if str(bg_array_sort_XH[j]) in str(article_bigrams) and flag_XH == 0:
                    paper_array_XH[index, 0] += 1
                    flag_XH = 1
                if str(bg_array_sort_ET[j]) in str(article_bigrams) and flag_ET == 0:
                    paper_array_ET[index, 0] += 1
                    flag_ET = 1
                if flag_XH == 1 and flag_ET == 1:
                    break
        with open('Andrew\\Derived\\' + paper + '_XH_' + str(top) + '_bg' + '.csv', 'w', newline = '') as fp:
            a = csv.writer(fp, delimiter=',')
            a.writerows(paper_array_XH)
        with open('Andrew\\Derived\\' + paper + '_ET_' + str(top) + '_bg' + '.csv', 'w', newline = '') as fp:
            a = csv.writer(fp, delimiter=',')
            a.writerows(paper_array_ET)
    return
