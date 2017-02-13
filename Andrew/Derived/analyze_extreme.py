import csv
import datetime
import os
import nltk
from nltk.util import ngrams
from nltk.corpus import stopwords
from nltk.stem.porter import PorterStemmer
import numpy as np
import re
import time

#start in C:\Users\Andrew\Google Drive\Mass-Media-Independent-Research
print(os.getcwd())
for paper in ['XH', 'ET']:
    path = 'Andrew\\Raw\\Data\\' + paper
    stop_words = set(stopwords.words('english'))
    stop_words.update(['.', ',', '"', "'", '?', '!', ':', ';', '(', ')', '[', ']', '{', '}']) # remove it if you need punctuation
    stemmer = PorterStemmer()
    tokens_stem = list()
    bgs = list()

    for filename in os.listdir(path):
        if '.ini' in filename:
            continue
        # if paper == 'ET' and '_e' not in filename:
        #     continue
        with open((os.path.split(os.path.dirname(__file__))[0] + '\\' + 'Raw' + '\\' + 'Data' + '\\' + paper + '\\' + filename), 'r', encoding = 'utf-8') as f:
            text = f.read()
            text = re.sub(r'\W+', ' ', text).strip()
            if 'China' not in text and 'Hong Kong' not in text:
                continue
            tokens = nltk.wordpunct_tokenize(text)
            for i in tokens:
                if i.lower() in stop_words:
                    continue
                tokens_stem.append(stemmer.stem(i.lower()))
        bgs.append(list(nltk.bigrams(text.lower())))

    fdist = nltk.FreqDist(tokens_stem)
    fdist_bg = nltk.FreqDist(bgs)
    print(paper)
    print(fdist.most_common(250))
    print(fdist_bg.most_common(10))
    with open('Andrew\\Derived\\' + paper + '.csv', 'w', newline = '') as fp:
        a = csv.writer(fp, delimiter=',')
        a.writerows(fdist.most_common(250))
