#!/usr/bin/env python3
"""
Zenith Audience · Whisper Transcribe Helper (faster-whisper · LOCAL · GRATIS)

Transcribe audio/video local (descargado de IG/TT) usando faster-whisper.
4x más rápido que Whisper original · misma calidad.

Uso:
  python whisper-transcribe.py --file audio.mp3
  python whisper-transcribe.py --file video.mp4 --model medium --lang es

Requisitos: pip install faster-whisper
"""

import json
import sys
import os
import argparse
from datetime import datetime

try:
    from faster_whisper import WhisperModel
except ImportError:
    print(json.dumps({"error": "faster-whisper no instalado. Ejecuta: pip install faster-whisper"}))
    sys.exit(1)


def transcribe(file_path: str, model_size: str = "medium",
               language: str = None, compute_type: str = "int8") -> dict:
    """
    Transcribe un archivo de audio/video.

    Modelos disponibles:
    - tiny: 39M params · más rápido · menor calidad
    - base: 74M params · rápido · calidad ok
    - small: 244M params · medio
    - medium: 769M params · sweet spot calidad/velocidad (RECOMENDADO)
    - large-v3: 1550M params · máxima calidad · más lento

    compute_type:
    - int8: ligero · CPU-friendly
    - float16: GPU recomendado
    - float32: máxima precisión · más lento
    """
    if not os.path.exists(file_path):
        return {"error": f"Archivo no encontrado: {file_path}"}

    try:
        # Carga el modelo
        print(f"Cargando modelo {model_size} ({compute_type})...", file=sys.stderr)
        model = WhisperModel(model_size, device="auto", compute_type=compute_type)

        # Transcribe
        print(f"Transcribiendo {file_path}...", file=sys.stderr)
        segments, info = model.transcribe(
            file_path,
            language=language,
            beam_size=5,
            vad_filter=True  # Voice Activity Detection
        )

        # Recolecta segmentos
        segments_list = []
        full_text = []

        for segment in segments:
            seg_data = {
                "start": round(segment.start, 2),
                "end": round(segment.end, 2),
                "text": segment.text.strip()
            }
            segments_list.append(seg_data)
            full_text.append(segment.text.strip())

        result = {
            "file": file_path,
            "language_detected": info.language,
            "language_probability": round(info.language_probability, 3),
            "duration_seconds": round(info.duration, 2),
            "segments_count": len(segments_list),
            "text_full": " ".join(full_text),
            "segments": segments_list,
            "model_used": model_size,
            "timestamp": datetime.now().isoformat()
        }

        return result

    except Exception as e:
        return {"error": str(e), "file": file_path}


def main():
    parser = argparse.ArgumentParser(description="Zenith Audience · Whisper Transcribe Helper")
    parser.add_argument("--file", required=True, help="Path al archivo audio/video")
    parser.add_argument("--model", default="medium",
                        choices=["tiny", "base", "small", "medium", "large-v3"],
                        help="Modelo Whisper (medium = sweet spot)")
    parser.add_argument("--lang", default=None,
                        help="Idioma (es · pt · en) · None = autodetect")
    parser.add_argument("--compute", default="int8",
                        choices=["int8", "float16", "float32"],
                        help="Tipo de compute (int8 = CPU-friendly)")
    parser.add_argument("--format", default="json",
                        choices=["json", "text"])

    args = parser.parse_args()

    result = transcribe(args.file, args.model, args.lang, args.compute)

    if args.format == "text" and "text_full" in result:
        print(result["text_full"])
    else:
        print(json.dumps(result, indent=2, ensure_ascii=False))


if __name__ == "__main__":
    main()
