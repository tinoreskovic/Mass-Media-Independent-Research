from bs4 import BeautifulSoup
from datetime import timedelta, date
import numpy as np
import os
import time
import re
import requests
from scrape import scrape_scmp
from scrape import scrape_std

start_date = date(2014, 4, 1)
end_date = date(2017, 2, 28)

################################################################################
#[4893, 8, 48916, 0]
pg_start = 4893
article_start = 8
article_count = 48916
finish_flag = 0
while finish_flag != 1:
    error_array = scrape_scmp(start_date, end_date, pg_start, article_start, article_count)
    print(error_array)
    pg_start = error_array[0]
    article_start = error_array[1]
    article_count = error_array[2]
    finish_flag = error_array[3]
    time.sleep(300)
################################################################################
# article_array = np.array([])
# article_array_index = 0
# article_count = 0
# finish_flag = 0
# while finish_flag != 1:
#     error_array = scrape_std(start_date, end_date, article_array, article_array_index, article_count)
#     print(error_array)
#     article_array = error_array[0]
#     article_array_index = error_array[1]
#     article_count = error_array[2]
#     finish_flag = error_array[3]
#     time.sleep(300)
