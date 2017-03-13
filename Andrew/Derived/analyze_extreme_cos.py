import csv
from datetime import date
import os
import nltk
from nltk.util import ngrams
from nltk.corpus import stopwords
from nltk.stem.porter import PorterStemmer
import numpy as np
import re
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

def cos_dist_XH_ET(start_yr = 2015, start_mo = 7, end_yr = 2016, end_mo = 11):
    start_date = date(start_yr, start_mo, 1)
    end_date = date(end_yr, end_mo, 30)
    period_length = (end_date.year - start_date.year) * 12 + (end_date.month - start_date.month) + 1
    #start in C:\Users\Andrew\Google Drive\Mass-Media-Independent-Research
    if 'Derived' in str(os.getcwd()):
        os.chdir(os.path.join('..', '..'))

    for paper_comp in ['XH', 'ET']:
        path = 'Andrew\\Raw\\Data\\' + paper_comp
        paper_aggr = ''

        for filename in os.listdir(path):
            if '.ini' in filename:
                continue
            if paper_comp == 'ET' and '_e' not in filename:
                continue
            with open((os.path.split(os.path.dirname(__file__))[0] + '\\' + 'Raw' + '\\' + 'Data' + '\\' + paper_comp + '\\' + filename), 'r', encoding = 'utf-8') as f:
                text = f.read()
            if 'China' not in text and 'Chinese' not in text and 'Hong Kong' not in text:
                continue
            if paper_comp == 'XH' and '(Xinhua) --' in text:
                text = text[(text.index('(Xinhua) --') + 11):-1]
            text = re.sub(r'[^\w\s]', '', text).lower()
            text = re.sub(r'[0-9_]', '', text)
            text = re.sub(r'[^\x00-\x7F]+',' ', text).strip()
            paper_aggr = paper_aggr + ' ' + text

        vectorizer = TfidfVectorizer(ngram_range=(1, 2))
        stemmer = PorterStemmer()
        for paper in ['SCMP', 'STD']:
            month_article = [[] for i in range(period_length)]
            # month_cos_array = [[] for i in range(period_length)]
            for i in range(period_length):
                month_article[i].append(paper_aggr)
            month_cos = [0] * period_length
            print(paper)
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
                article_text = article_data[4]
                if ('xinhua' == author or 'reuters' in author or 'agenc' in author or 'business insider' == author
                    or 'ap' == author or 'press' in author or 'afp' == author or 'bloom' in author
                    or 'guardian' in author or 'gdn' == author or 'post' in author or 'tribune news service' == author or 'tns' == author
                    or 'new york times' == author or 'nyt' == author or 'wire' == author or 'la times' == author or 'kyodo' == author):
                    continue
                if 'China' not in article_text and 'Chinese' not in article_text and 'Hong Kong' not in article_text:
                    continue
                article_text = re.sub(r'[^\w\s]', '', article_text)
                article_text = re.sub(r'[0-9_]', '', article_text).lower()
                article_text = re.sub(r'[^\x00-\x7F]+',' ', article_text).strip()
                article_text = stemmer.stem(article_text)
                month_article[index].append(article_text)

            for i in range(period_length):
                month_vect = month_article[i]
                month_vect_tfidf = vectorizer.fit_transform(month_vect)
                cos_array = cosine_similarity(month_vect_tfidf[0:1], month_vect_tfidf)
                print(cos_array)
                month_cos[i] = sum(cos_array[0][1:len(cos_array[0])])/(len(cos_array[0])-1)
            with open('Andrew\\Derived\\' + paper + '_cos_' + paper_comp + '_.csv', 'w', newline = '') as fp:
                a = csv.writer(fp, delimiter=',')
                a.writerow(month_cos)
    return
