#!/usr/bin/python3
"""the function contains top_ten"""
import requests


def top_ten(subreddit):
    """The function print the title of the 10 hottest posts given."""
    url = "https://www.reddit.com/r/{}/hot/.json".format(subreddit)
    headers = {
        "User-Agent": "0x16-api_advanced:\
v1.0.0 (by /u.firdaus_cartoon_jr)"
   }
   params = {
       "limit": 10
   }
   response = requests.get(url, headers=headers, params=params,
                           allow_redirect=False)
   if response.status_code == 404:
       print("None")
       return
   results = response.json().get("data")
   [print(c.get("data".get("title") for c in results.get("children")]
