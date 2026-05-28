#!/usr/bin/env python3
"""
Zenith Audience · yt-dlp Download Helper

Descarga audio/video de IG · TT · YT para procesar con Whisper.

Uso:
  python yt-dlp-download.py --url "https://www.instagram.com/reel/XXXXX/"
  python yt-dlp-download.py --url "https://www.tiktok.com/@user/video/XXXXX" --audio-only

Requisitos: pip install yt-dlp
"""

import json
import sys
import os
import argparse
from datetime import datetime

try:
    import yt_dlp
except ImportError:
    print(json.dumps({"error": "yt-dlp no instalado. Ejecuta: pip install yt-dlp"}))
    sys.exit(1)


def download(url: str, output_dir: str = "./downloads", audio_only: bool = False) -> dict:
    """Descarga video/audio de cualquier plataforma soportada por yt-dlp"""
    os.makedirs(output_dir, exist_ok=True)

    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    output_template = os.path.join(output_dir, f"{timestamp}_%(id)s.%(ext)s")

    if audio_only:
        ydl_opts = {
            "format": "bestaudio/best",
            "postprocessors": [{
                "key": "FFmpegExtractAudio",
                "preferredcodec": "mp3",
                "preferredquality": "128",  # Suficiente para Whisper
            }],
            "outtmpl": output_template,
            "quiet": True,
            "no_warnings": True
        }
    else:
        ydl_opts = {
            "format": "best[height<=720]",  # Limitar a 720p para velocidad
            "outtmpl": output_template,
            "quiet": True,
            "no_warnings": True
        }

    try:
        with yt_dlp.YoutubeDL(ydl_opts) as ydl:
            # Extract info first
            info = ydl.extract_info(url, download=False)

            # Download
            ydl.download([url])

            # Build path of downloaded file
            ext = "mp3" if audio_only else info.get("ext", "mp4")
            file_path = output_template.replace("%(id)s", info.get("id", "unknown")).replace("%(ext)s", ext)

            return {
                "success": True,
                "url": url,
                "platform": info.get("extractor_key", "unknown"),
                "title": info.get("title", ""),
                "uploader": info.get("uploader", ""),
                "duration_seconds": info.get("duration", 0),
                "view_count": info.get("view_count", 0),
                "like_count": info.get("like_count", 0),
                "file_path": file_path,
                "format": "mp3" if audio_only else "mp4",
                "timestamp": datetime.now().isoformat()
            }
    except Exception as e:
        return {"error": str(e), "url": url}


def main():
    parser = argparse.ArgumentParser(description="Zenith Audience · yt-dlp Download Helper")
    parser.add_argument("--url", required=True, help="URL del video (IG · TT · YT · etc.)")
    parser.add_argument("--output-dir", default="./downloads", help="Directorio output")
    parser.add_argument("--audio-only", action="store_true", help="Solo descargar audio (para Whisper)")

    args = parser.parse_args()

    result = download(args.url, args.output_dir, args.audio_only)
    print(json.dumps(result, indent=2, ensure_ascii=False))


if __name__ == "__main__":
    main()
