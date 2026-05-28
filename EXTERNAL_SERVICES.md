# Servicios Externos · Zenith Audience™

> Resumen de TODOS los servicios externos · cuáles son gratis · cuáles cuestan · setup links.

---

## Resumen rápido

| Servicio | Coste | Necesario | Para qué |
|---|---|---|---|
| **Anthropic Claude** | Pay-per-use (~$25/mes uso intenso) | ✅ Obligatorio | Motor del plugin |
| **Metricool** | $0 plan Free | ⚠️ Recomendado | Métricas IG/TT/YT/etc. |
| **Apify** | $0 plan Free ($5/mes credit) | ⚠️ Recomendado | Spy competidores · trends |
| **Reddit API** | $0 (oficial gratis) | ⏸️ Opcional | Trends foros |
| **YouTube Data API** | $0 (10K cuota/día gratis) | ⏸️ Opcional | Trends YT |
| **pytrends** | $0 (sin API key) | ⏸️ Opcional | Google Trends |
| **faster-whisper** | $0 (local · open source) | ⏸️ Opcional | Transcripción audio/video |
| **yt-dlp** | $0 (open source) | ⏸️ Opcional | Descarga IG/TT/YT |

**Coste total promedio: ~$20-25/mes** (solo Claude API).

---

## Detalle por servicio

### 1 · Anthropic Claude API

- **Plan:** pay-per-use
- **Modelos usados:** Opus 4.7 (crítico) · Sonnet 4.6 (mayoría) · Haiku 4.5 (clasificación)
- **Setup:** automático con Claude Code
- **Coste estimado uso intenso diario:** ~$25/mes
- **Optimización:** plugin usa modelo apropiado según complejidad

### 2 · Metricool

- **Tier usado:** Free permanente
- **Setup:** [METRICOOL_SETUP.md](METRICOOL_SETUP.md)
- **MCP oficial:** `https://ai.metricool.com/mcp`
- **Cubre:** IG · TT · YT · FB · Pinterest · Threads · Bluesky · Twitch
- **Limit Free:** 1 marca · 30 días histórico · 5 competidores
- **Upgrade si necesitas:** Starter 16€/mes (5 marcas) · Advanced 43€/mes (15 marcas + histórico ilimitado)

### 3 · Apify

- **Tier usado:** Free ($5/mes crédito · ~2000 scrapes)
- **Setup:** [APIFY_SETUP.md](APIFY_SETUP.md)
- **MCP oficial:** `https://mcp.apify.com`
- **Scrapers que usa el plugin:**
  - `apify/instagram-profile-scraper`
  - `apidojo/tiktok-scraper-api`
  - `epctex/youtube-channel-scraper`
- **Upgrade si necesitas:** Plan Personal $49/mes con $49 credit

### 4 · Reddit API (PRAW)

- **Coste:** 100% gratis
- **Setup:** [INSTALL.md#reddit](INSTALL.md#reddit)
- **Limit:** generoso para uso individual
- **Necesario para:** agente `trend-foros` (parte Reddit)

### 5 · YouTube Data API v3

- **Coste:** gratis con cuota 10K unidades/día
- **Setup:** Google Cloud Console
- **Necesario para:** agente `trend-foros` (parte YT)

### 6 · pytrends (Google Trends)

- **Coste:** 100% gratis · sin API key
- **Setup:** `pip install pytrends`
- **Necesario para:** agente `trend-google`

### 7 · faster-whisper

- **Coste:** 100% gratis (open source · local)
- **Setup:** [WHISPER_SETUP.md](WHISPER_SETUP.md)
- **Modelo recomendado:** `medium` (~1.5GB · download 1 vez)
- **Necesario para:** transcripción de IG/TT (agentes spy · engenharia · ideas-ganadoras)

### 8 · yt-dlp

- **Coste:** 100% gratis (open source)
- **Setup:** `pip install yt-dlp`
- **Necesario para:** descarga audio/video de IG/TT/YT (pre-Whisper)

---

## ¿Qué pasa si NO configuro algunos?

### Sin Metricool MCP
- `/audience-metrics` no funciona
- Resto del plugin sigue OK
- Solución alternativa: pega screenshot de Meta Business · pregunta a Claude directamente

### Sin Apify MCP
- `spy-competidor` solo funciona con URLs específicas (no perfiles enteros)
- `trend-redes` deshabilitado
- `ideas-ganadoras-adapter` funciona pero sin scrapear trends activos

### Sin APIs (Reddit · YouTube · pytrends)
- `trend-foros` deshabilitado
- `trend-google` deshabilitado
- Plugin sigue 80% funcional

### Sin Whisper / yt-dlp
- `engenharia-reversa` solo funciona con vídeos YT (vía youtube-transcript-api)
- `ideas-ganadoras-adapter` no puede analizar audio IG/TT
- Setup mínimo recomendado · es 100% gratis

---

## Configuración mínima recomendada

Si quieres empezar GRATIS sin instalar nada de pago:

```bash
# 1. Solo Claude API (ya tienes con Claude Code)

# 2. Metricool MCP gratis (5 min setup)
claude mcp add --transport http metricool https://ai.metricool.com/mcp

# 3. APIs gratis (15 min setup)
# - Reddit: crea app en reddit.com/prefs/apps
# - YouTube: crea API key en console.cloud.google.com

# 4. Whisper + yt-dlp (gratis · local)
pip install youtube-transcript-api yt-dlp faster-whisper

# 5. Apify cuando quieras spy de competidores (opcional · $0)
```

Con esto **el plugin funciona al 100% sin pagar nada** (excepto API de Claude usual).
