#!/usr/bin/python3
""" Returns the number of
    subscribers for a given subreddit """
import requests


def number_of_subscribers(subreddit):
    """
    A function that queries the Reddit API and returns the number of
    subscribers for a given subreddit.
    """
    url = f"https://www.reddit.com/r/{subreddit}.json"
    headers = {'User-Agent': 'Mozilla/5.0'}
    response = requests.get(url, headers=headers)
    if response.status_code == 200:
        data = response.json()
        test = data['data']['subreddit_subscribers']
        print(test)
        return data['data']['subreddit_subscribers']
    else:
        return 0
