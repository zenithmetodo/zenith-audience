#!/usr/bin/env bash
# Zenith Audience · Extract 5 frames from video
#
# Extrae 5 frames clave (5% · 25% · 50% · 75% · 95%) de un vídeo
# para identificar el formato visual del reel.
#
# Uso:
#   ./extract-frames.sh <path-to-video.mp4>
#
# Output:
#   frame_5.jpg · frame_25.jpg · frame_50.jpg · frame_75.jpg · frame_95.jpg
#   (en la misma carpeta del vídeo)
#
# Requisitos: ffmpeg + ffprobe + python3

set -e

if [ -z "$1" ]; then
    echo "Uso: $0 <path-to-video.mp4>"
    exit 1
fi

VIDEO="$1"
DIR=$(dirname "$VIDEO")

if [ ! -f "$VIDEO" ]; then
    echo "❌ Archivo no encontrado: $VIDEO"
    exit 1
fi

# Verificar ffmpeg/ffprobe
if ! command -v ffmpeg &> /dev/null; then
    echo "❌ ffmpeg no instalado. Instala con: brew install ffmpeg (Mac) o apt install ffmpeg (Linux)"
    exit 1
fi

# Obtener duración
DUR=$(ffprobe -v error -show_entries format=duration \
     -of default=noprint_wrappers=1:nokey=1 "$VIDEO")

if [ -z "$DUR" ]; then
    echo "❌ No se pudo obtener duración del vídeo"
    exit 1
fi

echo "📹 Vídeo: $VIDEO"
echo "⏱️  Duración: ${DUR}s"
echo "🎬 Extrayendo 5 frames..."

# Extraer frames a 5% · 25% · 50% · 75% · 95%
for pct in 5 25 50 75 95; do
    TIME=$(python3 -c "print($DUR * $pct / 100)")
    OUTPUT="${DIR}/frame_${pct}.jpg"
    ffmpeg -y -ss "$TIME" -i "$VIDEO" \
        -frames:v 1 -q:v 2 "$OUTPUT" 2>/dev/null
    echo "  ✓ frame_${pct}.jpg (${TIME}s)"
done

echo ""
echo "✅ 5 frames extraídos en: $DIR/"
echo ""
echo "Cómo usar (próximo paso):"
echo "  Pide a Claude leer los frames con la herramienta Read"
echo "  Claude identificará el formato visual del reel"
