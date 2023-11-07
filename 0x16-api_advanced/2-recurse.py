#!/usr/bin/python3
""" module to get all hot posts listed for a subreddit
"""
import requests


def recurse(subreddit, hot_list=[], after=None):
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
            return recurse(subreddit, hot_list, data.get("after"))
        else:
            return hot_list

    return None
