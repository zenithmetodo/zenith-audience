#!/usr/bin/env python3
"""
Zenith Audience · Reddit Trends Helper

Usa PRAW (API oficial Reddit · gratis) para detectar threads emergentes.
Output JSON listo para consumir por el agente trend-foros.

Uso:
  python reddit-trend.py --subreddit "menopause" --period day --limit 25

Requisitos:
  - pip install praw
  - Credenciales en .env (REDDIT_CLIENT_ID · REDDIT_CLIENT_SECRET · REDDIT_USER_AGENT)
  - Crear app en https://www.reddit.com/prefs/apps
"""

import json
import sys
import os
import argparse
from datetime import datetime

try:
    import praw
except ImportError:
    print(json.dumps({"error": "praw no instalado. Ejecuta: pip install praw python-dotenv"}))
    sys.exit(1)

try:
    from dotenv import load_dotenv
    load_dotenv()
except ImportError:
    pass


def get_reddit_client():
    """Inicializa cliente PRAW con credenciales del .env"""
    client_id = os.getenv("REDDIT_CLIENT_ID")
    client_secret = os.getenv("REDDIT_CLIENT_SECRET")
    user_agent = os.getenv("REDDIT_USER_AGENT", "ZenithAudience/1.0")

    if not client_id or not client_secret:
        raise Exception(
            "Faltan credenciales Reddit en .env. "
            "Crea app en https://www.reddit.com/prefs/apps y añade "
            "REDDIT_CLIENT_ID + REDDIT_CLIENT_SECRET al .env"
        )

    return praw.Reddit(
        client_id=client_id,
        client_secret=client_secret,
        user_agent=user_agent
    )


def get_hot_posts(subreddit_name: str, period: str = "day", limit: int = 25) -> list:
    """Obtiene posts en alza de un subreddit"""
    reddit = get_reddit_client()
    subreddit = reddit.subreddit(subreddit_name)

    posts = []
    for submission in subreddit.top(time_filter=period, limit=limit):
        posts.append({
            "title": submission.title,
            "url": f"https://reddit.com{submission.permalink}",
            "score": submission.score,
            "num_comments": submission.num_comments,
            "upvote_ratio": submission.upvote_ratio,
            "created_utc": datetime.fromtimestamp(submission.created_utc).isoformat(),
            "flair": submission.link_flair_text,
            "selftext_preview": submission.selftext[:300] if submission.selftext else "",
            "is_self": submission.is_self,
            "author": str(submission.author) if submission.author else "[deleted]"
        })

    return posts


def search_subreddits(query: str, limit: int = 10) -> list:
    """Busca subreddits relevantes a un tema"""
    reddit = get_reddit_client()

    results = []
    for sub in reddit.subreddits.search(query, limit=limit):
        results.append({
            "name": sub.display_name,
            "subscribers": sub.subscribers,
            "description": sub.public_description,
            "url": f"https://reddit.com/r/{sub.display_name}"
        })

    return results


def main():
    parser = argparse.ArgumentParser(description="Zenith Audience · Reddit Trends Helper")
    parser.add_argument("--subreddit", help="Nombre del subreddit (ej: menopause)")
    parser.add_argument("--search", help="Buscar subreddits relevantes a este tema")
    parser.add_argument("--period", default="day", choices=["hour", "day", "week", "month", "year", "all"])
    parser.add_argument("--limit", type=int, default=25)

    args = parser.parse_args()

    try:
        if args.search:
            result = {
                "type": "subreddit_search",
                "query": args.search,
                "results": search_subreddits(args.search, args.limit)
            }
        elif args.subreddit:
            result = {
                "type": "hot_posts",
                "subreddit": args.subreddit,
                "period": args.period,
                "timestamp": datetime.now().isoformat(),
                "posts": get_hot_posts(args.subreddit, args.period, args.limit)
            }
        else:
            print(json.dumps({"error": "Usa --subreddit o --search"}))
            sys.exit(1)

        print(json.dumps(result, indent=2, ensure_ascii=False))
    except Exception as e:
        print(json.dumps({"error": str(e)}))
        sys.exit(1)


if __name__ == "__main__":
    main()
