# Setup Apify MCP · paso a paso

> Scrapers TikTok · Instagram · YouTube · 5000+ actores. Plan Free $5/mes (~2000 scrapes).

---

## Por qué Apify

✅ **MCP oficial** Apify · integración nativa Claude Code
✅ **Plan Free $5/mes** · pay-per-use después
✅ **Scrapers TikTok + IG** (sin APIs oficiales disponibles)
✅ **Scrapers competidores · trending · hashtags · audios**
✅ **Usado por agentes:** spy-competidor · trend-redes · ideas-ganadoras-adapter

---

## Setup en 4 pasos

### Paso 1 · Crear cuenta Apify Free

1. Ve a https://apify.com
2. Sign up con email (sin tarjeta de crédito)
3. Verifica email

### Paso 2 · Obtener API token

1. Login en https://console.apify.com
2. Settings · Integrations · API token
3. Copia tu token personal

### Paso 3 · Añadir al `.env`

```bash
APIFY_TOKEN=apify_api_xxxxxxxxxxxxxxxxxxxx
```

### Paso 4 · Instalar MCP

```bash
claude mcp add --transport http apify https://mcp.apify.com \
  --header "Authorization=Bearer $APIFY_TOKEN"
```

Verifica:
```bash
claude mcp list
```

---

## Test

```bash
/audience-spy @marconi_romulo
```

Debe ejecutar scraper Apify y devolver reporte.

---

## Scrapers recomendados (que usa Zenith Audience)

### Instagram
- **Profile Scraper** (`apify/instagram-profile-scraper`)
  - Posts · vídeos · stories
  - ~$2.30 / 1000 posts
- **Hashtag Scraper** (`apify/instagram-hashtag-scraper`)
  - Posts top por hashtag
- **Reel Scraper** específico

### TikTok
- **TikTok Scraper API** (`apidojo/tiktok-scraper-api`)
  - Views · likes · comments · shares · saves
  - 50+ campos por vídeo
  - Sin watermark download

### YouTube
- **YouTube Channel Scraper** (`epctex/youtube-channel-scraper`)
  - Lista vídeos · stats · descripción

---

## Estimación de coste por uso

| Acción | Plataforma | Coste aprox |
|---|---|---|
| Spy 30 posts competidor | IG | ~$0.30 |
| Spy 30 vídeos | TT | ~$0.40 |
| Trending de la semana | TT/IG | ~$0.30-0.50 |
| Hashtag scraping | IG | ~$0.20 |

**Con $5 free/mes → ~10-15 scrapes mensuales · suficiente para uso normal de creador individual.**

Si necesitas más → upgrade a plan Pago ($49/mes con $49 crédito).

---

## Configuración avanzada

### Webhook de notificaciones (opcional)
Apify puede notificar cuando un scrape termina:
```bash
APIFY_WEBHOOK_URL=https://tu-endpoint.com
```

### Schedule de scrapes recurrentes
Desde Apify dashboard puedes programar scrapes automáticos (no necesario · el plugin los lanza on-demand).

---

## Problemas comunes

### "Token inválido"
- Verifica `.env` correcto
- Re-genera token en Apify console

### "Insufficient credits"
- Plan Free agotado este mes ($5)
- Espera al mes siguiente o upgrade

### "Scraper failed"
- IG/TT cambian anti-scraping a veces
- Reintenta en unos minutos
- Verifica perfil público (no privado)

### "Scraper lento"
- Es normal · pueden tardar 1-3 minutos
- TT más rápido que IG

---

## Alternativas si no quieres Apify

El plugin sigue funcionando SIN Apify (con limitaciones):
- `spy-competidor` solo funciona vía URLs específicas con yt-dlp
- `trend-redes` deshabilitado · usa solo trend-google + trend-foros
- `ideas-ganadoras-adapter` funciona sin Apify (usa web search + IA)

Para usuarios sin budget Apify · esto es suficiente.

---

## Recursos

- **Apify:** https://apify.com
- **Docs MCP:** https://github.com/apify/apify-mcp-server
- **Pricing:** https://apify.com/pricing
