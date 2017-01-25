from datetime import timedelta, date
import requests
from bs4 import BeautifulSoup
import numpy as np
import time
import re

#THE STANDARD

def daterange(start_date, end_date):
    for n in range(int ((end_date - start_date).days)):
        yield start_date + timedelta(n)

#index matrices... 16 months
articlecount = np.zeros((1, 17))

#loop through dates
start_date = date(2016, 11, 1)
end_date = date(2016, 12, 1)

for today in daterange(start_date, end_date):
    activeindex = (today.year)%2015 * 12 - 7 + today.month
    base = 'http://www.thestandard.com.hk/'
    url = 'http://www.thestandard.com.hk/archive.php?date=' + today.strftime('%Y-%m-%d')
    response = requests.get(url)
    html = response.content
    soup = BeautifulSoup(html, 'html.parser')
    #print soup

    #every day's page has a new linkarray
    linkarray = np.array([])
    for link in soup.find_all('a'):
        linkname = str(link.get('href'))
        if 'section-news' in linkname and 'id=' in linkname:
            linkarray = np.append(linkarray, [base + linkname])
    linkarray = np.unique(linkarray)

    #loop through article text, extract date, author, analyze text
    for article in linkarray:
        response1 = 'ThisIsAPlaceholder'
        while '200' not in str(response1):
            try:
                response1 = requests.get(article)
            except:
                print('Waiting 60')
                time.sleep(60)
                try:
                    response1 = requests.get(article)
                except:
                    print('Waiting 120')
                    time.sleep(120)
                    try:
                        response1 = requests.get(article)
                    except:
                        print('Waiting 300')
                        time.sleep(300)
                        try:
                            response1 = requests.get(article)
                        except:
                            print('Waiting 600')
                            time.sleep(600)
                            response1 = requests.get(article)
        #add to articlecount -- overall counts of articles by month
        articlecount[0, activeindex] = articlecount[0, activeindex] + 1
        html1 = response1.content
        soup1 = BeautifulSoup(html1, 'html.parser')

        if len(soup1.find_all(attrs={"href":"sections_news_list.php?sid=17"})) > 1:
            continue

        text = str(soup1.find_all(attrs={"class":"content"}))
        author = str(soup1.find_all(attrs={"class":"writer"}))
        #check for cited news agencies
        if "><" in author:
            sent = -2
            try:
                author = re.split('<p>', text)[sent]
            except:
                continue
            #check for alternative format cited news agencies
            if len(author) > 30:
                author = (re.split('\.', author)[-1]).strip()
            #check for extra source info more specific than agency

            while author.isupper() == False:
                sent = sent - 1
                try:
                    author = re.split('<p>', text)[sent]
                except:
                    author = 'None'
                    break

        author = re.sub(re.compile('<.*?>'), ' ', author)
        author = re.sub(r'\W+', ' ', author).strip()
        author = author.lower()
        print(author)

        text2 = re.sub(re.compile('<.*?>'), ' ', text)
        arttext = re.sub(r'\W+', ' ', text2).strip()

        f = open('std' + str(activeindex) + "_" + str(articlecount[0, activeindex]) + ".txt","w", encoding='utf-8')
        f.write(str(today.year) + '\n' + str(today.month) + '\n' + str(today.day) + '\n' + author + '\n' + arttext)
        f.close()
