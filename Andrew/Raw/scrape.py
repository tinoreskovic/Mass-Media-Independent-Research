from bs4 import BeautifulSoup
from datetime import timedelta, date, datetime
import numpy as np
import os
import time
import re
import requests

###############################scmp#############################################
def scrape_scmp(start_date = date(2014, 3, 1), end_date = date(2017, 2, 28)):
    #start in C:\Users\Andrew\Google Drive\Mass-Media-Independent-Research
    if 'Raw' in str(os.getcwd()):
        os.chdir(os.path.join('..', '..'))

    def daterange(start_date, end_date):
        for n in range(int((end_date - start_date).days)):
            yield start_date + timedelta(n)

    main_pg = 'http://www.scmp.com'
    archive_pg1 = 'http://www.scmp.com/content/search/articles/news?f[0]=ds_created%3A%5B' + str(start_date) + 'T00%3A00%3A00Z%20TO%20' + str(end_date) + 'T23%3A59%3A59Z%5D&f[1]=im_field_section%3A91'
    archive_pg1_html = BeautifulSoup((requests.get(archive_pg1)).content, 'html.parser')
    archive_pglast_tag = str(archive_pg1_html.find_all(title='Go to last page'))

    page_count = int(archive_pglast_tag[int(archive_pglast_tag.index('news?page') + 10):int(archive_pglast_tag.index('&amp'))])
    month_count = int((end_date.year - start_date.year)*12 + (end_date.month - start_date.month))
    article_count = 0

    article_array = np.array([])

    for i in range(0, page_count):
        print('Page ' + str(i + 1) + '/' + str(page_count))
        archive_pg = 'http://www.scmp.com/content/search/articles/news?' + 'page=' + str(i) + '&' + '&f[0]=ds_created%3A%5B' + str(start_date) + 'T00%3A00%3A00Z%20TO%20' + str(end_date) + 'T23%3A59%3A59Z%5D&f[1]=im_field_section%3A91'
        archive_pg_html = BeautifulSoup((requests.get(archive_pg)).content, 'html.parser')
        for link in archive_pg_html.find_all('h3', attrs={'class':'title'}):
            article_tag = str(link)
            article = main_pg + article_tag[(article_tag.index('href') + 6) : (article_tag.index('\">', article_tag.index('href')))]
            article_array = np.append(article_array, [article])
            try:
                article_html = BeautifulSoup((requests.get(article)).content, 'html.parser')
            except:
                time.sleep(10)
                try:
                    article_html = BeautifulSoup((requests.get(article)).content, 'html.parser')
                except:
                    time.sleep(30)
                    try:
                        article_html = BeautifulSoup((requests.get(article)).content, 'html.parser')
                    except:
                        print('Page: ' + str(i) + ' article: ' + article)
            timestamp = article_html.find(attrs={"name":"cXenseParse:recs:publishtime"})
            if timestamp is None:
                continue
            year = int(str(timestamp)[15:19])
            month = int(str(timestamp)[20:22])
            day = int(str(timestamp)[23:25])

            if date(year, month, day) > end_date:
                continue
            if article_html.find(attrs={"name":"cXenseParse:scp-author"}) is not None:
                author = str(article_html.find(attrs={"name":"cXenseParse:scp-author"})['content']).strip()
            else:
                author = ''

            text_tag = str(article_html.find_all('p'))
            text = re.sub(re.compile('<.*?>'), ' ', text_tag)

            try:
                os.makedirs('Andrew\\Raw\\Data\\SCMP')
            except:
                pass
            f = open('Andrew\\Raw\\Data\\SCMP\\' + 'SCMP_' + str(article_count) + '.txt','w', encoding='utf-8')
            f.write(str(year) + '\n' + str(month) + '\n' + str(day) + '\n' + author + '\n' + text)
            f.close()
            article_count += 1
    return

######################STD#######################################################
def scrape_std(start_date = date(2014, 3, 1), end_date = date(2017, 2, 28)):
    #start in C:\Users\Andrew\Google Drive\Mass-Media-Independent-Research
    if 'Raw' in str(os.getcwd()):
        os.chdir(os.path.join('..', '..'))

    def daterange(start_date, end_date):
        for n in range(int((end_date - start_date).days)):
            yield start_date + timedelta(n)

    month_count = int((end_date.year - start_date.year)*12 + (end_date.month - start_date.month))
    article_array = np.array([])
    article_count = 0

    for today in daterange(start_date, end_date):
        main_pg = 'http://www.thestandard.com.hk/'
        archive_pg = 'http://www.thestandard.com.hk/archive.php?date=' + today.strftime('%Y-%m-%d')
        archive_pg_html = BeautifulSoup((requests.get(archive_pg)).content, 'html.parser')
        for section in archive_pg_html.find_all('div', attrs={'class':'section-top archive clearfix'}):
            section_tag = section.find_all('a')
            if 'Editorial' in str(section_tag) or 'Business' in str(section_tag) or 'Sports' in str(section_tag):
                continue
            for link in section_tag:
                article = main_pg + link.get('href')
                article_array = np.append(article_array, [article])
    article_array = np.unique(article_array)

    for article in article_array:
        try:
            article_html = BeautifulSoup((requests.get(article)).content, 'html.parser')
        except:
            time.sleep(10)
            try:
                article_html = BeautifulSoup((requests.get(article)).content, 'html.parser')
            except:
                time.sleep(30)
                try:
                    article_html = BeautifulSoup((requests.get(article)).content, 'html.parser')
                except:
                    print('Article: ' + article)

        date_tag = str(article_html.find('span', attrs={'class':'pull-left'}))
        date_str = date_tag[(date_tag.rindex('>', 0, -2)+1): date_tag.rindex('<')].strip()
        date_pub = datetime.strptime(date_str, '%b %d, %Y')
        day = date_pub.day
        month = date_pub.month
        year = date_pub.year

        if date(year, month, day) > end_date:
            continue

        text_tag = str(article_html.find_all(attrs={"class":"content"}))
        text = re.sub(re.compile('<.*?>'), ' ', text_tag)

        author_tag = str(article_html.find_all(attrs={"class":"writer"}))
        if "><" in author_tag:
            continue
            offset = -2
            try:
                author_tag = re.split('<p>', text_tag)[offset]
            except:
                continue
            if len(author_tag) > 30:
                author_tag = (re.split('\.', author_tag)[-1]).strip()
                while author_tag.isupper() == False:
                    offset = offset - 1
                try:
                    author_tag = re.split('<p>', text_tag)[offset]
                except:
                    author_tag = 'None'
                    break
        author = re.sub(re.compile('<.*?>'), ' ', author_tag).strip()
        try:
            os.makedirs('Andrew\\Raw\\Data\\STD')
        except:
            pass
        f = open('Andrew\\Raw\\Data\\STD\\' + 'STD_' + str(article_count) + '.txt','w', encoding='utf-8')
        f.write(str(year) + '\n' + str(month) + '\n' + str(day) + '\n' + author + '\n' + text)
        f.close()
        article_count += 1
    return
