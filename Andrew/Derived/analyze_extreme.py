import csv
import datetime
import os
import nltk
import numpy as np
import re
from nltk.util import ngrams

def extreme(paper):
    ngram_list = []
    for filename in os.listdir('..\\Raw\\Data\\' + paper)
        with open(filename, 'r', encoding = 'utf-8') as f:
            text = f.read()
            text = re.sub(r'\W+', ' ', text).strip()
            tokens = nltk.word_tokenize(text)
            bgs = nltk.bigrams(tokens)
            



    return;
