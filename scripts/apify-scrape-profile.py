#!/usr/bin/env python3
"""
Zenith Audience · Apify Instagram Profile Scraper

Scrapea un perfil de Instagram usando apify/instagram-post-scraper
y filtra los reels (Video) por viralidad.

Uso:
  python apify-scrape-profile.py --username nathan_perdriau --top 5

Requisitos:
  - APIFY_TOKEN en .env
  - pip install apify-client python-dotenv

Output: JSON con top N reels ordenados por engagement
"""

import os
import sys
import argparse
import json
from datetime import datetime

try:
    from apify_client import ApifyClient
except ImportError:
    print(json.dumps({"error": "apify-client no instalado. Ejecuta: pip install apify-client"}))
    sys.exit(1)

try:
    from dotenv import load_dotenv
    load_dotenv()
except ImportError:
    pass


def scrape_profile(username: str, results_limit: int = 50) -> list:
    """
    Scrapea un perfil de Instagram usando apify/instagram-post-scraper.

    Devuelve lista de posts (todos los tipos).
    """
    token = os.getenv("APIFY_TOKEN")
    if not token:
        raise Exception(
            "Falta APIFY_TOKEN en .env. "
            "Obtén token en https://console.apify.com/account/integrations"
        )

    client = ApifyClient(token)

    # Input del actor apify/instagram-post-scraper
    run_input = {
        "username": [username],
        "resultsLimit": results_limit,
        "addParentData": False
    }

    print(f"🚀 Lanzando scraper apify/instagram-post-scraper para @{username}...",
          file=sys.stderr)

    # Ejecutar el actor
    run = client.actor("apify/instagram-post-scraper").call(run_input=run_input)

    # Recolectar items del dataset
    items = []
    for item in client.dataset(run["defaultDatasetId"]).iterate_items():
        items.append(item)

    print(f"✓ Obtenidos {len(items)} posts totales", file=sys.stderr)
    return items


def filter_videos_by_virality(posts: list, top_n: int = 5,
                                metric: str = "engagement_absolute") -> list:
    """
    Filtra videos (reels) y los ordena por viralidad.

    metric:
      - engagement_absolute: likes + comments
      - engagement_relative: (likes + comments) / followers (requiere ownerFollowersCount)
      - views_only: videoViewCount
    """
    # Solo videos (reels)
    videos = [p for p in posts if p.get("type") == "Video"]
    print(f"✓ Filtrados {len(videos)} reels (Videos)", file=sys.stderr)

    # Calcular score por reel
    for v in videos:
        likes = v.get("likesCount", 0) or 0
        comments = v.get("commentsCount", 0) or 0
        views = v.get("videoViewCount", 0) or 0
        followers = v.get("ownerFollowersCount", 0) or 1  # evitar div/0

        v["_engagement_absolute"] = likes + comments
        v["_engagement_relative"] = (likes + comments) / followers
        v["_views_only"] = views
        v["_score_used"] = metric

    # Ordenar por la métrica elegida
    sort_key = {
        "engagement_absolute": "_engagement_absolute",
        "engagement_relative": "_engagement_relative",
        "views_only": "_views_only"
    }.get(metric, "_engagement_absolute")

    videos.sort(key=lambda x: x.get(sort_key, 0), reverse=True)

    return videos[:top_n]


def extract_id_from_url(url: str) -> str:
    """Extrae el ID del reel de su URL"""
    # Formato: https://www.instagram.com/p/<ID>/ o /reel/<ID>/
    import re
    match = re.search(r"instagram\.com/(p|reel)/([^/?]+)", url)
    return match.group(2) if match else "unknown"


def main():
    parser = argparse.ArgumentParser(description="Zenith Audience · Apify Instagram Scraper")
    parser.add_argument("--username", required=True,
                        help="Username de Instagram (sin @)")
    parser.add_argument("--top", type=int, default=5,
                        help="Top N reels a devolver (default: 5)")
    parser.add_argument("--limit", type=int, default=50,
                        help="Límite de posts a scrapear (default: 50)")
    parser.add_argument("--metric", default="engagement_absolute",
                        choices=["engagement_absolute", "engagement_relative", "views_only"],
                        help="Métrica para rankear viralidad")
    parser.add_argument("--format", default="json", choices=["json", "text"])

    args = parser.parse_args()

    try:
        # Limpiar @ si lo añade
        username = args.username.lstrip("@")

        # Scrape
        posts = scrape_profile(username, args.limit)

        # Filtrar top N reels
        top_videos = filter_videos_by_virality(posts, args.top, args.metric)

        # Output
        result = {
            "username": username,
            "timestamp": datetime.now().isoformat(),
            "total_posts_scraped": len(posts),
            "top_n_returned": len(top_videos),
            "metric_used": args.metric,
            "reels": []
        }

        for v in top_videos:
            url = v.get("url", "")
            result["reels"].append({
                "id": extract_id_from_url(url),
                "url": url,
                "shortCode": v.get("shortCode", ""),
                "caption": v.get("caption", "")[:300],  # primeros 300 chars
                "likes": v.get("likesCount", 0),
                "comments": v.get("commentsCount", 0),
                "views": v.get("videoViewCount", 0),
                "duration_sec": v.get("videoDuration"),
                "timestamp": v.get("timestamp", ""),
                "score": v.get(f"_{args.metric}", 0)
            })

        if args.format == "text":
            print(f"\n🎯 TOP {len(top_videos)} REELS de @{username}")
            print(f"Métrica: {args.metric}\n")
            for i, reel in enumerate(result["reels"], 1):
                print(f"#{i} · {reel['url']}")
                print(f"    Score: {reel['score']:,} · Views: {reel['views']:,} · "
                      f"Likes: {reel['likes']:,} · Comments: {reel['comments']:,}")
                print(f"    Caption: {reel['caption'][:100]}...")
                print()
        else:
            print(json.dumps(result, indent=2, ensure_ascii=False))

    except Exception as e:
        print(json.dumps({"error": str(e)}, indent=2))
        sys.exit(1)


if __name__ == "__main__":
    main()
