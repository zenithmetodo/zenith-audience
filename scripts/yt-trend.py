#!/usr/bin/env python3
"""
Zenith Audience · YouTube Trends Helper

Usa YouTube Data API v3 (gratis · cuota 10K/día) para detectar trending shorts.
Output JSON listo para consumir por el agente trend-foros.

Uso:
  python yt-trend.py --search "menopausia" --region ES --max 25
  python yt-trend.py --trending --region ES --category 22

Requisitos:
  - pip install google-api-python-client
  - YOUTUBE_API_KEY en .env (obtener en https://console.cloud.google.com)
"""

import json
import sys
import os
import argparse
from datetime import datetime

try:
    from googleapiclient.discovery import build
except ImportError:
    print(json.dumps({"error": "google-api-python-client no instalado. Ejecuta: pip install google-api-python-client python-dotenv"}))
    sys.exit(1)

try:
    from dotenv import load_dotenv
    load_dotenv()
except ImportError:
    pass


def get_yt_client():
    """Inicializa cliente YouTube API"""
    api_key = os.getenv("YOUTUBE_API_KEY")
    if not api_key:
        raise Exception(
            "Falta YOUTUBE_API_KEY en .env. "
            "Crea proyecto en https://console.cloud.google.com, "
            "activa YouTube Data API v3, obtén API key."
        )
    return build("youtube", "v3", developerKey=api_key)


def search_videos(query: str, region: str = "ES", max_results: int = 25,
                  order: str = "viewCount", duration: str = "short") -> list:
    """Busca vídeos por keyword · ordenados por views o relevancia"""
    yt = get_yt_client()

    request = yt.search().list(
        q=query,
        part="snippet",
        type="video",
        regionCode=region,
        order=order,  # viewCount · date · relevance · rating
        videoDuration=duration,  # short · medium · long
        maxResults=max_results,
        relevanceLanguage="es"
    )

    response = request.execute()

    # Obtener stats de cada vídeo
    video_ids = [item["id"]["videoId"] for item in response.get("items", [])]
    if not video_ids:
        return []

    stats_request = yt.videos().list(
        part="statistics,contentDetails",
        id=",".join(video_ids)
    )
    stats_response = stats_request.execute()
    stats_map = {item["id"]: item for item in stats_response.get("items", [])}

    results = []
    for item in response.get("items", []):
        video_id = item["id"]["videoId"]
        stats = stats_map.get(video_id, {})

        results.append({
            "title": item["snippet"]["title"],
            "channel": item["snippet"]["channelTitle"],
            "url": f"https://youtube.com/watch?v={video_id}",
            "published": item["snippet"]["publishedAt"],
            "description_preview": item["snippet"]["description"][:200],
            "thumbnail": item["snippet"]["thumbnails"]["high"]["url"],
            "views": int(stats.get("statistics", {}).get("viewCount", 0)),
            "likes": int(stats.get("statistics", {}).get("likeCount", 0)),
            "comments": int(stats.get("statistics", {}).get("commentCount", 0)),
            "duration": stats.get("contentDetails", {}).get("duration", "")
        })

    return results


def get_trending(region: str = "ES", category_id: str = "0", max_results: int = 25) -> list:
    """Obtiene vídeos trending de una región/categoría"""
    yt = get_yt_client()

    request = yt.videos().list(
        chart="mostPopular",
        part="snippet,statistics,contentDetails",
        regionCode=region,
        videoCategoryId=category_id,
        maxResults=max_results
    )

    response = request.execute()

    results = []
    for item in response.get("items", []):
        results.append({
            "title": item["snippet"]["title"],
            "channel": item["snippet"]["channelTitle"],
            "url": f"https://youtube.com/watch?v={item['id']}",
            "published": item["snippet"]["publishedAt"],
            "views": int(item["statistics"].get("viewCount", 0)),
            "likes": int(item["statistics"].get("likeCount", 0)),
            "duration": item["contentDetails"].get("duration", "")
        })

    return results


def main():
    parser = argparse.ArgumentParser(description="Zenith Audience · YouTube Trends Helper")
    parser.add_argument("--search", help="Buscar vídeos por keyword")
    parser.add_argument("--trending", action="store_true", help="Obtener trending de la región")
    parser.add_argument("--region", default="ES")
    parser.add_argument("--max", type=int, default=25)
    parser.add_argument("--category", default="0", help="Category ID (0=all · 22=people · 24=entertainment)")
    parser.add_argument("--order", default="viewCount", choices=["viewCount", "date", "relevance", "rating"])
    parser.add_argument("--duration", default="short", choices=["short", "medium", "long", "any"])

    args = parser.parse_args()

    try:
        if args.search:
            result = {
                "type": "search",
                "query": args.search,
                "region": args.region,
                "timestamp": datetime.now().isoformat(),
                "results": search_videos(args.search, args.region, args.max, args.order, args.duration)
            }
        elif args.trending:
            result = {
                "type": "trending",
                "region": args.region,
                "category": args.category,
                "timestamp": datetime.now().isoformat(),
                "results": get_trending(args.region, args.category, args.max)
            }
        else:
            print(json.dumps({"error": "Usa --search o --trending"}))
            sys.exit(1)

        print(json.dumps(result, indent=2, ensure_ascii=False))
    except Exception as e:
        print(json.dumps({"error": str(e)}))
        sys.exit(1)


if __name__ == "__main__":
    main()
