#Scrapes Xinhua English and Epoch Times, the most pro- and anti-China outlets, respectively
from bs4 import BeautifulSoup
from datetime import timedelta, date
import numpy as np
import os
import time
import re
import requests

#Epoch Times
def scrape_et(pg_count):
    #start in C:\Users\Andrew\Google Drive\Mass-Media-Independent-Research
    if 'Raw' in str(os.getcwd()):
        os.chdir(os.path.join('..', '..'))
    article_count = 0
    for i in range(1, pg_count + 1):
        pg = 'http://www.theepochtimes.com/n3/front/more-top-stories/page/' + str(i) + '/'
        pg_html = BeautifulSoup((requests.get(pg)).content, 'html.parser')
        pg_tags = pg_html.find_all('li', attrs={'class':'category-bg'})
        for link in pg_tags:
            article_tag = str(link)
            article = article_tag[(article_tag.index('href') + 6) : (article_tag.index('\">', article_tag.index('href')))]
            article_html = BeautifulSoup((requests.get(article)).content, 'html.parser')
            epoch_tag = article_html.find('a', attrs={'rel':'publisher'})
            epoch = ''
            if epoch_tag is not None:
                epoch = '_e'
            text_tag = str(article_html.find_all('div', attrs={'id':'content'}))
            text = re.sub(re.compile('<.*?>'), ' ', str(text_tag))
            try:
                os.makedirs('Andrew\\Raw\\Data\\ET')
            except:
                pass
            f = open('Andrew\\Raw\\Data\\ET\\' + 'ET_' + str(article_count) + epoch + '.txt','w', encoding='utf-8')
            f.write(text)
            f.close()
            article_count += 1
    return;

#Xinhua
def scrape_xh():
    #start in C:\Users\Andrew\Google Drive\Mass-Media-Independent-Research
    if 'Raw' in str(os.getcwd()):
        os.chdir(os.path.join('..', '..'))
    article_count = 0
    #http://www.xinhuanet.com/english/china/topnews.htm
    for i in range(1, 9):
        if i == 1:
            pg = 'http://www.xinhuanet.com/english/latestnews_more.htm'
        else:
            pg = 'http://www.xinhuanet.com/english/latestnews_more_' + str(i) + '.htm'
        pg_html = BeautifulSoup((requests.get(pg)).content, 'html.parser')
        pg_tags = pg_html.find_all('td', attrs={'height':'25', 'valign':'top', 'align':'left', 'class':'lan14_geo'})
        for link in pg_tags:
            article_tag = str(link)
            article = article_tag[(article_tag.index('href') + 6) : (article_tag.index('htm', article_tag.index('href')) + 3)]
            if 'photo' in article:
                continue
            print(article)
            article_html = BeautifulSoup((requests.get(article)).content, 'html.parser')
            text_tag = article_html.find_all('div', attrs={'id':'Content', 'class':'artTxt'})
            text = re.sub(re.compile('<.*?>'), ' ', str(text_tag))
            try:
                os.makedirs('Andrew\\Raw\\Data\\XH')
            except:
                pass
            f = open('Andrew\\Raw\\Data\\XH\\' + 'XH_' + str(article_count) + '.txt','w', encoding='utf-8')
            f.write(text)
            f.close()
            article_count += 1
    return;

scrape_et(100)
