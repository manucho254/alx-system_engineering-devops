#!/usr/bin/python3
""" module to get number of subscribers for a subreddit
"""
import requests


def number_of_subscribers(subreddit):
    """
       function that queries the Reddit API and
       returns the number of subscribers
       Args:
           subreddit: subreddit's name
       Return:
             number of subscribers for subreddit else return 0
    """
    headers = {'User-agent':
               'Mozilla/5.0 (Windows NT 10.0; Win64; x64;\
               rv:109.0) Gecko/20100101 Firefox/119.0'}
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    req = requests.get(url, headers=headers, allow_redirects=False)

    if req.status_code == 200:
        num_subscribers = req.json().get("data").get("subscribers")
        return num_subscribers

    return 0
