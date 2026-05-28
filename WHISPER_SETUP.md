# Setup Whisper · Transcripción 100% Local Gratis

> Transcribe audio/video de IG/TT/YT en español · portugués · inglés. Sin coste · sin enviar datos a la nube.

---

## Stack recomendado

- **youtube-transcript-api** (YouTube · instant · gratis)
- **yt-dlp** (descarga IG/TT/YT)
- **faster-whisper** (transcripción local · 4x más rápido que Whisper original)

---

## Instalación

```bash
pip install youtube-transcript-api yt-dlp faster-whisper
```

(Ya está en `requirements.txt` del plugin · `pip install -r requirements.txt` los instala todos.)

---

## Modelos Whisper · cuál elegir

| Modelo | Tamaño | RAM | Velocidad | Calidad |
|---|---|---|---|---|
| tiny | 39M | <1GB | 32x | Baja |
| base | 74M | <1GB | 16x | OK |
| small | 244M | 2GB | 6x | Buena |
| **medium** | **769M** | **5GB** | **2x** | **Excelente (RECOMENDADO)** |
| large-v3 | 1550M | 10GB | 1x | Máxima |

**Recomendado:** `medium` (sweet spot calidad/velocidad para ES/PT/EN).

---

## Cómo se usa (automático desde agentes)

Los agentes `spy-competidor` · `engenharia-reversa` · `ideas-ganadoras-adapter` usan transcripción AUTOMÁTICAMENTE:

```bash
/audience-engenharia https://instagram.com/reel/XXXXX/
```

Internamente:
1. Verifica si YT → usa `youtube-transcript-api` (instant)
2. Si IG/TT → descarga audio con `yt-dlp` (10-30s)
3. Transcribe con `faster-whisper medium` (1-3 min)
4. Análisis del texto resultante

**Tú no haces nada · todo se gestiona en background.**

---

## Uso manual (opcional)

### Transcribir YouTube
```bash
python scripts/yt-transcript.py --url "https://youtube.com/watch?v=XXXXX" --lang es
```

### Descargar audio IG/TT
```bash
python scripts/yt-dlp-download.py --url "https://instagram.com/reel/XXXXX/" --audio-only
```

### Transcribir audio local
```bash
python scripts/whisper-transcribe.py --file downloads/audio.mp3 --model medium --lang es
```

---

## Optimización por sistema

### macOS Apple Silicon (M1/M2/M3)
Usa `whisper.cpp` con CoreML para máxima velocidad:
```bash
brew install whisper-cpp
# 5-10x más rápido que faster-whisper en CPU
```

### Linux con GPU NVIDIA
```bash
pip install faster-whisper[gpu]
# Edita whisper-transcribe.py: --compute float16
```

### Windows / CPU
Usa configuración default · `medium` + `int8` (incluido en `whisper-transcribe.py`).

---

## Primera vez

El modelo `medium` se descarga al primer uso (~1.5GB) · UNA SOLA VEZ.

```bash
# Pre-descarga (opcional)
python -c "from faster_whisper import WhisperModel; WhisperModel('medium')"
```

---

## Tiempos esperados (medium · CPU)

| Duración audio | Tiempo transcripción |
|---|---|
| Reel 30s | ~15-30s |
| Vídeo 1 min | ~30-60s |
| Vídeo 5 min | ~3-5 min |
| Vídeo 30 min | ~15-25 min |

Con GPU o Apple Silicon: **dividir por 2-4x**.

---

## Idiomas soportados

faster-whisper detecta automáticamente · pero puedes forzar:

```bash
--lang es   # español
--lang pt   # portugués
--lang en   # inglés
```

Calidad excelente en ES · PT · EN. Buena en FR · IT · DE · NL.

---

## Privacidad

✅ **100% local** · no se envían datos a la nube
✅ **Sin API keys** · sin tracking
✅ **Sin coste** · open source

vs Whisper API OpenAI ($0.006/min · cloud).

---

## Problemas comunes

### "Out of memory"
- Cambia a modelo más pequeño: `--model small`
- Cambia compute: `--compute int8`

### "Whisper muy lento"
- Verifica modelo (usar `medium` no `large`)
- Mac M1+: instala whisper.cpp
- GPU: instala faster-whisper[gpu]

### "Idioma incorrecto detectado"
- Fuerza con `--lang es` o `--lang pt`

### "yt-dlp falla con IG"
- IG cambia anti-scraping a veces
- Actualiza: `pip install yt-dlp --upgrade`
- Para Reels privados · no funciona (requiere login)

---

## Recursos

- **faster-whisper:** https://github.com/SYSTRAN/faster-whisper
- **yt-dlp:** https://github.com/yt-dlp/yt-dlp
- **youtube-transcript-api:** https://github.com/jdepoix/youtube-transcript-api
- **whisper.cpp:** https://github.com/ggerganov/whisper.cpp
