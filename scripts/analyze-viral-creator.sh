#!/usr/bin/env bash
# Zenith Audience · Orquestador del pipeline de análisis de creator viral
#
# Pipeline completo:
# 1. Scrape perfil con Apify (manual · pásale los URLs si Apify no disponible)
# 2. Crea estructura de carpetas
# 3. Descarga reels con yt-dlp (paralelo)
# 4. Extrae 5 frames por reel con ffmpeg (paralelo)
# 5. Transcribe con Whisper (paralelo)
# 6. Genera TRANSCRIPCION.md (placeholder · llenado por Claude)
#
# Uso:
#   ./analyze-viral-creator.sh <USERNAME> <BASE_FOLDER> "<URL1>,<URL2>,<URL3>"
#
# Ejemplo:
#   ./analyze-viral-creator.sh "nathan_perdriau" "./TRANSCRIPCION-REELS" \
#     "https://instagram.com/p/Cz1/,https://instagram.com/p/Cz2/,https://instagram.com/p/Cz3/"

set -e

USERNAME="$1"
BASE_FOLDER="$2"
URLS_CSV="$3"
START_N="${4:-16}"  # Numeración inicial (default 16 · ajustar según historial)
BROWSER="${5:-chrome}"

if [ -z "$USERNAME" ] || [ -z "$BASE_FOLDER" ] || [ -z "$URLS_CSV" ]; then
    echo "Uso: $0 <USERNAME> <BASE_FOLDER> <URLS_CSV> [START_N] [BROWSER]"
    echo ""
    echo "Ejemplo:"
    echo "  $0 'nathan_perdriau' './TRANSCRIPCION-REELS' \\"
    echo "    'https://instagram.com/p/CzA/,https://instagram.com/p/CzB/' 16 chrome"
    exit 1
fi

# Verificar dependencias
for cmd in yt-dlp ffmpeg ffprobe python3; do
    if ! command -v "$cmd" &> /dev/null; then
        echo "❌ $cmd no instalado"
        exit 1
    fi
done

# Whisper (opcional · puede usarse faster-whisper)
WHISPER_CMD=""
if command -v whisper &> /dev/null; then
    WHISPER_CMD="whisper"
elif python3 -c "import faster_whisper" 2>/dev/null; then
    WHISPER_CMD="faster-whisper"
else
    echo "⚠️  Ni whisper ni faster-whisper instalados. Saltaré transcripción."
fi

mkdir -p "$BASE_FOLDER"

echo "════════════════════════════════════════════════"
echo "🎯 ZENITH AUDIENCE · Pipeline Análisis Creator"
echo "════════════════════════════════════════════════"
echo "Creator: @$USERNAME"
echo "Output: $BASE_FOLDER"
echo "URLs: $(echo $URLS_CSV | tr ',' '\n' | wc -l | xargs) reels"
echo ""

# Convertir URLs a array
IFS=',' read -ra URLS <<< "$URLS_CSV"

N=$START_N
FOLDERS=()

# PASO 4 · Crear estructura de carpetas + PASO 5 · Descargar (paralelo)
echo "📥 PASO 5 · Descargando reels en paralelo..."
for URL in "${URLS[@]}"; do
    # Extraer ID del URL (formato: instagram.com/p/<ID>/)
    ID=$(echo "$URL" | sed -E 's|.*instagram.com/(p|reel)/([^/?]+).*|\2|')
    FOLDER="$BASE_FOLDER/🆕${N}_${ID}"
    mkdir -p "$FOLDER"
    FOLDERS+=("$FOLDER")

    echo "  → 🆕${N}_${ID}"
    yt-dlp --cookies-from-browser "$BROWSER" \
        -o "$FOLDER/video.%(ext)s" \
        "$URL" 2>&1 | tail -3 &

    N=$((N+1))
done

wait
echo "✅ Descargas completas"
echo ""

# PASO 6 · Extraer frames (paralelo)
echo "🎬 PASO 6 · Extrayendo 5 frames por reel..."
for FOLDER in "${FOLDERS[@]}"; do
    VIDEO="$FOLDER/video.mp4"
    if [ ! -f "$VIDEO" ]; then
        echo "  ⚠️  $FOLDER · video.mp4 no encontrado · saltando frames"
        continue
    fi
    (
        DUR=$(ffprobe -v error -show_entries format=duration \
             -of default=noprint_wrappers=1:nokey=1 "$VIDEO")
        for pct in 5 25 50 75 95; do
            TIME=$(python3 -c "print($DUR * $pct / 100)")
            ffmpeg -y -ss "$TIME" -i "$VIDEO" \
                -frames:v 1 -q:v 2 "$FOLDER/frame_${pct}.jpg" 2>/dev/null
        done
        echo "  ✓ $(basename "$FOLDER")"
    ) &
done

wait
echo "✅ Frames extraídos"
echo ""

# PASO 7 · Transcribir (paralelo) · si whisper disponible
if [ -n "$WHISPER_CMD" ]; then
    echo "🎙️  PASO 7 · Transcribiendo con $WHISPER_CMD..."
    for FOLDER in "${FOLDERS[@]}"; do
        VIDEO="$FOLDER/video.mp4"
        if [ ! -f "$VIDEO" ]; then continue; fi
        (
            if [ "$WHISPER_CMD" = "whisper" ]; then
                whisper "$VIDEO" \
                    --model small \
                    --output_format txt \
                    --output_dir "$FOLDER" 2>/dev/null
            else
                python3 "$(dirname "$0")/whisper-transcribe.py" \
                    --file "$VIDEO" \
                    --model small \
                    --format text > "$FOLDER/video.txt"
            fi
            echo "  ✓ $(basename "$FOLDER")/video.txt"
        ) &
    done
    wait
    echo "✅ Transcripciones completas"
    echo ""
fi

# Listar carpetas creadas
echo "════════════════════════════════════════════════"
echo "📁 ESTRUCTURA RESULTANTE:"
echo "════════════════════════════════════════════════"
for FOLDER in "${FOLDERS[@]}"; do
    echo ""
    echo "📂 $(basename "$FOLDER")/"
    ls -lh "$FOLDER" 2>/dev/null | tail -n +2 | awk '{print "    " $9 " (" $5 ")"}'
done

echo ""
echo "════════════════════════════════════════════════"
echo "✅ Pipeline completo"
echo "════════════════════════════════════════════════"
echo ""
echo "Próximos pasos (Claude los hace automáticamente):"
echo "  1. Leer los frames con tool Read · identificar formato visual"
echo "  2. Generar TRANSCRIPCION.md en cada carpeta (con idea ganadora + análisis)"
echo "  3. Generar GUION_ADAPTADO.md adaptado al núcleo del usuario"
