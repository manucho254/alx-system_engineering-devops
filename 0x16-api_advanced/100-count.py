#!/usr/bin/python3
""" module to get all hot posts listed for a subreddit
"""
from collections import Counter
import re
import requests


def count_words(subreddit, word_list, hot_list=[], after=None):
    """
       function that queries the Reddit API and
       prints the titles of the first 10 hot
       posts listed for a given subreddit
       Args:
           subreddit: subreddit's name
       Return:
            list of hot articles else return None
    """
    headers = {'User-agent':
               'Mozilla/5.0 (Windows NT 10.0; Win64; x64;\
               rv:109.0) Gecko/20100101 Firefox/119.0'}
    url = "https://www.reddit.com/r/{}/hot.json?limit=50&after={}"\
          .format(subreddit, after)
    req = requests.get(url, headers=headers, allow_redirects=False)

    if req.status_code == 200:
        data = req.json().get("data")
        posts = data.get("children")

        for post in posts:
            title = post.get("data").get("title")
            hot_list.append(title)

        if data.get("after"):
            return count_words(subreddit, word_list,
                               hot_list, data.get("after"))
        else:
            all_titles = " ".join(hot_list).lower()

            for word in word_list:
                expression = r"\b{}\b".format(word.lower())
                matches = re.findall(expression, all_titles)
                print("{}: {}".format(word, len(matches)))
