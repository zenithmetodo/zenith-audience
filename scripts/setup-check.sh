#!/usr/bin/env bash
# Zenith Audience · Setup Check & Auto-Install
#
# Verifica TODAS las dependencias necesarias y las instala automáticamente.
# Claude ejecuta este script al primer uso de la skill (vía /audience-doctor).
#
# Uso:
#   bash setup-check.sh           # verifica + instala lo que falta
#   bash setup-check.sh --check   # solo verifica (no instala)

set +e  # No abortar en error · queremos diagnóstico completo

CHECK_ONLY=false
[ "$1" = "--check" ] && CHECK_ONLY=true

CYAN='\033[0;36m'; PURPLE='\033[0;35m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'

echo -e "${PURPLE}╔══════════════════════════════════════════════════╗${NC}"
echo -e "${PURPLE}║   Zenith Audience · Setup Check & Auto-Install   ║${NC}"
echo -e "${PURPLE}╚══════════════════════════════════════════════════╝${NC}"
echo ""

MISSING=()
OK_COUNT=0
WARN_COUNT=0

# ─────────────────────────────────────────────
# 1. CLIs CRÍTICOS (pipeline análisis viral)
# ─────────────────────────────────────────────
echo -e "${CYAN}▶ CLIs del pipeline (obligatorios)${NC}"

check_cli() {
    local cmd="$1" install_hint="$2"
    if command -v "$cmd" &>/dev/null; then
        echo -e "  ${GREEN}✓${NC} $cmd"
        OK_COUNT=$((OK_COUNT+1))
    else
        echo -e "  ${RED}✗${NC} $cmd · $install_hint"
        MISSING+=("$cmd")
    fi
}

check_cli "python3" "Instala Python 3 desde python.org"
check_cli "ffmpeg" "brew install ffmpeg (Mac) · apt install ffmpeg (Linux)"
check_cli "ffprobe" "viene con ffmpeg"
check_cli "yt-dlp" "pip install yt-dlp · o brew install yt-dlp"
check_cli "git" "Instala git"
echo ""

# ─────────────────────────────────────────────
# 2. DEPENDENCIAS PYTHON
# ─────────────────────────────────────────────
echo -e "${CYAN}▶ Dependencias Python${NC}"

PY_MISSING=()
check_py() {
    local mod="$1" pkg="$2"
    if python3 -c "import $mod" 2>/dev/null; then
        echo -e "  ${GREEN}✓${NC} $pkg"
        OK_COUNT=$((OK_COUNT+1))
    else
        echo -e "  ${YELLOW}⚠${NC} $pkg (falta)"
        PY_MISSING+=("$pkg")
    fi
}

check_py "pytrends" "pytrends"
check_py "praw" "praw"
check_py "faster_whisper" "faster-whisper"
check_py "apify_client" "apify-client"
check_py "yt_dlp" "yt-dlp"
check_py "dotenv" "python-dotenv"
check_py "googleapiclient" "google-api-python-client"
check_py "youtube_transcript_api" "youtube-transcript-api"
echo ""

# Auto-instalar deps Python si faltan
if [ ${#PY_MISSING[@]} -gt 0 ] && [ "$CHECK_ONLY" = false ]; then
    echo -e "${CYAN}▶ Instalando deps Python que faltan...${NC}"
    SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

    # Detectar método pip
    PIP_FLAGS=""
    if python3 -m pip install --help 2>/dev/null | grep -q "break-system-packages"; then
        PIP_FLAGS="--user --break-system-packages"
    else
        PIP_FLAGS="--user"
    fi

    python3 -m pip install -q $PIP_FLAGS "${PY_MISSING[@]}" 2>&1 | tail -3
    echo -e "  ${GREEN}✓${NC} Deps Python instaladas (reverifica con --check)"
    echo ""
fi

# ─────────────────────────────────────────────
# 3. MCPs (Apify + Metricool)
# ─────────────────────────────────────────────
echo -e "${CYAN}▶ MCPs (recomendados)${NC}"

if command -v claude &>/dev/null; then
    MCP_LIST=$(claude mcp list 2>/dev/null || echo "")

    if echo "$MCP_LIST" | grep -qi "metricool"; then
        echo -e "  ${GREEN}✓${NC} Metricool MCP configurado"
        OK_COUNT=$((OK_COUNT+1))
    else
        echo -e "  ${YELLOW}⚠${NC} Metricool MCP NO configurado (métricas)"
        echo -e "      ${CYAN}claude mcp add --transport http metricool https://ai.metricool.com/mcp${NC}"
        WARN_COUNT=$((WARN_COUNT+1))
    fi

    if echo "$MCP_LIST" | grep -qi "apify"; then
        echo -e "  ${GREEN}✓${NC} Apify MCP configurado"
        OK_COUNT=$((OK_COUNT+1))
    else
        echo -e "  ${YELLOW}⚠${NC} Apify MCP NO configurado (scraping/análisis viral)"
        echo -e "      1. Token gratis en https://console.apify.com/account/integrations"
        echo -e "      ${CYAN}claude mcp add --transport http apify https://mcp.apify.com --header \"Authorization=Bearer TU_TOKEN\"${NC}"
        WARN_COUNT=$((WARN_COUNT+1))
    fi
else
    echo -e "  ${YELLOW}⚠${NC} comando 'claude' no detectado · no puedo verificar MCPs"
fi
echo ""

# ─────────────────────────────────────────────
# 4. VARIABLES DE ENTORNO (.env)
# ─────────────────────────────────────────────
echo -e "${CYAN}▶ Variables de entorno (.env)${NC}"
ENV_FILE="$(cd "$(dirname "$0")/.." && pwd)/.env"

if [ -f "$ENV_FILE" ]; then
    echo -e "  ${GREEN}✓${NC} .env existe"
    for var in APIFY_TOKEN REDDIT_CLIENT_ID YOUTUBE_API_KEY; do
        if grep -q "^${var}=." "$ENV_FILE" 2>/dev/null; then
            echo -e "    ${GREEN}✓${NC} $var configurado"
        else
            echo -e "    ${YELLOW}⚠${NC} $var vacío (opcional)"
        fi
    done
else
    echo -e "  ${YELLOW}⚠${NC} .env no existe · copiando desde .env.example..."
    if [ "$CHECK_ONLY" = false ]; then
        cp "$(dirname "$ENV_FILE")/.env.example" "$ENV_FILE" 2>/dev/null && \
            echo -e "    ${GREEN}✓${NC} .env creado · edítalo con tus tokens"
    fi
fi
echo ""

# ─────────────────────────────────────────────
# RESUMEN
# ─────────────────────────────────────────────
echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
echo -e "${PURPLE}RESUMEN${NC}"
echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
echo -e "  ${GREEN}✓ OK: $OK_COUNT${NC}"
echo -e "  ${YELLOW}⚠ Avisos: $WARN_COUNT${NC}"

if [ ${#MISSING[@]} -gt 0 ]; then
    echo -e "  ${RED}✗ CRÍTICOS faltantes: ${MISSING[*]}${NC}"
    echo ""
    echo -e "${RED}⛔ Instala los CLIs críticos antes de usar el pipeline de análisis viral.${NC}"

    # Auto-instalar ffmpeg/yt-dlp si es posible
    if [ "$CHECK_ONLY" = false ]; then
        echo ""
        echo -e "${CYAN}▶ Intentando auto-instalar CLIs faltantes...${NC}"
        for m in "${MISSING[@]}"; do
            case "$m" in
                ffmpeg|ffprobe)
                    if command -v brew &>/dev/null; then
                        echo "  Instalando ffmpeg con brew..."
                        brew install ffmpeg 2>&1 | tail -2
                    elif command -v apt &>/dev/null; then
                        echo "  Instalando ffmpeg con apt..."
                        sudo apt install -y ffmpeg 2>&1 | tail -2
                    fi
                    ;;
                yt-dlp)
                    echo "  Instalando yt-dlp con pip..."
                    python3 -m pip install --user --break-system-packages -q yt-dlp 2>&1 | tail -2
                    ;;
            esac
        done
    fi
else
    echo ""
    echo -e "${GREEN}✅ TODO LISTO · el pipeline completo funciona${NC}"
fi

echo ""
echo -e "${CYAN}Estado de funcionalidad:${NC}"
echo -e "  • Crear reels/carruseles/hilos: ✅ siempre (solo Claude)"
echo -e "  • Trends Google/Reddit/YT: $([ ${#PY_MISSING[@]} -eq 0 ] && echo '✅' || echo '⚠ instala deps Python')"
echo -e "  • Análisis viral (pipeline 9 pasos): $(command -v ffmpeg &>/dev/null && command -v yt-dlp &>/dev/null && echo '✅' || echo '⚠ instala ffmpeg + yt-dlp')"
echo -e "  • Métricas reels: $(echo "$MCP_LIST" | grep -qi metricool && echo '✅' || echo '⚠ configura Metricool MCP')"
echo -e "  • Scraping competidores: $(echo "$MCP_LIST" | grep -qi apify && echo '✅' || echo '⚠ configura Apify MCP')"
