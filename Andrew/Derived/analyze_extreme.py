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
if 'Derived' in str(os.getcwd()):
    os.chdir(os.path.join('..', '..'))
for paper in ['XH', 'ET']:
    path = 'Andrew\\Raw\\Data\\' + paper
    stop_words = set(stopwords.words('english'))
    #stop_words.update(['.', ',', '"', "'", '?', '!', ':', ';', '(', ')', '[', ']', '{', '}', '--'])
    stemmer = PorterStemmer()
    tokens_stem = list()
    for filename in os.listdir(path):
        if '.ini' in filename:
            continue
        if paper == 'ET':
            enc = 'utf-8'
        elif paper == 'XT':
            enc = 'ANSI'
        if paper == 'ET' and '_e' not in filename:
            continue
        with open((os.path.split(os.path.dirname(__file__))[0] + '\\' + 'Raw' + '\\' + 'Data' + '\\' + paper + '\\' + filename), 'r', encoding = 'utf-8') as f:
            text = f.read()
            text = re.sub("^\d+\s|\s\d+\s|\s\d+$", " ", text)
            text = re.sub(r'\b-\b', '', text)
            text = re.sub(r'\W+', ' ', text).strip()
            if 'China' not in text and 'Hong Kong' not in text:
                continue
            tokens = nltk.wordpunct_tokenize(text)
            for i in tokens:
                if i.lower() in stop_words:
                    continue
                tokens_stem.append(stemmer.stem(i.lower()))
    fdist_bg = nltk.FreqDist(nltk.bigrams(tokens_stem))
    fdist_ug = nltk.FreqDist(tokens_stem)
    print(paper)
    print(fdist_ug.most_common(200))
    print(fdist_bg.most_common(200))
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

for paper in ['XH', 'ET']:
    with open('Andrew\\Derived\\' + paper + '_ug' + '_rel' + '.csv', 'w', newline = '') as fp:
        a = csv.writer(fp, delimiter=',')
        a.writerows(np.transpose(ug_array))
    with open('Andrew\\Derived\\' + paper + '_bg' + '_rel' + '.csv', 'w', newline = '') as fp:
        a = csv.writer(fp, delimiter=',')
        a.writerows(np.transpose(bg_array))
