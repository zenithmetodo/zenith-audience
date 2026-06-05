# Pipeline · Análisis de Creator Viral (10 pasos validados)

> Pipeline VALIDADO en producción para análisis completo de un perfil de Instagram: scraping → filtrado por viralidad → descarga → extracción de frames visuales → transcripción → idea ganadora → guion adaptado al núcleo del usuario.

---

## Premisa

> "El 80% del éxito de adaptar virales ajenos es ENTENDER el formato visual + la idea ganadora · NO copiar literal."

Este pipeline extrae **ambos**:
- La **idea ganadora** (mensaje central · estructura · fórmula reutilizable)
- El **formato visual** (5 frames extraídos para identificar talking head · split-screen · whiteboard · tier list · etc.)

---

## Stack obligatoria

### MCPs
1. **Apify MCP** (HTTP · OAuth) con actores configurados:
   - `apify/instagram-scraper` (general)
   - `apify/instagram-post-scraper` (reels con views/likes)
   - `curious_coder/facebook-ads-library-scraper` (spy Meta Ads · opcional)

### CLIs locales (gratis)
2. **yt-dlp** · descarga .mp4 del reel
3. **OpenAI Whisper** (o faster-whisper) · transcripción audio→texto
4. **ffmpeg + ffprobe** · extracción de frames del vídeo
5. **Python 3** · scripts auxiliares

### Cookies del navegador
- yt-dlp usa `--cookies-from-browser chrome` para acceder a reels privados/restringidos.
- Si no funciona Chrome: probar `firefox` · `brave` · `edge`.

---

## LOS 10 PASOS DEL PIPELINE

### PASO 1 · INPUT del usuario

El usuario invoca:
```
/audience-analizar-creator @nathan_perdriau [--top 5]
```

Tu input:
- `@username` de Instagram (obligatorio)
- `--top N` reels objetivo (opcional · default 5)
- `--nicho [opcional]` · filtra por palabra clave en caption

---

### PASO 2 · SCRAPEAR EL PERFIL con Apify

Usa el actor `apify/instagram-post-scraper` con input:
```json
{
  "username": ["nathan_perdriau"],
  "resultsLimit": 50,
  "addParentData": false
}
```

Devuelve hasta 50 posts con:
- `url` · URL completa del post
- `id` · ID del reel (extraíble de la URL: `instagram.com/p/<ID>/`)
- `likesCount` · likes totales
- `commentsCount` · comentarios
- `videoViewCount` · views (solo en reels/videos)
- `caption` · texto del post
- `type` · "Video" para reels · "Image" para fotos

**FILTRA** solo `type == "Video"` (los reels).

---

### PASO 3 · FILTRAR por VIRALIDAD

Ordena por engagement absoluto o relativo:

**Opción A · engagement absoluto:**
```python
viralidad = likes + comments
# Ordena descendente · top N
```

**Opción B · engagement relativo (si conoces followers):**
```python
viralidad = (likes + comments) / followers
```

**Opción C · views/seguidores (mejor señal viral real):**
```python
viralidad = views / followers
```

Selecciona **TOP 5-10**. Guarda lista con sus IDs extraídos del URL.

---

### PASO 4 · CREAR estructura de carpetas

Por cada reel TOP:
```
/Users/[usuario]/TRANSCRIPCION REELS/🆕<N>_<ID_REEL>/
```

Donde:
- `N` · numeración secuencial (16, 17, 18, ...) · incremental desde el último análisis
- `🆕` · prefijo para reels NUEVOS analizados en esta sesión
- `<ID_REEL>` · ID del URL de Instagram

Ejemplo real:
```
/Users/josep/TRANSCRIPCION REELS/🆕16_CzXqW8Lpdh/
/Users/josep/TRANSCRIPCION REELS/🆕17_CzABCdefGh/
/Users/josep/TRANSCRIPCION REELS/🆕18_CzMnoPqRst/
```

---

### PASO 5 · DESCARGAR el .mp4 con yt-dlp

Comando para 1 reel:
```bash
yt-dlp --cookies-from-browser chrome \
  -o "🆕<N>_<ID>/video.%(ext)s" \
  "https://www.instagram.com/p/<ID>/"
```

Para **N reels en paralelo**:
```bash
yt-dlp --cookies-from-browser chrome -o "🆕16_<ID1>/video.%(ext)s" "https://..." &
yt-dlp --cookies-from-browser chrome -o "🆕17_<ID2>/video.%(ext)s" "https://..." &
yt-dlp --cookies-from-browser chrome -o "🆕18_<ID3>/video.%(ext)s" "https://..." &
wait
```

**Notas:**
- Si Chrome no funciona · probar `firefox` · `brave` · `edge`.
- Si IG bloquea: usar `--user-agent "Mozilla/5.0 ..."` o esperar 10-15 min entre lotes.

---

### PASO 6 · EXTRAER 5 FRAMES con ffmpeg ⭐

Este es el paso CRÍTICO para entender el **formato visual** del reel.

Para cada vídeo descargado:
```bash
DUR=$(ffprobe -v error -show_entries format=duration \
     -of default=noprint_wrappers=1:nokey=1 "<carpeta>/video.mp4")

for pct in 5 25 50 75 95; do
  TIME=$(python3 -c "print($DUR * $pct / 100)")
  ffmpeg -y -ss "$TIME" -i "<carpeta>/video.mp4" \
    -frames:v 1 -q:v 2 "<carpeta>/frame_${pct}.jpg" 2>/dev/null
done
```

Resultado · 5 frames en cada carpeta:
- `frame_5.jpg` · primer 5% (hook visual)
- `frame_25.jpg` · primer cuarto
- `frame_50.jpg` · mitad
- `frame_75.jpg` · tres cuartos
- `frame_95.jpg` · cierre · CTA visual

### Por qué los 5 frames son críticos

Lee los 5 frames con el tool **Read** (Claude Code permite leer imágenes) para identificar:
- **Tipo de formato** (HAC · split-screen · tier list · whiteboard · 2 personas · pizarra · etc.)
- **Movimiento de cámara** (estático · gimbal · cortes)
- **Texto overlay** (qué texto aparece · cuándo)
- **Iluminación · backdrop · vestuario**
- **B-roll usado**
- **Estética de marca**

Esto es lo que `formato-master` necesita para **adaptar el formato** a tu nicho.

---

### PASO 7 · TRANSCRIBIR el audio con Whisper

Comando para 1 reel:
```bash
whisper "<carpeta>/video.mp4" \
  --model small \
  --language en \
  --output_format txt \
  --output_dir "<carpeta>"
```

(Alternativa más rápida: `faster-whisper` con modelo `medium` · ver `scripts/whisper-transcribe.py`)

Para **N reels en paralelo**:
```bash
whisper "<carpeta1>/video.mp4" --model small --language en --output_format txt --output_dir "<carpeta1>" &
whisper "<carpeta2>/video.mp4" --model small --language en --output_format txt --output_dir "<carpeta2>" &
whisper "<carpeta3>/video.mp4" --model small --language en --output_format txt --output_dir "<carpeta3>" &
wait
```

Whisper guarda `video.txt` en cada carpeta con la transcripción.

### Notas sobre modelos Whisper

| Modelo | Tamaño | Velocidad | Calidad | Recomendado para |
|---|---|---|---|---|
| `tiny` | 39MB | rápido | OK | Tests rápidos |
| `base` | 74MB | rápido | OK+ | Inglés simple |
| `small` | 244MB | medio | Buena | **Recomendado pipeline** |
| `medium` | 769MB | lento | Excelente | ES/PT/multilingüe |
| `large` | 1550MB | muy lento | Mejor | Calidad máxima |

Si el reel es en castellano · usar `--language es` y modelo `medium` (faster-whisper).

---

### PASO 8 · CREAR `TRANSCRIPCION.md` por reel

Plantilla obligatoria en cada carpeta `🆕<N>_<ID>/TRANSCRIPCION.md`:

```markdown
# REEL 🆕<N> · <título descriptivo del tema>

**🔗 Link:** https://www.instagram.com/p/<ID>/
**Idioma original:** Inglés (o el detectado)
**Duración:** ~Xs
**Creator:** @<username>
**Formato visual detectado:** <basado en frames analizados>

---

## 🎬 Frames del reel

| Frame | Descripción |
|---|---|
| 5% | <descripción primer frame> |
| 25% | <descripción> |
| 50% | <descripción> |
| 75% | <descripción> |
| 95% | <descripción> |

---

## 📝 Transcripción original (Inglés)

<texto íntegro de Whisper>

---

## 🇪🇸 Traducción al castellano de España (versión natural)

<traducción NATURAL · no literal · castellano de España · SIN expresiones forzadas tipo "tío/joder" si no son orgánicas>

---

## 💡 IDEA GANADORA del reel

**🎯 Mensaje central:**
<frase única que captura el punto del reel>

**🛠️ Estructura del reel (beats temporales):**
- [0-3s] Hook: <descripción>
- [3-15s] Setup: <descripción>
- [15-30s] Desarrollo: <descripción>
- [30-50s] Revelación: <descripción>
- [50-60s] CTA: <descripción>

**📦 Plantilla reutilizable (fórmula abstracta):**
"[ESTRUCTURA] + [GATILHO] + [INSIGHT] = fórmula"

**¿Por qué funciona?**
- <Razón 1: psicológica>
- <Razón 2: estructural>
- <Razón 3: emocional>

**Templates Zenith aplicables:**
- Template X · [nombre] (de las 12 estructuras virales)
- Formato Y · [nombre] (de los 70+ formatos visuales)
- Gatilhos dominantes: [2-3 de los 7]
```

---

### PASO 9 · CREAR `GUION_ADAPTADO.md` (núcleo del usuario)

Tras analizar el reel original · adaptar a tu núcleo:

```markdown
# GUION ADAPTADO · <título adaptado al avatar>

**Inspirado en:** Reel 🆕<N> de @<creator>
**Tu núcleo aplicado:** <enemigo · promesa · bordones del usuario>
**Avatar destino:** <tu avatar específico>

---

## ⭐ Los 4 Ganchos Óptimos (cada uno con VERBAL + TEXTUAL)

### 🔴 Gancho A · Dolor
- **VERBAL (audio):** "<frase>"
- **TEXTUAL (overlay):** "<TEXTO MAYÚSCULAS>"
- **Visual primer frame:** <descripción>

### 🟢 Gancho B · Deseo
[idem]

### 🟡 Gancho C · Misterio
[idem]

### 🟣 Gancho D · Disrupción
[idem]

---

## 🎬 Cuerpo del reel (formato: <formato elegido>)

[SEGUNDO 3-X]
[VISUAL]: <descripción>
[AUDIO]: "<palabra a palabra>"
[TEXTO OVERLAY]: <...>

[continúa hasta cierre]

---

## 🎯 CTA final

[SEGUNDO X-Y]:
[VISUAL]: <...>
[AUDIO]: "<CTA palabra a palabra>"
[TEXTO OVERLAY]: <...>

---

## 📋 Notas de producción

- B-roll: <...>
- Música: <...>
- Iluminación: <...>
- Vestuario: <...>
- Tiempo grabación: ~15-20 min (cuerpo + 4 ganchos)

---

## 🧠 Análisis · Por qué funcionará

- **Lógica psicológica:** <2-3 párrafos>
- **Métricas esperadas:** skip <X% · watch >Y% · saves >Z% · shares >W%
- **En qué se basa:** [knowledge files · clases · estudios]
```

---

### PASO 10 · NIVEL DE CONSCIENCIA + MAQUETAR el reel terminado ⭐

**10a · Diagnóstico de NIVEL DE CONSCIENCIA (`consciencia-master`).** Antes de maquetar, el agente `consciencia-master` mira la idea + el avatar y dice a qué nivel apunta el reel y QUÉ conecta ahí:
- **BAJO (1-2):** síntomas · creencias erróneas · dolor. (Despertar/identificar.)
- **MEDIO (3-4):** mecanismo · comparación **con vs sin** · demostración.
- **ALTO (5):** romper objeciones (precio/tiempo/miedo) · prueba social · mecanismo.

⚠️ **Los niveles SE MEZCLAN** (lo normal): el reel suele **abrir en BAJO** (no perder a nadie) y **cerrar en MEDIO/ALTO** antes del CTA. El badge puede declarar la mezcla (`BAJO → MEDIO`). El **CTA lo dirige Joseph** (no depende del nivel). Detalle en `knowledge/formatos-reels/08-niveles-consciencia.md` + `agents/32-consciencia-master.md`.

**10b · MAQUETAR con `reel-html-builder`.** Con el `GUION_ADAPTADO.md` (formato + nivel + ganchos + cuerpo), **delega en `reel-html-builder`** para dejarlo **listo para grabar**. Este agente NO elige el formato (lo hizo `formato-master`) ni el nivel (lo hizo `consciencia-master`) — solo lo PRESENTA bonito con el **badge de nivel** arriba.

```
/audience-reel-html "tema + formato elegido (del GUION_ADAPTADO.md)"
```

Entrega 2 archivos en la misma carpeta del reel:
- `🎯 [NOMBRE]-FORMATO.html` · documento-guion oscuro Zenith (cabecera + srcbox + EL DIBUJO del formato en HTML/SVG + 6 ganchos + ⭐ CUERPO palabra por palabra + overlays + CTA + `@media print`).
- `GUION.md` · versión legible en texto plano para leer cómodo sin abrir el HTML.
- (opcional) `🎮 [NOMBRE]-INTERACTIVO.html` · si el formato es clasificatorio (tier list · titular/suplente · ordenar), drag-and-drop con la mascota Zenón de cursor.

**Reglas que respeta:** ganchos = HOOKS (nunca CTA) · "comenta LIGA" solo en CTA + último beat · call-out al entrenador a nivel headline · voz Zenith · "DI →" embebido en el dibujo si es lista/escalera/ranking/tier. Detalle completo en `agents/31-reel-html-builder.md` + `knowledge/formatos-reels/10-formatos-zenith-html.md`.

---

## OUTPUT FINAL del pipeline

Estructura completa tras ejecutar:

```
/Users/[usuario]/TRANSCRIPCION REELS/
├── 🆕16_CzXqW8Lpdh/
│   ├── video.mp4
│   ├── video.txt                  (Whisper)
│   ├── frame_5.jpg
│   ├── frame_25.jpg
│   ├── frame_50.jpg
│   ├── frame_75.jpg
│   ├── frame_95.jpg
│   ├── TRANSCRIPCION.md          ⭐ análisis del original
│   ├── GUION_ADAPTADO.md         ⭐ tu versión adaptada (paso 9)
│   ├── 🎯 <NOMBRE>-FORMATO.html  ⭐ doc-guion listo para grabar (paso 10 · opcional)
│   └── GUION.md                   ⭐ versión legible (paso 10 · opcional)
├── 🆕17_<ID>/
│   └── [misma estructura]
└── 🆕18_<ID>/
    └── [misma estructura]
```

---

## Variantes y mejoras

### Variante A · Sin Apify (modo degradado)
Si el usuario NO tiene Apify configurado:
- Pasos 2-3 (scraping + filtrado): el usuario te pasa **URLs específicas** de reels
- Pasos 4-9: igual

### Variante B · Solo análisis (sin descarga)
Si solo queremos análisis rápido:
- Saltar paso 6 (frames) y 7 (transcripción)
- Usar caption + comentarios + datos del post
- Más rápido · menos profundo

### Variante C · Spy Meta Ads
Para análisis de anuncios pagados (no orgánico):
- Usar `curious_coder/facebook-ads-library-scraper`
- Input: nombre del anunciante o palabra clave
- Devuelve anuncios activos · creatividades · copy

---

## Costes estimados

### Por análisis completo de 5 reels
- Apify scraping perfil: ~$0.10
- yt-dlp descarga: $0 (local)
- ffmpeg frames: $0 (local)
- Whisper transcripción: $0 (local)
- Análisis Claude (interpretación): incluido en plan

**Total · solo Apify: ~$0.10** (dentro del Free $5/mes)

---

## Tiempo estimado

- Scraping perfil: 30-60s
- Descarga 5 reels en paralelo: 1-2 min
- Frames + transcripción en paralelo: 2-5 min
- Análisis e interpretación: 3-5 min
- **Total: 7-13 minutos** para 5 reels analizados completamente

---

## Filosofía del pipeline

> **NO copies. ADAPTA.**
>
> La idea ganadora se valida con datos del original.
> La adaptación al núcleo es lo que la hace **incopiable** y **tuya**.

Este pipeline:
1. Extrae lo que funcionó (con datos · sin opinión)
2. Identifica el formato visual (con frames · sin asumir)
3. Te ayuda a ADAPTARLO a tu núcleo (con `formato-master` + tu núcleo)

NO sustituye tu creatividad. La acelera con datos validados.

---

## Atribución
Pipeline validado en producción. Implementado por Joseph Moreno · Zenith. Adaptado al ecosistema Zenith Audience™.
