---
description: ⭐ Diagnostica e INSTALA automáticamente TODO lo necesario para Zenith Audience · CLIs (ffmpeg · yt-dlp) · deps Python (pytrends · praw · faster-whisper · apify-client) · verifica MCPs (Metricool · Apify) · variables de entorno. Claude lo ejecuta solo. Invocar al instalar la skill o si algo falla.
---

# /audience-doctor ⭐

Diagnóstico + auto-instalación completa de Zenith Audience.

## Uso

```
/audience-doctor          # verifica TODO e instala lo que falta
/audience-doctor check    # solo verifica (no instala)
```

## Qué hago (Claude lo ejecuta automáticamente)

### 1 · Verifico CLIs críticos
```bash
bash scripts/setup-check.sh
```

Comprueba e **instala automáticamente** si faltan:
- **python3** (necesario)
- **ffmpeg + ffprobe** (extracción de frames) → `brew install ffmpeg` o `apt install ffmpeg`
- **yt-dlp** (descarga reels) → `pip install yt-dlp`
- **git**

### 2 · Verifico + instalo deps Python
- pytrends · praw · faster-whisper · apify-client
- google-api-python-client · youtube-transcript-api · python-dotenv

Si faltan → las instalo con `pip install --user --break-system-packages`

### 3 · Verifico MCPs (y guío configuración)
- **Metricool MCP** (métricas) → si falta, te doy el comando exacto
- **Apify MCP** (scraping) → si falta, te guío paso a paso

### 4 · Verifico variables de entorno (.env)
- Si no existe `.env` → lo creo desde `.env.example`
- Verifico APIFY_TOKEN · REDDIT_CLIENT_ID · YOUTUBE_API_KEY

### 5 · Reporte de funcionalidad

Te digo exactamente qué funciona y qué no:
```
• Crear reels/carruseles/hilos: ✅ siempre
• Trends Google/Reddit/YT: ✅/⚠
• Análisis viral (pipeline 10 pasos): ✅/⚠
• Métricas reels: ✅/⚠
• Scraping competidores: ✅/⚠
```

## Cuándo invocar

- **Al instalar la skill por primera vez** (obligatorio)
- **Si un comando falla** (diagnostica el problema)
- **Cada vez que actualizas la skill** (verifica que todo sigue OK)
- Antes de usar el pipeline de análisis viral (verifica ffmpeg + yt-dlp)

## Qué hace Claude automáticamente

Cuando ejecutas `/audience-doctor`, yo (Claude):

1. Ejecuto `scripts/setup-check.sh`
2. Leo el output
3. **Instalo lo que falte** (CLIs vía brew/apt · Python vía pip)
4. Te **guío para configurar los MCPs** (Apify · Metricool) con comandos copy-paste
5. Te confirmo qué funcionalidades quedan activas

## Niveles de funcionalidad

### Nivel 0 · Solo Claude (sin instalar nada)
✅ Crear reels · carruseles · hilos · headlines · núcleo de influencia
✅ Templates · gatillos · formatos · estructuras

### Nivel 1 · + Deps Python (gratis)
✅ Todo lo anterior
✅ Trends Google (pytrends)
✅ Trends Reddit (praw)
✅ Trends YouTube (API)

### Nivel 2 · + CLIs (ffmpeg + yt-dlp · gratis)
✅ Todo lo anterior
✅ Pipeline análisis viral completo (descarga + frames + transcripción)

### Nivel 3 · + MCPs (Metricool Free + Apify Free $5)
✅ TODO al 100%
✅ Métricas reels + decisión REPLICAR/ITERAR
✅ Scraping competidores + perfil completo

## El objetivo

Que NUNCA falle nada. Si te falta algo, yo lo instalo o te guío exactamente cómo hacerlo. Sin friction.
