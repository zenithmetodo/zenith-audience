#!/usr/bin/env bash
# Zenith Audience™ · Auto-installer · macOS/Linux

set -e

CYAN='\033[0;36m'
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${PURPLE}╔══════════════════════════════════════════════╗${NC}"
echo -e "${PURPLE}║      Zenith Audience™ Installer v1.0.0       ║${NC}"
echo -e "${PURPLE}╚══════════════════════════════════════════════╝${NC}"
echo ""

# 1. Verificar Claude Code
if ! command -v claude &> /dev/null; then
    echo -e "${CYAN}⚠️  Claude Code no detectado. Instálalo primero:${NC}"
    echo "   https://claude.com/claude-code"
    exit 1
fi
echo -e "${GREEN}✓ Claude Code detectado${NC}"

# 2. Crear directorio plugins
PLUGINS_DIR="$HOME/.claude/plugins"
mkdir -p "$PLUGINS_DIR"
echo -e "${GREEN}✓ Directorio plugins creado${NC}"

# 3. Clonar el repo
TARGET="$PLUGINS_DIR/zenith-audience"
if [ -d "$TARGET" ]; then
    echo -e "${CYAN}⚠️  Zenith Audience ya existe. Actualizando...${NC}"
    cd "$TARGET"
    git pull
else
    git clone https://github.com/zenithmetodo/zenith-audience.git "$TARGET"
fi
echo -e "${GREEN}✓ Repo descargado${NC}"

# 4. Instalar deps Python (opcional)
if command -v pip &> /dev/null; then
    echo -e "${CYAN}→ Instalando dependencias Python opcionales...${NC}"
    pip install -r "$TARGET/requirements.txt" --quiet || echo "(Skip · puedes instalar después manualmente)"
    echo -e "${GREEN}✓ Python deps instaladas${NC}"
fi

# 5. Copiar .env.example
if [ ! -f "$TARGET/.env" ]; then
    cp "$TARGET/.env.example" "$TARGET/.env" 2>/dev/null || true
    echo -e "${GREEN}✓ .env creado · edítalo con tus tokens${NC}"
fi

echo ""
echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
echo -e "${GREEN}✅ Zenith Audience instalado correctamente${NC}"
echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
echo ""
echo -e "${CYAN}Próximos pasos:${NC}"
echo ""
echo "1. Configura Metricool MCP (métricas · gratis):"
echo "   claude mcp add --transport http metricool https://ai.metricool.com/mcp"
echo ""
echo "2. (Opcional) Configura Apify MCP (research · free \$5/mes):"
echo "   • Token en https://console.apify.com/account/integrations"
echo "   • claude mcp add --transport http apify https://mcp.apify.com \\"
echo "       --header \"Authorization=Bearer YOUR_TOKEN\""
echo ""
echo "3. Edita .env con tus tokens:"
echo "   nano $TARGET/.env"
echo ""
echo "4. Reinicia Claude Code y prueba:"
echo "   /audience-ideas"
echo ""
echo -e "${PURPLE}Docs completas:${NC} $TARGET/INSTALL.md"
echo ""
