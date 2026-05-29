#!/usr/bin/env bash
# Zenith Audience™ · Auto-installer COMPLETO · macOS/Linux
# Instala el plugin + TODAS las dependencias + verifica MCPs

set -e

CYAN='\033[0;36m'; PURPLE='\033[0;35m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'

echo -e "${PURPLE}╔══════════════════════════════════════════════════╗${NC}"
echo -e "${PURPLE}║    Zenith Audience™ · Instalación Completa       ║${NC}"
echo -e "${PURPLE}╚══════════════════════════════════════════════════╝${NC}"
echo ""

# ── 1. Claude Code ──
if ! command -v claude &>/dev/null; then
    echo -e "${YELLOW}⚠️  Claude Code no detectado. Instálalo: https://claude.com/claude-code${NC}"
fi
echo -e "${GREEN}✓ Verificando entorno...${NC}"

# ── 2. Clonar/actualizar en skills ──
SKILLS_DIR="$HOME/.claude/skills"
mkdir -p "$SKILLS_DIR"
TARGET="$SKILLS_DIR/zenith-audience"

if [ -d "$TARGET/.git" ]; then
    echo -e "${CYAN}→ Actualizando skill existente...${NC}"
    cd "$TARGET" && git pull --quiet
else
    echo -e "${CYAN}→ Clonando skill...${NC}"
    rm -rf "$TARGET"
    git clone --quiet https://github.com/zenithmetodo/zenith-audience.git "$TARGET"
fi
echo -e "${GREEN}✓ Skill instalada en $TARGET${NC}"

# ── 3. CLIs del pipeline (ffmpeg + yt-dlp) ──
echo ""
echo -e "${CYAN}▶ Instalando CLIs del pipeline...${NC}"

# ffmpeg
if ! command -v ffmpeg &>/dev/null; then
    if command -v brew &>/dev/null; then
        echo "  Instalando ffmpeg (brew)..."
        brew install ffmpeg 2>&1 | tail -1
    elif command -v apt &>/dev/null; then
        echo "  Instalando ffmpeg (apt)..."
        sudo apt install -y ffmpeg 2>&1 | tail -1
    else
        echo -e "  ${YELLOW}⚠ Instala ffmpeg manualmente${NC}"
    fi
else
    echo -e "  ${GREEN}✓ ffmpeg ya instalado${NC}"
fi

# ── 4. Dependencias Python ──
echo ""
echo -e "${CYAN}▶ Instalando dependencias Python...${NC}"
if command -v python3 &>/dev/null; then
    PIP_FLAGS="--user"
    python3 -m pip install --help 2>/dev/null | grep -q "break-system-packages" && PIP_FLAGS="--user --break-system-packages"
    python3 -m pip install -q $PIP_FLAGS -r "$TARGET/requirements.txt" 2>&1 | tail -3 || \
        echo -e "  ${YELLOW}⚠ Algunas deps fallaron · ejecuta /audience-doctor en Claude${NC}"
    echo -e "  ${GREEN}✓ Dependencias Python procesadas${NC}"
else
    echo -e "  ${RED}✗ Python 3 no detectado${NC}"
fi

# ── 5. .env ──
echo ""
if [ ! -f "$TARGET/.env" ]; then
    cp "$TARGET/.env.example" "$TARGET/.env" 2>/dev/null || true
    echo -e "${GREEN}✓ .env creado · edítalo con tus tokens${NC}"
fi

# ── 6. Verificación final ──
echo ""
echo -e "${CYAN}▶ Verificación final...${NC}"
bash "$TARGET/scripts/setup-check.sh" --check 2>/dev/null | tail -12

# ── 7. MCPs (guía) ──
echo ""
echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
echo -e "${GREEN}✅ Zenith Audience instalado${NC}"
echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
echo ""
echo -e "${CYAN}PASO FINAL · Configura los MCPs (recomendado):${NC}"
echo ""
echo -e "${YELLOW}1. Metricool MCP (métricas · gratis):${NC}"
echo "   claude mcp add --transport http metricool https://ai.metricool.com/mcp"
echo ""
echo -e "${YELLOW}2. Apify MCP (scraping/análisis viral · free \$5/mes):${NC}"
echo "   • Token: https://console.apify.com/account/integrations"
echo "   • claude mcp add --transport http apify https://mcp.apify.com \\"
echo "       --header \"Authorization=Bearer TU_TOKEN\""
echo ""
echo -e "${CYAN}Luego · en Claude Code ejecuta:${NC}"
echo -e "   ${GREEN}/audience-doctor${NC}  (verifica que TODO está listo)"
echo -e "   ${GREEN}/audience-setup${NC}   (define tu núcleo de influencia)"
echo -e "   ${GREEN}/audience-ideas${NC}   (primeras 15-20 ideas)"
echo ""
