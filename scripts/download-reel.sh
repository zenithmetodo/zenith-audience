#!/usr/bin/env bash
# Zenith Audience · Download Instagram reel with yt-dlp
#
# Descarga un reel de Instagram usando cookies del navegador.
#
# Uso:
#   ./download-reel.sh <URL_IG_REEL> <output-folder>
#
# Ejemplo:
#   ./download-reel.sh "https://www.instagram.com/p/CzXqW8Lpdh/" "./reels/16_CzXqW8Lpdh"

set -e

URL="$1"
OUTPUT_FOLDER="$2"
BROWSER="${3:-chrome}"  # chrome (default) · firefox · brave · edge

if [ -z "$URL" ] || [ -z "$OUTPUT_FOLDER" ]; then
    echo "Uso: $0 <URL_IG_REEL> <output-folder> [browser]"
    echo "Ejemplo: $0 'https://www.instagram.com/p/Cz...' '/path/folder' chrome"
    exit 1
fi

# Verificar yt-dlp
if ! command -v yt-dlp &> /dev/null; then
    echo "❌ yt-dlp no instalado. Instala con: pip install yt-dlp"
    exit 1
fi

mkdir -p "$OUTPUT_FOLDER"

echo "📥 Descargando reel:"
echo "  URL: $URL"
echo "  Output: $OUTPUT_FOLDER/video.mp4"
echo "  Browser cookies: $BROWSER"
echo ""

yt-dlp --cookies-from-browser "$BROWSER" \
    -o "$OUTPUT_FOLDER/video.%(ext)s" \
    "$URL"

if [ -f "$OUTPUT_FOLDER/video.mp4" ]; then
    echo ""
    echo "✅ Descarga completa: $OUTPUT_FOLDER/video.mp4"
else
    echo ""
    echo "⚠️  Descarga puede no ser .mp4. Verifica:"
    ls -lh "$OUTPUT_FOLDER/video."* 2>/dev/null || echo "  No se encontró archivo de vídeo"
    echo ""
    echo "Posibles causas:"
    echo "  1. Cookies expiradas · cierra y abre $BROWSER · vuelve a intentar"
    echo "  2. Prueba otro navegador: firefox · brave · edge"
    echo "  3. IG ha bloqueado tu IP temporalmente · espera 10-15 min"
    exit 1
fi
