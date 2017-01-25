import time
import requests
from bs4 import BeautifulSoup
import re
import numpy as np

articlecount = np.zeros((1, 17))
banlist = ['http://www.scmp.com/news/hong-kong/economy/article/2049746/lawmakers-across-political-spectrum-grill-administration-hk11','http://www.scmp.com/week-asia/opinion/article/2049327/three-clues-reading-chinese-economys-fortune-2017','http://www.scmp.com/news/china/policies-politics/article/2049621/128-days-chinas-guantanamo-writer-tells-secret','http://www.scmp.com/news/china/diplomacy-defence/article/2049769/beijing-demands-singapore-abide-one-china-principle','http://www.scmp.com/week-asia/geopolitics/article/2049803/china-has-always-kept-mum-singapores-defence-ties-taipei-so','http://www.scmp.com/news/hong-kong/article/2049866/chris-patten-students-hong-kong-not-nation-state-do-not-deceive']
for i in range(0, 189 + 1):
    time.sleep(2.5)
    print(i)
    page = 'page=' + str(i) + '&'
    #page=1&
    base = 'http://www.scmp.com'
    url = 'http://www.scmp.com/content/search/articles/news?' + page + 'f[0]=ds_created%3A%5B2016-11-01T00%3A00%3A00Z%20TO%202016-11-31T23%3A59%3A59Z%5D&f[1]=im_field_section%3A91'
    #url = 'http://www.scmp.com/content/search/articles/news?' + page + 'f[0]=ds_created%3A%5B2015-07-01T00%3A00%3A00Z%20TO%202016-10-31T23%3A59%3A59Z%5D&f[1]=im_field_section%3A91'
    response = requests.get(url)
    html = response.content
    soup = BeautifulSoup(html, 'html.parser')

    #every page has a new linkarray
    linkarray = np.array([])
    for link in soup.find_all('a'):
        linkname = str(link.get('href'))
        #print(linkname)
        if '/news/' in linkname and 'article' in linkname and 'scmp' not in linkname and '#comment' not in linkname:
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

        html1 = response1.content
        soup1 = BeautifulSoup(html1, 'html.parser')

        #get date, index
        #timestamp = soup1.find(attrs={"itemprop":"dateCreated"})
        timestamp = soup1.find(attrs={"name":"cXenseParse:recs:publishtime"})
        if timestamp is None:
            continue
        year = int(str(timestamp)[15:19])
        month = int(str(timestamp)[20:22])
        day = int(str(timestamp)[23:25])
        activeindex = year%2015 * 12 + month - 7
        if activeindex > 16 or (article in banlist and i > 0):
            continue
        #add to articlematrix -- overall counts of articles by month
        articlecount[0, activeindex] = articlecount[0, activeindex] + 1

        if soup1.find_all(attrs={"name":"cXenseParse:scp-author"}) is not None:
            author = str(soup1.find_all(attrs={"name":"cXenseParse:scp-author"})).strip()
        else:
            author = ''
        author = re.sub(re.compile('<.*?\"|\".*?>'), ' ', author)
        author = re.sub(r'\W+', ' ', author).strip()
        author = author.lower()

        text = str(soup1.find_all('p'))
        text = re.sub(re.compile('<.*?>|Comments:'), ' ', text)
        arttext = re.sub(r'\W+', ' ', text).strip()

        f = open(str(activeindex) + "_" + str(articlecount[0, activeindex]) + ".txt","w", encoding='utf-8')
        f.write(str(year) + '\n' + str(month) + '\n' + str(day) + '\n' + author + '\n' + arttext)
        f.close()
