---
name: zenith-audience
description: Zenith Audience™ · Mega-skill TOP 1% para crear CONTENIDO VIRAL diario aplicando el Método Audience de Elias Mamã (Marconi Rômulo) adaptado por Joseph Moreno. Orquesta 30 sub-agentes especializados (Opus/Sonnet optimizado) que cubren los 3 pilares (gatillos de atención · contenido notable · verdadero yo), los 7 gatillos psicológicos, las 12 estructuras virales, los 8 elementos del contenido notable, las 10 preguntas del núcleo de influencia, los 60+ formatos visuales de reels, y el pipeline VALIDADO de análisis de creator viral (scrape Apify → descarga yt-dlp → 5 frames ffmpeg → transcripción Whisper → idea ganadora multimodal → guion adaptado al núcleo). Para cada reel entrega 4 ganchos óptimos (verbal + textual). Mide métricas con Metricool MCP (Free) y aplica sistema de decisión REPLICAR/ITERAR/GUARDAR/APRENDER/DESCARTAR. Entrega guiones en HTML estético imprimible a PDF con branding Zenith (cian #00E5CF + purple #B845FF). Triggers: "dame ideas de reels", "analiza este perfil de instagram", "sácame los virales de @X", "crea un reel sobre", "adapta este viral", "guion de reel", "carrusel", "hilo", "mis métricas de reels", "qué reel replicar", "spy competidor", "trends de mi nicho", "plan de contenido semanal", "núcleo de influencia", "zenith audience", "método audience", "análisis creator viral".
---

# ZENITH AUDIENCE™ · Orquestador Maestro de Contenido Viral

> "Es imposible que una persona que sabe llamar atención, sabe entregar contenido notable y lo hace de forma genuina y verdadera no tenga voz en internet." — Elias Mamã

## QUÉ ES ESTA SKILL

Es la skill PADRE de un sistema de **30 sub-agentes especializados** (cada uno crack de UNA sola cosa) y **20 slash commands** para crear contenido viral diario.

Implementa el **Método Audience completo** de Elias Mamã (Marconi Rômulo) · adaptado y operacionalizado por **Joseph Moreno · Zenith** para uso diario en Claude Code.

---

## ⚠️ VERIFICACIÓN OBLIGATORIA AL PRIMER USO

**ANTES de ejecutar cualquier pipeline que requiera herramientas externas** (análisis viral · trends · métricas · scraping), DEBO verificar que el entorno está listo.

### Regla de auto-verificación

Si es la primera vez que el usuario usa la skill en esta sesión · o si un comando va a usar ffmpeg/yt-dlp/Apify/Metricool · PRIMERO ejecuto:

```bash
bash scripts/setup-check.sh
```

Y según el resultado:
1. **Instalo automáticamente** lo que falte que pueda instalar (deps Python · ffmpeg · yt-dlp)
2. **Guío al usuario** para configurar MCPs (Apify · Metricool) con comandos copy-paste
3. **Confirmo** qué funcionalidades quedan activas

### Cuándo NO necesito verificar

Para tareas que SOLO usan a Claude (sin herramientas externas) · puedo proceder directo:
- Crear reels · carruseles · hilos · headlines
- Núcleo de influencia · templates · gatillos · formatos

### El comando del usuario

El usuario puede ejecutar `/audience-doctor` en cualquier momento para diagnóstico + auto-instalación completa.

---

## ⚠️ REGLA GLOBAL INNEGOCIABLE · FICHA TÉCNICA DEBAJO DE CADA HEADLINE

**Aplica a TODOS los agentes que generen headlines · ganchos · hooks · copy o cualquier texto verbal/textual** (headline-3-tipos · formato-master · reel-architect · carrusel-architect · hilo-architect · gatillo-master · plan-headlines-mes · ideas-ganadoras-adapter).

Un headline NO es una frase suelta · es la **combinación** de asuntos virales + gatillos + estructura + identificación del avatar (Clase 10 · 11 · 14 · 17). Por eso · SIEMPRE · debajo de CADA headline/gancho generado · va su ficha técnica:

```
─────────────────────────────────────
📊 FICHA TÉCNICA
• Asuntos virales: [universal: X] · [nicho: Y] · [momento: Z]  ← mínimo 1 · ideal 3-4
• Estructura viral: Template N · [nombre]
• Gatillos: [gatillo 1] + [gatillo 2] (+ [gatillo 3])
• Identificación avatar: ✅/❌ · "[palabra que apunta al avatar]" · alcance: [ES/CONOCE/QUIERE SER]
• Combinación: [cómo se entrelazan · 1 frase]
─────────────────────────────────────
```

**Validaciones obligatorias antes de entregar cualquier headline:**
- Si usa **<1 asunto viral** → AVISO "falta asunto viral (obligatorio · Clase 10)"
- Si **NO identifica al avatar** → AVISO + sugerencia de qué palabra meter (gatilho do reconhecimento · Clase 17)
- Si usa **<2 gatillos** → sugerir stacking

Detalle completo y formato → `knowledge/headlines/02-ficha-tecnica-obligatoria.md`.

---

## ⚠️ REGLA GLOBAL INNEGOCIABLE · FORMATOS (formato-master) + MAQUETADO (reel-html-builder)

1. **MUCHOS formatos, no 3.** Menú amplio (8-15+) de los 70+ del banco **+ el banco ZENITH de ~24 formatos disruptivos** (`knowledge/formatos-reels/10-formatos-zenith-html.md`: alineación de fútbol titular/suplente, escalera 5 niveles, ticket/factura, etiqueta nutricional, monitor de hospital, mapa de metro, organigrama, cerebro Claude.md, ecuaciones, debate, cinematográfico, demo dual-cam, verdad/mentira, no-hagas/haz-esto, antes/después, versus split, ranking irónico, frecuencias, tier list con lógica, roast, herramienta interactiva drag-and-drop con mascota Zenón-cursor) + **PENSAR SIEMPRE FUERA DE LA CAJA** (combinar/inventar ≥1-2 formatos nuevos por reel con objetos cotidianos como metáfora). Incluye familia **save-bait jerárquica** (#70-76).
2. **Niveles de consciencia OBLIGATORIO** (Schwartz · BAJO 1-2 / MEDIO 3 / ALTO 4-5). Cada formato adaptado por nivel (hook/overlay/cuerpo/CTA). Ver `08-niveles-consciencia.md`.
3. **Apify OBLIGATORIO y detallado** (engenharia reversa de ganadores del nicho). Indicar de qué ganador se inspira cada formato + su twist. Ver `09-formatos-jerarquicos-savebait.md`.
4. **SEPARACIÓN DE ROLES:** `formato-master` decide QUÉ formato + ideas de ganchos. **`reel-html-builder`** MAQUETA el reel terminado → el `.html` doc-guion (con EL DIBUJO del formato + 6 ganchos-hook + ⭐ CUERPO palabra por palabra + overlays + CTA) **+ un `GUION.md` legible** + la herramienta interactiva si es clasificatorio. Ganchos = HOOKS (nunca CTA), call-out al entrenador repartido audio/textual, "comenta LIGA" solo en CTA/último beat. Ver `10-formatos-zenith-html.md` y el agente `31-reel-html-builder.md`.

## ⚠️ REGLA GLOBAL INNEGOCIABLE · HTML SIEMPRE EDITABLE + PDF

TODO HTML que genere la skill (reels, carruseles, hilos, planes, métricas, auditorías, adaptaciones, engenharia) DEBE ser **autocontenido (1 solo archivo .html · sin CDNs ni dependencias externas)** y:

1. **Editable al clic:** todo el contenido en `<div id="contenido" contenteditable="true" spellcheck="false">` · la barra de botones va FUERA de ese contenedor.
2. **Autoguardado:** `localStorage` con debounce (clave única por archivo) + restaura al cargar + guarda `ORIGINAL` para "Restablecer".
3. **Barra (no imprimible):** `📄 Guardar PDF` (`window.print()`) · `⬇️ Descargar copia` (Blob `.html` con cambios incrustados) · `↺ Restablecer`.
4. **PDF idéntico al HTML:** `*{ -webkit-print-color-adjust:exact; print-color-adjust:exact; }` · `@page{ size:A4; margin:12mm; }` · `@media print{ #barra{display:none} · break-inside:avoid en tarjetas/bloques }`.
5. Colores de fondo desde **CSS** (no imágenes) para que el PDF los respete.

Plantillas ya listas en `templates/*.html` (todas con `#barra` + `#contenido` + script de autoguardado). Al generar un entregable, parte de la plantilla correspondiente y rellena los `{{PLACEHOLDERS}}`.

---

### Niveles de funcionalidad

| Nivel | Requiere | Desbloquea |
|---|---|---|
| 0 | Solo Claude | Crear todo el contenido (reels · carruseles · hilos · headlines · núcleo) |
| 1 | + deps Python (gratis) | Trends Google · Reddit · YouTube |
| 2 | + ffmpeg + yt-dlp (gratis) | Pipeline análisis viral (9 pasos) |
| 3 | + MCPs (Metricool Free + Apify Free $5) | Métricas + scraping · TODO al 100% |

---

## CUÁNDO INVOCARME

Cuando el usuario diga cualquiera de estas frases (o equivalente):

- "dame ideas de reels/contenido para hoy"
- "analiza este perfil de instagram @X" · "sácame los virales de @X"
- "crea un reel/carrusel/hilo sobre X"
- "adapta este viral [URL]"
- "qué métricas tienen mis reels" · "qué reel debo replicar"
- "spy de mi competidor @X"
- "trends de mi nicho"
- "plan de contenido semanal/mensual"
- "ayúdame con mi núcleo de influencia"
- "método audience" · "zenith audience"

---

## LA FÓRMULA COMPLETA

```
GATILLOS DE ATENCIÓN (7)
        +
CONTENIDO NOTABLE (8 elementos)
        +
NÚCLEO DE INFLUENCIA (10 preguntas · Verdadero Yo)
        +
FORMATO VISUAL (60+ formatos)
        +
4 GANCHOS ÓPTIMOS por reel (verbal + textual)
        +
CONSISTENCIA (sistema diario Zenith)
        =
AUDIENCIA ORGÁNICA QUE TE RESPETA · CONFÍA · COMPRA
```

---

## ARQUITECTURA · 30 AGENTES EN 10 BLOQUES

### 🔍 BLOQUE A · Investigación (6 agentes)
- `spy-competidor` (Opus) · analiza 30 posts de un competidor · gaps
- `trend-google` (Sonnet) · Google Trends vía pytrends
- `trend-redes` (Opus) · TikTok/IG trending vía Apify
- `trend-foros` (Sonnet) · Reddit + YouTube
- `engenharia-reversa` (Opus) ⭐ · pipeline 9 pasos de análisis viral
- `ideas-ganadoras-adapter` (Opus) ⭐ · multi-fuente · adapta virales a tu núcleo

### 🧬 BLOQUE B · Núcleo de Influencia (5 agentes · setup one-shot)
- `nucleo-architect` · orquesta las 10 preguntas
- `enemigo-namer` · pregunta 6 (enemigo común)
- `dor-promesa-builder` · preguntas 4-5 (dolor + promesa)
- `crencas-pruebas` · preguntas 7-8 (creencias + pruebas)
- `bordones-creator` · preguntas 9-10 (lenguaje propio + verdadero yo)

### 💡 BLOQUE C · Asuntos Virales (3 agentes)
- `asunto-detector` · valida idea contra 5 criterios + 6 categorías
- `asuntos-generator` ⭐ · 15-20 ideas/día multi-fuente
- `pesquisa-magnetica` · investigación profunda mensual

### 🎣 BLOQUE D · Gatillos y Headlines (3 agentes)
- `gatillo-master` · aplica los 7 gatillos en stacking
- `headline-3-tipos` · 3 headlines (carruseles/hilos)
- `plan-headlines-mes` · batch mensual 30-50 headlines

### 📐 BLOQUE E · 12 Estructuras Virales (3 agentes)
- `template-selector` · recomienda cuál de las 12
- `template-aplicador` · aplica fórmula literal
- `template-rotation-planner` · calendario rotación

### 🎬 BLOQUE F · Creación + Formato (5 agentes)
- `formato-master` ⭐ · 70+ formatos + banco ZENITH (~24) + PIENSA FUERA DE LA CAJA → decide FORMATO + ideas de ganchos
- `reel-html-builder` ⭐ NUEVO · MAQUETA el reel terminado → `.html` doc-guion + `GUION.md` legible (+ interactivo con Zenón si es clasificatorio)
- `reel-architect` ⭐ · guion completo orquestado
- `carrusel-architect` · 8-10 slides
- `hilo-architect` · threads X/IG/LinkedIn

### 🎨 BLOQUE G · Notable (2 agentes)
- `notable-auditor` · audita 8 elementos + STEPPS
- `notable-builder` · mejora contenido escaso

### 📊 BLOQUE H · Métricas + Iteración (2 agentes)
- `metrics-analyst` ⭐ · Metricool MCP + sistema decisión 5 acciones
- `iteracion-ganador` · 10 variantes de un viral

### 🗓️ BLOQUE I · Planificación (2 agentes)
- `plan-semana` · calendario 7 días
- `batch-content-day` · plan grabación batch

---

## LOS 20 SLASH COMMANDS

| Command | Función |
|---|---|
| `/audience-setup` | Setup núcleo influencia (one-shot · 2-3h) |
| `/audience-ideas` | 15-20 ideas multi-fuente para hoy |
| `/audience-pesquisa` | Investigación profunda mensual de asuntos |
| `/audience-trend` | Trends multi-fuente (Google + Reddit + YT + Apify) |
| `/audience-spy [@handle]` | Análisis de competidor |
| `/audience-analizar-creator [@handle]` ⭐ | Pipeline 9 pasos · scrape + frames + transcripción |
| `/audience-adaptar [url]` ⭐ | Adapta viral a tu núcleo |
| `/audience-formato [tema]` ⭐ | Recomienda formato (70+ + banco ZENITH ~24) · piensa FUERA DE LA CAJA |
| `/audience-reel-html [tema]` ⭐ NUEVO | Maqueta el reel terminado: HTML doc-guion + GUION.md legible (+ interactivo si es clasificatorio) |
| `/audience-headline [tema]` | 3 headlines |
| `/audience-headline-batch` | Batch mensual 30-50 headlines |
| `/audience-reel [tema]` ⭐ | Guion completo + 4 ganchos |
| `/audience-carrusel [tema]` | Carrusel 8-10 slides |
| `/audience-hilo [tema]` | Thread X/IG/LinkedIn |
| `/audience-audit [guion]` | Audita 8 elementos + 5 criterios |
| `/audience-iterar [post]` | 10 variantes de viral |
| `/audience-metrics` | Métricas + decisión REPLICAR/ITERAR/etc. |
| `/audience-engenharia [url]` | Engenharia reversa 1 vídeo |
| `/audience-plan-semana` | Calendario semanal |
| `/audience-batch-day` | Plan grabación batch |

---

## ⭐ EL PIPELINE DE APRENDIZAJE · Análisis de Creator Viral (9 pasos)

> Lo más potente de la skill. Validado en producción.

```
1. INPUT · @username o URLs de reels
2. SCRAPE · apify/instagram-post-scraper (50 posts)
3. FILTRAR · top 5-10 por viralidad (engagement/views)
4. CARPETAS · 🆕<N>_<ID>/ por reel
5. DESCARGAR · yt-dlp --cookies-from-browser chrome (paralelo)
6. FRAMES · ffmpeg · 5 frames (5%/25%/50%/75%/95%) ⭐
7. TRANSCRIBIR · Whisper paralelo → video.txt
8. ANÁLISIS MULTIMODAL · leo 5 frames + transcripción + datos
   → identifico formato visual + idea ganadora
   → genero TRANSCRIPCION.md
9. ADAPTAR · cruzo idea ganadora × tu núcleo
   → genero GUION_ADAPTADO.md con 4 ganchos
```

**Comando:** `/audience-analizar-creator @nathan_perdriau --top 5`

**Detalle completo:** `knowledge/pipelines/00-analisis-creator-viral.md`

---

## LA SECUENCIA DE USO (pipeline diario · semanal · mensual)

### 🚀 PRIMERA VEZ (one-shot · 2-3h)
```
/audience-setup
```
Define tu núcleo de influencia (10 preguntas) · guía toda la skill.

### 🌅 DIARIO (10-15 min)
```
1. /audience-ideas              → 15-20 ideas multi-fuente
2. /audience-formato [idea]     → formato FUERA DE LA CAJA (70+ + banco ZENITH) + 6 ganchos-hook
3. /audience-reel-html [idea]   → HTML doc-guion + GUION.md legible (+ interactivo si clasificatorio)
4. /audience-audit [guion]      → filtro de calidad
5. Grabas leyendo del DIBUJO (cuerpo 1× + 6 ganchos)
```
> Alternativa rápida: `/audience-reel [idea]` orquesta guion + 4 ganchos en un solo paso.

### 📅 SEMANAL
```
Lunes      → /audience-trend (multi-fuente)
Mar-Jue    → /audience-reel × 3
Viernes    → /audience-metrics (decisión REPLICAR/ITERAR/etc.)
Sábado     → /audience-spy @competidor · o /audience-analizar-creator
Domingo    → /audience-plan-semana
```

### 📆 MENSUAL
```
Día 1   → /audience-pesquisa + /audience-headline-batch
Día 15  → /audience-batch-day (grabación batch)
Día 30  → /audience-engenharia × 3 (top virales del mes)
```

### ⭐ CUANDO VES UN VIRAL
```
/audience-adaptar [URL]              → 3 variantes adaptadas a ti
/audience-analizar-creator @creator  → pipeline completo del perfil
```

---

## EL SISTEMA DE APRENDIZAJE · Métricas → Decisión → Acción

> "Lo que NO se mide · NO se mejora." — Peter Drucker

### Las 3 métricas del método (Clases 8-9)
1. **PULADOS** (Skip Rate) · <50% bueno · <40% viral · <30% bomba
2. **RETENCIÓN** (Watch Time) · >30% bueno · >50% excelente · >70% viral
3. **INTERACCIONES** (Engagement) · >10% objetivo · >15% bueno · >20% bomba

### Sistema de decisión (5 acciones · `metrics-analyst`)
- 🚀 **REPLICAR MASIVO** (>3x media) → `/audience-iterar`
- 🌟 **ITERAR INMEDIATO** (2-3x) → rehacer parte débil
- 🟢 **GUARDAR + ANALIZAR** (1.5-2x) → revisar en 2 semanas
- 🟡 **APRENDER + DESCARTAR** (cerca media) → extraer lección
- 🔴 **DESCARTAR + NO REPETIR** (<media) → no repetir patrón

**Comando:** `/audience-metrics` (vía Metricool MCP Free · o modo manual)

---

## KNOWLEDGE LIBRARY · 45 archivos

```
knowledge/
├── core/                  (5) · pilares · algoritmos · misión · niveles atención
├── gatillos/              (8) · 7 gatillos + overview
├── asuntos-virales/       (3) · 6 categorías + 3 tipos + 5 criterios
├── headlines/             (2) · 3 tipos + plan creación
├── templates/             (12) · las 12 estructuras virales (1 por archivo)
├── formatos-reels/        (8) · 60+ formatos + 7 con guion-tipo
├── notable/               (2) · 8 elementos + Berger STEPPS
├── nucleo-influencia/     (2) · 10 preguntas + verdadero yo
├── metricas/              (2) · 3 métricas + decisión
└── pipelines/             (1) · análisis creator viral 9 pasos ⭐
```

---

## STACK TÉCNICO (100% gratis · excepto plan Claude)

### MCPs
- **Metricool MCP** (Free) · métricas IG/TT/YT/FB/Pinterest/Threads/Bluesky
- **Apify MCP** (Free $5/mes) · scraping competidores + trends

### CLIs locales (gratis)
- **yt-dlp** · descarga reels
- **ffmpeg + ffprobe** · extracción 5 frames
- **faster-whisper** · transcripción ES/PT/EN
- **pytrends · PRAW · YouTube API** · trends

### Actores Apify validados
- `apify/instagram-post-scraper` ⭐ (análisis viral)
- `apify/instagram-scraper` (general)
- `curious_coder/facebook-ads-library-scraper` (Meta Ads spy)
- `apidojo/tiktok-scraper-api`
- `apify/instagram-hashtag-scraper`
- `epctex/youtube-channel-scraper`

---

## CÓMO ORQUESTO (lógica del padre)

Cuando recibo una petición:

1. **Identifico la intención** (ideas · análisis · creación · métricas · etc.)
2. **Verifico el núcleo de influencia** (si no existe · sugiero `/audience-setup` primero)
3. **Lanzo el agente/pipeline adecuado** (ver tabla de commands)
4. **Aplico el knowledge relevante** (templates · gatillos · formatos · etc.)
5. **Entrego output ejecutable** (guion + 4 ganchos · o HTML estético)
6. **Sugiero el siguiente paso** (audit · iterar · grabar)

### Reglas de oro
- **NUNCA copies · siempre ADAPTA** al núcleo del usuario
- **Cada reel = 4 ganchos óptimos** (verbal + textual)
- **Mínimo 2-3 gatillos** por contenido (stacking)
- **Mínimo 2-3 elementos notable** por vídeo
- **El formato visual importa** tanto como el mensaje

---

## COSTE

**Incluido en tu plan Claude (Pro $20 · Max $100 · Max $200).**

Servicios externos:
- Metricool Free: $0
- Apify Free $5/mes: $0 (dentro del free tier)
- yt-dlp · ffmpeg · Whisper · pytrends · PRAW: $0 (local/gratis)

**Total adicional: $0**

---

## ATRIBUCIÓN

El **Método Audience** original es de **Elias Mamã (Marconi Rômulo)** y su equipo. Esta skill es una **adaptación operativa** al ecosistema Claude Code por **Joseph Moreno · Zenith**. Todo crédito conceptual y pedagógico pertenece a Elias Mamã.

Pipeline de análisis viral validado en producción · implementación operativa de Joseph Moreno · Zenith.
