#!/usr/bin/python3
""" module to get 10 hot post listed for a subreddit
"""
import requests


def top_ten(subreddit):
    """
       function that queries the Reddit API and
       prints the titles of the first 10 hot
       posts listed for a given subreddit
       Args:
           subreddit: subreddit's name
    """
    headers = {'User-agent':
               'Mozilla/5.0 (Windows NT 10.0; Win64; x64;\
               rv:109.0) Gecko/20100101 Firefox/119.0'}
    url = "https://www.reddit.com/r/{}/hot.json?limit=10".format(subreddit)
    req = requests.get(url, headers=headers, allow_redirects=False)

    if req.status_code == 200:
        data = req.json().get("data")
        posts = data.get("children")

        for post in posts:
            print(post.get("data").get("title"))
    else:
        print(None)
