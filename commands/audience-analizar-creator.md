---
description: ⭐ Pipeline COMPLETO de análisis de creator viral · scrape perfil IG (Apify) → top virales → descarga (yt-dlp) → 5 frames (ffmpeg) → transcripción (Whisper) → TRANSCRIPCION.md por reel + GUION_ADAPTADO.md al núcleo. Multimodal (texto + 5 frames + datos).
---

# /audience-analizar-creator ⭐

Pipeline completo de análisis de creator viral · 9 pasos · multimodal.

## Uso

```
/audience-analizar-creator @nathan_perdriau
/audience-analizar-creator @nathan_perdriau --top 10
/audience-analizar-creator @nathan_perdriau --top 5 --browser firefox
```

O URLs específicas (sin Apify):
```
/audience-analizar-creator https://instagram.com/p/Cz1/,https://instagram.com/p/Cz2/
```

## Lo que hago

Invoco `engenharia-reversa` que ejecuta el pipeline completo:

### Stack técnico
- **Apify MCP** · scraping perfil
- **yt-dlp** · descarga `.mp4` (cookies-from-browser)
- **ffmpeg + ffprobe** · 5 frames extraídos (5% · 25% · 50% · 75% · 95%)
- **Whisper** (faster-whisper) · transcripción
- **Análisis multimodal** · leo frames con Read tool

### Los 9 pasos del pipeline

1. Input del usuario (@user o URLs)
2. Scrape perfil con `apify/instagram-post-scraper`
3. Filtro top N reels por viralidad (engagement absoluto/relativo/views)
4. Estructura de carpetas `🆕<N>_<ID>/`
5. Descarga vídeos en paralelo
6. **Extracción de 5 frames por reel** (clave para identificar formato visual)
7. Transcripción Whisper en paralelo
8. Genero `TRANSCRIPCION.md` por reel (idea ganadora + análisis Zenith)
9. Genero `GUION_ADAPTADO.md` adaptado a tu núcleo

## Output

Estructura de carpetas en `/Users/[tu]/TRANSCRIPCION REELS/`:

```
🆕16_<ID1>/
├── video.mp4
├── video.txt
├── frame_5.jpg · frame_25.jpg · frame_50.jpg · frame_75.jpg · frame_95.jpg
├── TRANSCRIPCION.md   ⭐ análisis original
└── GUION_ADAPTADO.md  ⭐ tu versión
```

Plus **HTML consolidado** con resumen de patrones y recomendaciones.

## Tiempo
~7-13 min total (descarga · frames · transcripción todo en paralelo)

## Coste

**Incluido en plan Claude (Pro $20 · Max $100 · Max $200).**

Adicional:
- Apify: ~$0.10 por análisis (dentro de Free $5/mes)
- yt-dlp · ffmpeg · Whisper local: **$0**

## Requisitos previos

### Obligatorios
- `pip install yt-dlp faster-whisper` (ya en requirements.txt)
- `brew install ffmpeg` (Mac) o `apt install ffmpeg` (Linux)
- Cookies de Chrome (o firefox · brave · edge) activas

### Recomendado
- Apify MCP configurado:
  ```bash
  claude mcp add --transport http apify https://mcp.apify.com \
    --header "Authorization=Bearer TU_APIFY_TOKEN"
  ```

### Sin Apify
Funciona en modo degradado · pásame URLs específicas en lugar de @handle.

## Modo manual (sin Apify)

```
/audience-analizar-creator https://instagram.com/p/Cz1/,https://instagram.com/p/Cz2/,https://instagram.com/p/Cz3/
```

Salto pasos 1-3 (scraping perfil) y procedo directamente desde paso 4 con tus URLs.

## Cuándo invocar

- **Mensualmente:** análisis de 1-2 creators top del nicho
- **Cuando ves un viral interesante:** análisis profundo de 1 URL
- **Post-mortem:** TUS virales propios (cómo se generaron)
- **Antes de pivot creativo:** mapear gaps del nicho

## Diferencia con /audience-engenharia (1 vídeo)

| | `/audience-engenharia` | `/audience-analizar-creator` |
|---|---|---|
| Input | 1 URL | @user (5-10 reels) o N URLs |
| Output | 1 análisis profundo | 5-10 análisis + patrones consolidados |
| Tiempo | ~3-4 min | ~7-13 min |
| Mejor para | Análisis puntual viral concreto | Análisis profundo de un creator |

## Siguiente paso recomendado

Después del análisis:
- Eliges el TRANSCRIPCION.md más útil
- Usas su `GUION_ADAPTADO.md` con `/audience-reel` para guion completo + 4 ganchos
- O usas `/audience-iterar` para variantes

---

## Atribución

Pipeline validado en producción · 9 pasos · Joseph Moreno · Zenith.
