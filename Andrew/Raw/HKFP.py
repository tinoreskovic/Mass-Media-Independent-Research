import time
from datetime import timedelta, date
import requests
from bs4 import BeautifulSoup
import numpy as np
import re
#HKFP

def daterange(start_date, end_date):
    for n in range(int ((end_date - start_date).days)):
        yield start_date + timedelta(n)

#index matrices... 17 months
articlecount = np.zeros((1, 17))

#loop through dates
#start_date = date(2015, 7, 1)
#end_date = date(2016, 11, 1)

start_date = date(2016, 11, 1)
end_date = date(2016, 12, 1)

for today in daterange(start_date, end_date):
    print(today)
    activeindex = (today.year)%2015 * 12 - 7 + today.month
    url = 'https://www.hongkongfp.com/' + today.strftime('%Y/%m/%d')
    response = requests.get(url)
    html = response.content
    soup = BeautifulSoup(html, 'html.parser')
    #print soup

    #every day has a new linkarray, vs monthly counts
    linkarray = np.array([])
    for link in soup.find_all('a'):
        linkname = str(link.get('href'))
        if url in linkname and url != linkname:
            linkarray = np.append(linkarray, [linkname])
    linkarray = np.unique(linkarray)
    #extract text in articles, analyze
    time.sleep(5)
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
        html1 = response1.content
        soup1 = BeautifulSoup(html1, 'html.parser')

        #drop opinion / voices
        articlesection = str(soup1.find(attrs={"property":"article:section"}))
        if "Voices" in articlesection or "Comment" in articlesection:
            continue
        articlecount[0, activeindex] = articlecount[0, activeindex] + 1
        text = str(soup1.find_all("p"))

        #find authors
        if soup1.find("div", "meta-item author") is not None:
            author = str(soup1.find("div", "meta-item author").get_text()).strip()
        else:
            author = ''
        #delay

        author = re.sub(re.compile('<.*?>'), ' ', author)
        author = re.sub(r'\W+', ' ', author).strip()
        author = author.lower()
        print(author)

        text2 = re.sub(re.compile('<.*?>'), ' ', text)
        arttext = re.sub(r'\W+', ' ', text2).strip()
        f = open('hkfp' + str(activeindex) + "_" + str(articlecount[0, activeindex]) + ".txt","w", encoding='utf-8')
        f.write(str(today.year) + '\n' + str(today.month) + '\n' + str(today.day) + '\n' + author + '\n' + arttext)
        f.close()
        time.sleep(2)
