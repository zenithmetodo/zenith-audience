# Instalación · Zenith Audience™

> Guía completa de instalación y setup post-install.

---

## Requisitos previos

- **Claude Code** instalado y actualizado
- **Python 3.10+** (para scripts opcionales de trends y transcripción)
- Cuenta de **Anthropic API** (para Claude)

---

## Opción 1 · Instalación rápida (recomendada)

### macOS / Linux

```bash
curl -fsSL https://raw.githubusercontent.com/zenithmetodo/zenith-audience/main/install.sh | bash
```

### Windows (PowerShell)

```powershell
iwr -useb https://raw.githubusercontent.com/zenithmetodo/zenith-audience/main/install.ps1 | iex
```

El script:
1. Clona el repo en `~/.claude/plugins/zenith-audience`
2. Instala dependencias Python (si tienes pip)
3. Configura `.env.example`
4. Lista los siguientes pasos

---

## Opción 2 · Marketplace de Claude Code

```bash
/plugin marketplace add https://github.com/zenithmetodo/zenith-audience
/plugin install zenith-audience
```

---

## Opción 3 · Manual

```bash
mkdir -p ~/.claude/plugins
git clone https://github.com/zenithmetodo/zenith-audience.git ~/.claude/plugins/zenith-audience
cd ~/.claude/plugins/zenith-audience
pip install -r requirements.txt
```

---

## Setup post-instalación

### 1 · Verificar plugin cargado

En Claude Code:

```bash
/plugins list
```

Debe aparecer `zenith-audience`.

### 2 · Configurar Metricool MCP (métricas)

```bash
claude mcp add --transport http metricool https://ai.metricool.com/mcp
```

Al primer uso del comando `/audience-metrics` te abrirá browser para autenticar OAuth.

Si prefieres token manual:
1. Crea cuenta en https://metricool.com (plan Free)
2. Conecta tus cuentas IG/TT/YT
3. Obtén token de API
4. Añade al `.env`:
   ```
   METRICOOL_USER_TOKEN=tu_token
   METRICOOL_USER_ID=tu_user_id
   ```

Setup detallado: [METRICOOL_SETUP.md](METRICOOL_SETUP.md)

### 3 · Configurar Apify MCP (research)

```bash
# Obtén token en https://console.apify.com/account/integrations
claude mcp add --transport http apify https://mcp.apify.com \
  --header "Authorization=Bearer YOUR_APIFY_TOKEN"
```

Plan Free incluye $5/mes (~2000 scrapes).

Setup detallado: [APIFY_SETUP.md](APIFY_SETUP.md)

### 4 · Configurar APIs gratis (opcional · para trends)

#### Reddit
1. Crea app en https://www.reddit.com/prefs/apps
2. Añade al `.env`:
   ```
   REDDIT_CLIENT_ID=xxxxx
   REDDIT_CLIENT_SECRET=xxxxx
   REDDIT_USER_AGENT=ZenithAudience/1.0
   ```

#### YouTube Data API v3
1. Crea proyecto en https://console.cloud.google.com
2. Activa YouTube Data API v3
3. Obtén API key
4. Añade al `.env`:
   ```
   YOUTUBE_API_KEY=xxxxx
   ```

### 5 · Setup Whisper (opcional · para transcripción local)

```bash
pip install faster-whisper yt-dlp
```

Al primer uso descarga el modelo `medium` (~1.5GB) · solo 1 vez.

Setup detallado: [WHISPER_SETUP.md](WHISPER_SETUP.md)

---

## Verificación

### Lista comandos disponibles
```bash
/help
```

Debes ver los 15 comandos `/audience-*`.

### Test rápido
```bash
/audience-ideas
```

Debes recibir 20 ideas en ~30 segundos.

---

## Estructura de archivos instalada

```
~/.claude/plugins/zenith-audience/
├── .claude-plugin/plugin.json     ← Manifest del plugin
├── agents/                         ← 29 agentes especializados
├── commands/                       ← 15 slash commands
├── knowledge/                      ← 32 archivos del método
├── templates/                      ← 7 HTML estéticos PDF-ready
├── examples/                       ← Casos canónicos
├── mcp-servers/                    ← Configs Metricool + Apify
├── scripts/                        ← Scripts Python (gratis)
├── assets/                         ← Logo + diagramas SVG
└── README.md
```

---

## Variables de entorno (.env)

Copia el `.env.example` a `.env` y rellena:

```bash
# Metricool (opcional · OAuth se usa por defecto)
METRICOOL_USER_TOKEN=
METRICOOL_USER_ID=

# Apify (necesario si usas spy-competidor y trend-redes)
APIFY_TOKEN=

# Reddit (necesario si usas trend-foros)
REDDIT_CLIENT_ID=
REDDIT_CLIENT_SECRET=
REDDIT_USER_AGENT=ZenithAudience/1.0

# YouTube (necesario si usas trend-foros con YT)
YOUTUBE_API_KEY=
```

**IMPORTANTE:** `.env` NO se commitea al repo (está en `.gitignore`).

---

## Problemas comunes

### El plugin no aparece en `/plugins list`
- Reinicia Claude Code
- Verifica path: `ls ~/.claude/plugins/zenith-audience/`

### Comando `/audience-metrics` falla
- Verifica Metricool MCP: `claude mcp list`
- Confirma OAuth completado

### Scripts Python fallan
- Verifica Python 3.10+: `python --version`
- Reinstala: `pip install -r requirements.txt --upgrade`

### Whisper muy lento
- Cambia a modelo `small`: edita `whisper-transcribe.py` parámetro `--model`
- Usa GPU si disponible: `--compute float16`

---

## Actualizar Zenith Audience

```bash
cd ~/.claude/plugins/zenith-audience
git pull
pip install -r requirements.txt --upgrade
```

---

## Desinstalar

```bash
rm -rf ~/.claude/plugins/zenith-audience
claude mcp remove metricool
claude mcp remove apify
```

---

## Soporte

- **Issues:** https://github.com/zenithmetodo/zenith-audience/issues
- **Email:** impactodigitalformacionbrasil@gmail.com
- **Twitter:** @zenithmetodo
