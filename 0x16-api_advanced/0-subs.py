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
    headers = {'User-Agent': 'RedditSubsBotSbuda/1.0'}
    response = requests.get(url, headers=headers, allow_redirects=True)
    print(response)
    if response.status_code == 200:
        data = response.json()
        test = data['data']['subreddit_subscribers']
        print(test)
        return data['data']['subreddit_subscribers']
    else:
        print("something wrong")
        return 0
    
number_of_subscribers("programming")
