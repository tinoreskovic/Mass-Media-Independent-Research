from bs4 import BeautifulSoup
from datetime import timedelta, date, datetime
import numpy as np
import os
import time
import re
import requests

###############################scmp#############################################
def scrape_scmp(start_date = date(2014, 3, 1), end_date = date(2017, 2, 28), pg_start = 0, article_start = 0, article_count = 0):
    #start in repo directory
    if 'Raw' in str(os.getcwd()):
        os.chdir(os.path.join('..', '..'))

    def daterange(start_date, end_date):
        for n in range(int((end_date - start_date).days)):
            yield start_date + timedelta(n)

    finish_flag = 0

    main_pg = 'http://www.scmp.com'
    archive_pg1 = 'http://www.scmp.com/content/search/articles/news?f[0]=ds_created%3A%5B' + str(start_date) + 'T00%3A00%3A00Z%20TO%20' + str(end_date) + 'T23%3A59%3A59Z%5D&f[1]=im_field_section%3A91'
    try:
        archive_pg1_html = BeautifulSoup((requests.get(archive_pg1)).content, 'html.parser')
    except:
        error_return = [pg_start, 0, article_count, finish_flag]
        return error_return
    archive_pglast_tag = str(archive_pg1_html.find(title='Go to last page'))

    pg_count = int(archive_pglast_tag[int(archive_pglast_tag.index('news?page') + 10):int(archive_pglast_tag.index('&amp'))])
    month_count = int((end_date.year - start_date.year)*12 + (end_date.month - start_date.month))

    for i in range(pg_start, pg_count):
        pg_link_index = 0
        archive_pg = 'http://www.scmp.com/content/search/articles/news?' + 'page=' + str(i) + '&' + '&f[0]=ds_created%3A%5B' + str(start_date) + 'T00%3A00%3A00Z%20TO%20' + str(end_date) + 'T23%3A59%3A59Z%5D&f[1]=im_field_section%3A91'
        try:
            archive_pg_html = BeautifulSoup((requests.get(archive_pg)).content, 'html.parser')
        except:
            error_return = [i, pg_link_index, article_count, finish_flag]
            return error_return

        print('Page ' + str(i + 1) + '/' + str(pg_count) + ' / started session on ' + str(pg_start + 1))

        for link in archive_pg_html.find_all('div', attrs={'class':'search-result-wrapper'}):
            if pg_link_index < article_start:
                pg_link_index += 1
                continue
            elif article_start > 0 and pg_link_index == article_start:
                article_start = 0
            article_tag = link.find('a').get('href')
            article = main_pg + article_tag
            try:
                article_html = BeautifulSoup((requests.get(article)).content, 'html.parser')
            except:
                error_return = [i, pg_link_index, article_count, finish_flag]
                return error_return
            pg_link_index += 1

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

            text_tag = article_html.find_all('p')
            text = ''
            for element in text_tag:
                if 'href' in str(element):
                    continue
                text = text + element.get_text() + ' '
            text = text.strip()

            try:
                os.makedirs('Andrew\\Raw\\Data\\SCMP')
            except:
                pass
            with open('Andrew\\Raw\\Data\\SCMP\\' + 'SCMP_' + str(article_count) + '.txt','w', encoding='utf-8') as f:
                f.write(str(year) + '\n' + str(month) + '\n' + str(day) + '\n' + author + '\n' + text)

            article_count += 1

    finish_flag = 1
    finish_return = [i, pg_link_index, article_count, finish_flag]
    return finish_return

######################STD#######################################################
def scrape_std(start_date = date(2014, 3, 1), end_date = date(2017, 2, 28), article_array = np.array([]), article_start = 0, article_count = 0):
    #start in repo directory
    if 'Raw' in str(os.getcwd()):
        os.chdir(os.path.join('..', '..'))

    def daterange(start_date, end_date):
        for n in range(int((end_date - start_date).days)):
            yield start_date + timedelta(n)

    month_count = int((end_date.year - start_date.year)*12 + (end_date.month - start_date.month))

    article_array_index = 0
    finish_flag = 0

    if len(article_array) == 0:
        for today in daterange(start_date, end_date):
            main_pg = 'http://www.thestandard.com.hk/'
            archive_pg = 'http://www.thestandard.com.hk/archive.php?date=' + today.strftime('%Y-%m-%d')
            try:
                archive_pg_html = BeautifulSoup((requests.get(archive_pg)).content, 'html.parser')
            except:
                error_return = [np.array([]), article_start, article_count, finish_flag]
                return error_return

            for section in archive_pg_html.find_all('div', attrs={'class':'section-top archive clearfix'}):
                if 'Editorial' in section.get_text() or 'Business' in section.get_text() or 'Sports' in section.get_text():
                    continue
                section_tag = section.find_all('a')
                for link in section_tag:
                    article = main_pg + link.get('href')
                    article_array = np.append(article_array, [article])
        article_array = np.unique(article_array)

    for article in article_array:
        if article_array_index < article_start:
            article_array_index += 1
            continue
        try:
            article_html = BeautifulSoup((requests.get(article)).content, 'html.parser')
        except:
            error_return = [article_array, article_array_index, article_count, finish_flag]
            return error_return
        article_array_index += 1
        date_tag = str(article_html.find('span', attrs={'class':'pull-left'}))
        date_str = date_tag[(date_tag.rindex('>', 0, -2)+1): date_tag.rindex('<')].strip()
        date_pub = datetime.strptime(date_str, '%b %d, %Y')
        day = date_pub.day
        month = date_pub.month
        year = date_pub.year

        if date(year, month, day) > end_date:
            continue

        text_tag = article_html.find_all(attrs={"class":"content"})

        if len(text_tag) == 0:
            continue

        text = ''
        text_base = ''
        for element in text_tag:
            text_base = text_base + element.get_text() + ' '
        text_list = text_base.split('.')
        author = article_html.find(attrs={"class":"writer"}).get_text()
        if author == '' and (text_list[-1]).isupper():
            author = text_list[-1]
            for sentence in text_list[:-1]:
                text = text + sentence + '. '
        else:
            author = 'None'
            for sentence in text_list:
                text = text + sentence + '. '

        try:
            os.makedirs('Andrew\\Raw\\Data\\STD')
        except:
            pass
        with open('Andrew\\Raw\\Data\\STD\\' + 'STD_' + str(article_count) + '.txt','w', encoding='utf-8') as f:
            f.write(str(year) + '\n' + str(month) + '\n' + str(day) + '\n' + author + '\n' + text)

        article_count += 1
        error_return = [article_array, article_array_index, article_count, finish_flag]
    finish_flag = 1
    finish_return = [article_array, article_array_index, article_count, finish_flag]
    return finish_return
