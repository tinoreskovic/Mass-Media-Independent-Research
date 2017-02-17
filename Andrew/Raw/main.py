from bs4 import BeautifulSoup
from datetime import timedelta, date
import numpy as np
import os
import time
import re
import requests
from scrape import scrape_scmp
from scrape import scrape_std

scrape_scmp()
scrape_std()
