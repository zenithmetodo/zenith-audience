#!/usr/bin/env python3
"""
Zenith Audience · YouTube Transcript Helper

Extrae subtítulos de YouTube (auto-generados o manuales · gratis · sin API key).
Stack primario para transcripción de YT videos.

Uso:
  python yt-transcript.py --url "https://youtube.com/watch?v=XXXXX"
  python yt-transcript.py --url "https://youtube.com/watch?v=XXXXX" --lang es

Requisitos: pip install youtube-transcript-api
"""

import json
import sys
import re
import argparse

try:
    from youtube_transcript_api import YouTubeTranscriptApi
    from youtube_transcript_api.formatters import TextFormatter, JSONFormatter
except ImportError:
    print(json.dumps({"error": "youtube-transcript-api no instalado. Ejecuta: pip install youtube-transcript-api"}))
    sys.exit(1)


def extract_video_id(url: str) -> str:
    """Extrae el video ID de cualquier URL de YouTube"""
    patterns = [
        r"(?:youtube\.com/watch\?v=|youtu\.be/|youtube\.com/shorts/)([a-zA-Z0-9_-]{11})",
        r"^([a-zA-Z0-9_-]{11})$"
    ]
    for pattern in patterns:
        match = re.search(pattern, url)
        if match:
            return match.group(1)
    raise ValueError(f"No se pudo extraer video ID de: {url}")


def get_transcript(video_id: str, lang: str = "es") -> dict:
    """Obtiene transcripción · prueba primero el idioma pedido · luego cualquier disponible"""
    try:
        # Lista todos los transcripts disponibles
        transcript_list = YouTubeTranscriptApi.list_transcripts(video_id)

        # Intenta el idioma pedido
        try:
            transcript = transcript_list.find_transcript([lang])
        except Exception:
            # Si no hay en ese idioma · prueba auto-generados en el idioma pedido
            try:
                transcript = transcript_list.find_generated_transcript([lang])
            except Exception:
                # Si no · primero disponible
                transcript = list(transcript_list)[0]

        # Fetch
        data = transcript.fetch()

        # Texto completo
        text_formatter = TextFormatter()
        text = text_formatter.format_transcript(data)

        # Con timestamps
        json_formatter = JSONFormatter()
        json_data = json.loads(json_formatter.format_transcript(data))

        return {
            "video_id": video_id,
            "language": transcript.language_code,
            "is_generated": transcript.is_generated,
            "is_translatable": transcript.is_translatable,
            "duration_segments": len(json_data),
            "text_full": text,
            "segments": json_data
        }
    except Exception as e:
        return {"error": str(e), "video_id": video_id}


def main():
    parser = argparse.ArgumentParser(description="Zenith Audience · YouTube Transcript Helper")
    parser.add_argument("--url", required=True, help="URL de YouTube o video ID")
    parser.add_argument("--lang", default="es", help="Idioma preferido (es · pt · en)")
    parser.add_argument("--format", default="json", choices=["json", "text"])

    args = parser.parse_args()

    try:
        video_id = extract_video_id(args.url)
        result = get_transcript(video_id, args.lang)

        if args.format == "text" and "text_full" in result:
            print(result["text_full"])
        else:
            print(json.dumps(result, indent=2, ensure_ascii=False))
    except Exception as e:
        print(json.dumps({"error": str(e)}))
        sys.exit(1)


if __name__ == "__main__":
    main()
