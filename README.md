<div align="center">

<img src="assets/zenith-audience-banner.svg" alt="Zenith Audience" width="900"/>

# Zenith Audience™

### Sistema diario para crear contenido viral con identidad incopiable

**32 agentes · 22 commands · 51 knowledge files · 70+ formatos + banco ZENITH (~24) · 6 ganchos-hook por reel · 7 HTML templates · 100% gratis**

[![License: MIT](https://img.shields.io/badge/License-MIT-cyan.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Plugin-purple.svg)](https://claude.com/claude-code)
[![Status](https://img.shields.io/badge/Status-v1.8.0-00E5CF.svg)](https://github.com/zenithmetodo/zenith-audience/releases)
[![Free](https://img.shields.io/badge/Métricas-100%25%20Gratis-00E5CF.svg)](#stack-100-gratis)

**[INSTALAR](#instalación) · [USO DIARIO](#uso-diario) · [LOS 12 TEMPLATES](#los-12-templates-virales) · [METRICOOL](#métricas-metricool-free) · [APIFY](#apify-research-free)**

</div>

---

## ¿Qué es Zenith Audience?

**Zenith Audience™** es un mega-plugin de Claude Code que implementa **el Método Audience completo** de Elias Mamã (Marconi Rômulo) en un sistema operativo de uso diario.

> *Adaptado y compilado por Joseph Moreno · Marca Zenith*

### El problema que resuelve

La mayoría de creadores conocen los conceptos (gatilhos · estructuras · notable) pero **no logran ejecutarlos consistentemente** en su día a día. Resultado:
- Contenido genérico que no convierte
- Bloqueo creativo diario
- Frameworks copiados mal
- Quemar tokens en LLMs sin sistema

### La solución Zenith

**32 agentes especializados** + **22 slash commands** orquestados como sistema operativo diario · cada uno crack de UNA cosa · todos coordinados.

---

## La fórmula completa

```
GATILLOS DE ATENCIÓN (7)
        +
CONTENIDO NOTABLE (8 elementos)
        +
NÚCLEO DE INFLUENCIA (10 preguntas)
        +
CONSISTENCIA (sistema diario Zenith)
        =
AUDIENCIA ORGÁNICA QUE TE RESPETA · CONFÍA · COMPRA
```

---

## Arquitectura del sistema

<div align="center">
<img src="assets/arquitectura-modular.svg" alt="Arquitectura Zenith Audience" width="900"/>
</div>

### 9 bloques de agentes

| Bloque | Función | Agentes | Cuándo usar |
|---|---|---|---|
| **A · Investigación** | Spy + trends + engenharia + ideas ganadoras ⭐ | 6 | Lunes · sábados · ad-hoc |
| **B · Núcleo Influencia** | Setup one-shot · 10 preguntas | 5 | 1 vez al inicio + refresh anual |
| **C · Asuntos Virales** | 15-20 ideas diarias + validación + pesquisa | 3 | Diario AM |
| **D · Gatillos & Headlines** | 7 gatillos + 3 tipos + batch mensual | 3 | Antes de grabar |
| **E · 12 Estructuras** | Selector + aplicador + rotación | 3 | Por cada vídeo |
| **F · Creación + Formato** | Formato-master (70+ + banco ZENITH) + consciencia-master + reel-html-builder + reel + carrusel + hilo | 6 | 3-5x/semana |
| **G · Notable** | Auditor + builder · 8 elementos + STEPPS | 2 | Antes de publicar |
| **H · Métricas** | Metricool + iteración ganadores + decisión | 2 | Viernes + lunes |
| **I · Planificación** | Plan semana + batch day | 2 | Domingo + día batch |

**Total: 32 agentes coordinados por 22 slash commands.**

### 🔍 Detalle Bloque A · Investigación (el más importante para ideas)

| Agente | Qué hace | Modelo |
|---|---|---|
| `spy-competidor` | Disecciona últimos 30 posts del competidor · gatilhos · estructuras · GAPS | Opus |
| `trend-google` | Tendencias Google Trends (gratis · pytrends) | Sonnet |
| `trend-redes` | Trends TikTok/IG vía Apify (free $5/mes) | Opus |
| `trend-foros` | Reddit threads + YouTube shorts (gratis) | Sonnet |
| `engenharia-reversa` | Análisis profundo 5 capas de un viral · receta replicable | Opus |
| `ideas-ganadoras-adapter` ⭐ | Multi-fuente · transcribe · adapta a TU núcleo · 3 variantes | Opus |

### 📊 Detalle Bloque H · Métricas + Decisión

| Agente | Qué hace |
|---|---|
| `metrics-analyst` ⭐ | Lee Metricool · aplica las 3 métricas · sistema de decisión REPLICAR/ITERAR/GUARDAR/APRENDER/DESCARTAR |
| `iteracion-ganador` | Toma viral propio · genera 10 variantes (cambia gatilho/template/audiencia/formato/contexto) |

**El método define solo 3 métricas (Clases 8-9):**
1. **Pulados** (Skip Rate) — <40% = viral potencial · <30% = bomba
2. **Retención** (Watch Time) — >30% bueno · >50% excelente · >70% viral masivo
3. **Interacciones** (Engagement) — >10% objetivo · >15% muy bueno · >20% bomba

Mira el [knowledge file completo de métricas](knowledge/metricas/00-las-3-metricas-del-metodo.md) y el [sistema de decisión](knowledge/metricas/01-decision-replicar-iterar-descartar.md).

---

## Pipeline de uso diario

<div align="center">
<img src="assets/pipeline-diario.svg" alt="Pipeline Diario" width="900"/>
</div>

### 🌅 Día tipo · 10-15 min

```bash
07:00 → /audience-ideas         → 15-20 ideas hoy (multi-fuente)
07:04 → /audience-formato [idea] → formato fuera de la caja (70+ + banco ZENITH)
                                   + NIVEL DE CONSCIENCIA (consciencia-master) + 6 ganchos
07:08 → /audience-reel-html [idea] → HTML doc-guion: badge NIVEL + dibujo del formato +
                                   6 ganchos + GUION palabra por palabra + overlays + CTA
07:11 → /audience-audit         → checklist final
07:13 → Grabas leyendo del DIBUJO y publicas
```
> **El nivel de consciencia manda el contenido:** BAJO=síntomas/creencias · MEDIO=mecanismo/con-vs-sin · ALTO=romper objeciones. Los niveles **se mezclan** (abre en BAJO, cierra en MEDIO/ALTO). El **CTA siempre existe** y lleva al destino que tú decidas.
> ⚡ Atajo: `/audience-reel [idea]` orquesta guion + ganchos en un solo paso.

### 📅 Semana tipo

```
Lunes      → /audience-trend (multi-fuente)
Mar-Jue    → /audience-reel × 3
Viernes    → /audience-metrics + iterar ganadores
Sábado     → /audience-spy @competidor
Domingo    → /audience-plan-semana
```

### ⭐ Adaptar viral · 10 min

```bash
/audience-adaptar https://instagram.com/reel/XXXXX/
```

→ Transcribe · analiza · extrae idea ganadora · adapta a TU núcleo · 3 variantes (reel + carrusel + hilo)

📖 **Workflow completo paso a paso:** [GETTING_STARTED.md](GETTING_STARTED.md)

---

## 🧠 Niveles de Consciencia (agente `consciencia-master`)

Cada reel se trabaja por **nivel de consciencia** (Schwartz) — depende de lo consciente que esté el avatar de su problema y de tu solución. El agente `consciencia-master` lo diagnostica y dicta QUÉ conecta en cada nivel (el **hook** y el **cuerpo**); `reel-html-builder` lo plasma en un **badge** arriba del doc-guion.

| Nivel | Qué CONECTA (lo que se habla) |
|---|---|
| **BAJO (1-2)** | **síntomas · creencias erróneas · dolor** + **"no hagas esto / haz esto"** (principalmente bajo). Despertar/identificar. |
| **MEDIO (3-4)** | **el mecanismo · TODAS las comparaciones (sobre todo CON vs SIN) · demostración.** Aquí cabe MUCHÍSIMO: casi cualquier formato funciona en medio. |
| **ALTO (5)** | **romper objeciones (precio/tiempo/miedo) · prueba social · mecanismo** — también con formatos (ej. ranking de "las excusas que más se dicen para no [resultado]"). |

> ⚠️ **Los niveles se MEZCLAN** (lo normal): el reel abre en BAJO (para no perder a nadie) y sube a MEDIO/ALTO — el badge puede declarar la mezcla (`BAJO → MEDIO`). **Los formatos NO están atados a un nivel**: cualquiera (alineación, escalera, ranking, tier…) se escribe en BAJO/MEDIO/ALTO cambiando el ángulo — lo decide el experto en formatos. **El CTA lo diriges TÚ** (no depende del nivel). Detalle: `knowledge/formatos-reels/08-niveles-consciencia.md`.

---

## Los 12 Templates Virales

**Mes y medio sin repetir el mismo template.** 3 familias · 12 fórmulas verificadas:

### Familia 1 · Ultra-Especificidad

| # | Template | Fórmula | Ejemplo canónico |
|---|---|---|---|
| 1 | **Ultra-específico** | `[VERBO] + [OBJETO ULTRA] + [CONTEXTO]` | "Toma creatina 30 min ANTES del entreno" |
| 2 | **Autoridad** | `[HÁBITO] + después de [FUENTE]` | "Cosas que ya no hago tras estudiar neurociencia" (2M views) |
| 3 | **Parecen normales** | `[Producto común] + parece bueno + consecuencia` | "Alimentos que parecen sanos pero traban el intestino" |
| 4 | **Mayor motivo** | `MAYOR MOTIVO por el que [dolor]` | "Mayor motivo por el que mujer 40+ no logra emagrecer" |

### Familia 2 · Disrupção

| # | Template | Fórmula | Ejemplo |
|---|---|---|---|
| 5 | **Invalidar creencia** | `La creencia sobre X está EQUIVOCADA` | "USA es uno de los PEORES países" (3M views · Roberto Spigel) |
| 6 | **Enemigo puso la mano** | `[Enemigo] puso mano en [cosa] y cambió` | "El funqueiro puso la mano en la Lacoste..." |
| 7 | **Enemigo adora/odia** | `Lo que [enemigo] ADORA/ODIA que hagas` | "Lo que el abusador ADORA que las mujeres hagan" |
| 8 | **Llevé X años** | `Demoré [N años] · enseño en [Y seg]` | "Demoré 60 años para aprender esto sobre Dios" |

### Familia 3 · Autoridade + Mistério

| # | Template | Fórmula | Ejemplo |
|---|---|---|---|
| 9 | **Características ultra-específicas** | `Toda persona con [X] necesita esto antes de [DEADLINE]` | "Toda mujer 50+ antes que tenga Alzheimer" |
| 10 | **Autoridad en X** | `[N COSAS] son AUTORIDAD en [SITUACIÓN]` | "Películas que son facultad de oratoria" (Fabi Bert) |
| 11 | **La próxima vez X** | `Próxima vez que [hagas X] · NO Y · haz Z` | "Próxima conversación · NO mires a los ojos" |
| 12 | **Transforma X en Y** | `[N COSAS] que TRANSFORMAN [antes] en [después]` | "4 marinadas que transforman tu pollo" |

**Cada template tiene su knowledge file completo en `knowledge/templates/` con fórmula + ejemplos + cuándo SÍ usar + cuándo NO usar + variaciones + errores comunes.**

---

## Los 7 Gatillos de Atención

| # | Gatillo | Activa | Stacking típico |
|---|---|---|---|
| 1 | **Recompensa** | Dopamina por expectativa | + Autoridad (Lili) |
| 2 | **Misterio** | Brecha información | + Creencia (paredes grises) |
| 3 | **Reconocimiento** | "Esto es para mí" | + Recompensa (45+ menopausia) |
| 4 | **Popularidad** | Bandwagon · tribu | + Disrupción (Trump visas) |
| 5 | **Creencia** | Pertenencia + validación | + Autoridad |
| 6 | **Autoridad** | Obediencia automática | + Disrupción (cardiólogo) |
| 7 | **Disrupción** | Alerta cerebral | + Autoridad (Neymar Al-Hilal) |

**Regla:** nunca uses 1 solo gatillo · mínimo 2-3 (stacking).

---

## Los 8 Elementos del Notable

1. **Valor práctico** (replicable + útil)
2. **Puntos de identificación** ("esto soy yo")
3. **Opiniones fuertes** (polarización propósito)
4. **Argumentaciones poderosas** (munición debate)
5. **Noticias** (atención prestada momento)
6. **Historias** (emociones > lógica)
7. **Pruebas** (estudios · antes/después)
8. **Hechos curiosos** ("wow no sabía eso")

**Regla:** mínimo 2-3 elementos por vídeo · ideal 4-5.

---

## Núcleo de Influencia · 10 preguntas

Setup ONE-SHOT al inicio (2-3h):

1. ¿Quién eres tú? · 2. ¿Historia de creación? · 3. ¿A quién ayudas? · 4. ¿Qué dolor resuelves? · 5. ¿Promesa de transformación? · 6. ¿Quién es tu enemigo? · 7. ¿Qué creencias defiendes? · 8. ¿Cuáles son tus pruebas? · 9. ¿Bordones · lenguaje propio? · 10. ¿Tu verdadero yo?

**Comando:** `/audience-setup`

---

## Los 21 Slash Commands

| Command | Función | Frecuencia recomendada |
|---|---|---|
| `/audience-setup` | Setup núcleo influencia one-shot | 1x al inicio · refresh anual |
| `/audience-doctor` | Diagnostica + instala todo (CLIs · deps · MCPs) | 1ª vez · si algo falla |
| `/audience-ideas` | **15-20 ideas multi-fuente** (Apify + IA + trends) | Diario AM |
| `/audience-pesquisa` | Pesquisa magnética profunda · 30+ asuntos pilares | Mensual |
| `/audience-trend` | Trends Google + Reddit + YT + Apify | 1-2x/semana |
| `/audience-spy [@handle]` | Análisis competidor en profundidad | Semanal |
| `/audience-analizar-creator [@handle]` ⭐ | Pipeline 10 pasos · scrape + frames + transcripción + adaptación | A demanda |
| `/audience-adaptar [url]` ⭐ | Adaptar viral ajeno a tu núcleo | A demanda |
| `/audience-formato [tema]` ⭐ | Formato óptimo (70+ + banco ZENITH ~24) · piensa FUERA DE LA CAJA + 6 ganchos | Antes de grabar |
| `/audience-reel-html [tema]` ⭐ | Maqueta el reel terminado: HTML doc-guion + GUION.md (+ interactivo si clasificatorio) | Tras elegir formato |
| `/audience-headline [tema]` | 10 headlines (3 tipos · v/v/audio) | Antes de grabar |
| `/audience-headline-batch` | Batch mensual 30-50 headlines | Día 1 mes |
| `/audience-reel [tema]` | Guion completo reel HTML estético + 6 ganchos | 3-5x/semana |
| `/audience-carrusel [tema]` | Carrusel 8-10 slides estético | 2-3x/semana |
| `/audience-hilo [tema]` | Thread X/IG/LinkedIn | 1-2x/semana |
| `/audience-audit [guion]` | Audit 8 notable + 5 criterios viral | Antes de publicar |
| `/audience-iterar [post]` | 10 variantes de viral propio | Cuando >3x media |
| `/audience-metrics` | Métricas + decisión (replicar/iterar/descartar) | Viernes + lunes |
| `/audience-plan-semana` | Calendario 7 días con rotación 12 templates | Domingo |
| `/audience-batch-day` | Plan grabación batch (5-10 reels en 1 día) | Día 15 mes |
| `/audience-engenharia [url]` | Engenharia reversa profunda 5 capas | A demanda |

---

## Stack 100% Gratis

### Métricas · Metricool MCP Free

- **Plan Free permanente:** 1 marca · IG + TT + YT + FB + Pinterest + Threads + Bluesky + Twitch
- **30 días histórico** · 5 competidores · 20 contenidos planificados/mes
- **MCP oficial** · una sola conexión OAuth
- Empresa española · soporte en castellano

### Research · Apify Free

- **$5/mes gratis** (~2000 scrapes · suficiente para uso individual)
- Scrapers TT · IG · YT para spy competidores · trending

### Trends · APIs oficiales gratis

- **Google Trends** vía `pytrends` (gratis · sin API key)
- **Reddit** vía `PRAW` (gratis · oficial)
- **YouTube** Data API v3 (gratis · 10K cuota/día)

### Transcripción · 100% local · gratis

- `youtube-transcript-api` (YouTube · instant)
- `yt-dlp` + `faster-whisper` (IG/TT · local · ES+PT+EN)

### 💰 Coste del plugin

**Si pagas plan Claude (Pro $20 · Max $100 · Max $200/mes):**
- ✅ Todo el uso del plugin está **INCLUIDO en tu plan flat**
- ✅ Sin coste por token · sin sorpresas a fin de mes
- ✅ Metricool Free + Apify Free + Whisper local · todo gratis

**Total mensual:** solo tu plan Claude habitual.

---

## Knowledge Library · 51 archivos

```
knowledge/
├── core/                           (5) · pilares · algoritmos · misión
├── gatillos/                       (8) · 7 gatillos + overview
├── asuntos-virales/                (3) · 6 categorías + 3 tipos + 5 criterios
├── headlines/                      (3) · 3 tipos + plan creación
├── templates/                      (12) · 1 archivo por estructura
├── formatos-reels/                 (11) · 70+ formatos + banco ZENITH
├── notable/                        (2) · 8 elementos + Berger STEPPS
├── nucleo-influencia/              (2) · 10 preguntas + verdadero yo
├── metricas/                       (2) · 3 métricas + decisión
├── pipelines/                      (1) · análisis creator viral ⭐
└── mecanismo/                      (2) · ⭐ Biblia del Mecanismo + cómo usarlo en Audience
```

Cada knowledge internalizado en system prompt de los agentes (estilo Custom GPT). Cero re-lectura en runtime = cero tokens desperdiciados.

---

## Instalación

### Opción 1 · Auto-install (recomendado)

```bash
# macOS / Linux
curl -fsSL https://raw.githubusercontent.com/zenithmetodo/zenith-audience/main/install.sh | bash

# Windows PowerShell
iwr -useb https://raw.githubusercontent.com/zenithmetodo/zenith-audience/main/install.ps1 | iex
```

### Opción 2 · Manual con Claude Code

```bash
# Marketplace
/plugin marketplace add https://github.com/zenithmetodo/zenith-audience
/plugin install zenith-audience
```

### Opción 3 · Clone directo

```bash
mkdir -p ~/.claude/plugins
git clone https://github.com/zenithmetodo/zenith-audience.git ~/.claude/plugins/zenith-audience
```

### Setup post-instalación

```bash
# 1. Dependencias Python (opcionales · para scripts trends/transcripción)
pip install -r requirements.txt

# 2. Metricool MCP (gratis)
claude mcp add --transport http metricool https://ai.metricool.com/mcp

# 3. Apify MCP (free $5/mes)
claude mcp add --transport http apify https://mcp.apify.com --header "Authorization=Bearer YOUR_APIFY_TOKEN"

# 4. Variables de entorno (.env)
cp .env.example .env
# Edita y añade:
# REDDIT_CLIENT_ID, REDDIT_CLIENT_SECRET
# YOUTUBE_API_KEY
# APIFY_TOKEN
```

Setup detallado: ver [INSTALL.md](INSTALL.md) · [METRICOOL_SETUP.md](METRICOOL_SETUP.md) · [APIFY_SETUP.md](APIFY_SETUP.md) · [WHISPER_SETUP.md](WHISPER_SETUP.md)

---

## Uso Diario

### Primera vez (one-shot · 2-3h)

```bash
/audience-setup
```

Te guía las 10 preguntas del núcleo de influencia.

### Rutina diaria (10-15 min)

```bash
/audience-ideas                  # 15-20 ideas
/audience-formato [idea]         # formato + NIVEL DE CONSCIENCIA + 6 ganchos
/audience-reel-html [idea]       # HTML doc-guion (badge nivel + dibujo + guion + CTA) + GUION.md
/audience-audit [guion]          # filtro de calidad
```

### Rutina semanal

```bash
# Domingo (planificación)
/audience-plan-semana

# Lunes (trends)
/audience-trend

# Viernes (métricas + iteración)
/audience-metrics
/audience-iterar [post-ganador]
```

### Cuando ves un viral

```bash
/audience-adaptar https://instagram.com/reel/XXXXX/
```

→ 3 variantes adaptadas a TI (reel + carrusel + hilo) con análisis "por qué funcionará" + "en qué se basa"

---

## Filosofía Zenith

1. **Consistencia > perfección.** Publica imperfecto antes que esperar lo perfecto.
2. **Específico > genérico.** Cuanto más específico · más viral.
3. **Polariza con propósito.** Opiniones fuertes ganan tribu · no neutralidad.
4. **Sirve al avatar · no al algoritmo.** El algoritmo premia lo que sirve al avatar.
5. **Adapta · no copies.** La idea ganadora se adapta al Verdadero Yo · nunca se copia.

---

## Coste Total Mensual

### 🎯 Recomendado · Plan Claude flat (Pro · Max)

| Plan Claude | Coste mensual | Uso del plugin |
|---|---|---|
| **Pro** | $20/mes | Incluido · creador individual · ideal para empezar |
| **Max** | $100/mes | Incluido · uso intenso diario · creator full-time |
| **Max** | $200/mes | Incluido · agencia · multi-cliente |

✅ **Sin coste adicional por uso del plugin** · todo dentro de tu plan flat
✅ **Sin sorpresas a fin de mes** · sabes exactamente lo que pagas
✅ **Sin contar tokens** · usa el plugin tranquilo todo el día

### Servicios externos (todos gratis)

| Servicio | Coste |
|---|---|
| Metricool plan Free | **$0** |
| Apify Free $5/mes credit | **$0** (dentro del free tier) |
| Whisper local · pytrends · PRAW · YT API | **$0** (todo open source) |
| **TOTAL adicional al plugin** | **$0** |

### Alternativa · API pay-per-use (solo referencia)
Si prefieres no pagar plan flat: ~$20-25/mes uso intenso diario.

vs **1 hora de creative agency = $100+** o **agency mensual = $2000+**. ROI brutal.

📖 **Workflow detallado paso a paso:** [GETTING_STARTED.md](GETTING_STARTED.md)

---

## Comparativa vs otros sistemas

| Enfoque común | Zenith Audience |
|---|---|
| "Postea mucho" | Postea **estructurado** (12 templates probados) |
| Engagement bait | **Notable real** (8 elementos) |
| Copia lo viral | **Adapta al Verdadero Yo** |
| Trucos de algoritmo | **Psicología del cerebro** (7 gatillos) |
| "Sigue trends" | **Construye narrativa de marca** |
| Herramientas dispersas | **Sistema operativo unificado** |

---

## Contribuir

Ver [CONTRIBUTING.md](CONTRIBUTING.md). PRs bienvenidas para:
- Nuevos templates virales detectados
- Ejemplos canónicos de otros nichos
- Mejoras de prompts
- Scripts de scraping adicionales
- Traducciones (PT · EN)

---

## Hermano de plugins

**Zenith Crea Ofertas™** — el sistema complementario para crear ofertas de alto valor percibido a partir del avatar definido en tu núcleo de influencia.

→ [github.com/zenithmetodo/zenith-crea-ofertas](https://github.com/zenithmetodo/zenith-crea-ofertas)

---

## Atribución

El **Método Audience** original es de **Elias Mamã (Marconi Rômulo)** y su equipo. Este plugin es una **adaptación operativa** al ecosistema Claude Code por **Joseph Moreno · Zenith**. Todo crédito conceptual y pedagógico pertenece a Elias Mamã.

### Stack técnico
- **Anthropic Claude** (Opus 4.7 · Sonnet 4.6 · Haiku 4.5)
- **Metricool** (métricas multi-plataforma)
- **Apify** (scraping)
- **pytrends · PRAW · YouTube API · youtube-transcript-api · yt-dlp · faster-whisper** (todo open source gratis)

---

## License

MIT License · ver [LICENSE](LICENSE).

---

<div align="center">

**Construido por Joseph Moreno · Zenith · 2026**

[Website](https://zenith.com) · [Twitter](https://twitter.com/zenithmetodo) · [GitHub](https://github.com/zenithmetodo)

⭐ **Si te ayuda · dale una estrella en GitHub** ⭐

</div>
