# Changelog · Zenith Audience™

## v1.7.0 · 2026-06-04

### 🎬 Nuevo agente de maquetado + banco de formatos ZENITH

- ✅ Nuevo agente `reel-html-builder` (`agents/31-reel-html-builder.md`) — MAQUETA el reel terminado: `.html` doc-guion (con EL DIBUJO del formato + 6 ganchos-hook + CUERPO palabra por palabra + overlays + CTA) **+ un `GUION.md` legible** + herramienta interactiva con mascota Zenón-cursor si es clasificatorio.
- ✅ Nuevo comando `/audience-reel-html` (`commands/audience-reel-html.md`).
- ✅ `formato-master` ampliado con el **banco ZENITH de ~24 formatos disruptivos** (`knowledge/formatos-reels/10-formatos-zenith-html.md`) + directiva **PENSAR SIEMPRE FUERA DE LA CAJA**.
- ✅ Separación de roles: `formato-master` decide QUÉ formato + ideas de ganchos · `reel-html-builder` lo PRESENTA (HTML + GUION.md).
- ✅ Pipeline de análisis de creator: añadido **PASO 10** (maquetar con `reel-html-builder`).
- ✅ Pipeline diario reescrito: ideas → formato → reel-html → audit → grabar.

#### Stats actuales
- **31 agentes** (Bloque F ahora con 5: formato-master + reel-html-builder + reel-architect + carrusel-architect + hilo-architect)
- **21 commands** (añade `/audience-reel-html`)
- **49 knowledge files** (+ banco de formatos ZENITH)
- **70+ formatos visuales + banco ZENITH ~24** disruptivos
- **6 ganchos-hook por reel** (estándar nuevo del reel-html-builder)
- Sincronizados todos los counts en README · INSTALL · SKILL · plugin.json (v1.7.0) · SVG banner/pipeline/arquitectura.

---

## v1.2.2 · 2026-05-29

### 🛠️ Bug fixes masivos (auditoría con agentes Opus)

Tras auditoría profunda con 3 agentes Opus paralelos · correcciones de coherencia:

#### Fallos críticos corregidos
- ✅ Creado `/audience-headline-batch` (referenciado en docs · faltaba)
- ✅ Creado `/audience-pesquisa` (para agente pesquisa-magnetica huérfano)
- ✅ Reescrito `templates/reel-guion.html` con modelo "4 ganchos" (era "3 headlines")
- ✅ Actualizado `/audience-reel` descripción + pipeline para invocar formato-master
- ✅ Añadido modo manual a `/audience-metrics` (fallback sin Metricool)
- ✅ Añadido manejo de error Apify en `spy-competidor` y `trend-redes` (con instrucciones de setup + modo degradado)
- ✅ Eliminado rastro "4 verbal × 4 visual × 4 audio" del SVG arquitectura
- ✅ Actualizado banner SVG (30 agentes · 18 commands · 44 knowledge)
- ✅ Sincronizado counts en README · INSTALL · agentes (29→30 · 15→18 · 32→44)

#### Stats actuales
- **30 agentes** (Bloque F ahora con 4: reel-architect · carrusel-architect · hilo-architect · formato-master)
- **18 commands** (incluye /audience-formato · /audience-headline-batch · /audience-pesquisa)
- **44 knowledge files** (32 originales + 2 métricas + 8 formatos-reels + 2 más)
- **60+ formatos visuales** con generador dinámico

---

## v1.2.1 · 2026-05-29

### Corrección · 4 ganchos óptimos por reel (NO matriz 4×4)

- Antes (mal): matriz 4×4×4 = 32 elementos testing por reel
- Ahora (correcto): 4 ganchos óptimos por reel · cada uno con su VERBAL (audio) + TEXTUAL (overlay) = 8 elementos

Los 4 ganchos son los **mejores posibles para ese reel concreto**, no una matriz exhaustiva.

---

## v1.2.0 · 2026-05-28

### 🔥 NUEVO agente · formato-master (#30)

- Crack de los 60+ formatos visuales
- GENERA formatos nuevos dinámicamente cuando ninguno encaja
- Estructura timestamps PRO (VISUAL + AUDIO + OVERLAY + ICONO)

### 60+ formatos en 11 categorías

1. Talking · 2. Visual overlay · 3. Split Screen · 4. Comparativas (incluye 2 personas reales mismo plano) · 5. Rankings (Tier list · Top 10 · Bracket) · 6. Narrativo (incluye Loop iterativo) · 7. Demostración · 8. Voiceover · 9. Estéticos · 10. Interactivos · 11. Emergentes 2026

### 7 formatos con knowledge file completo
- Competición/Bracket · Ranking ordenado · Tier list · Pizarra · Conversación errores · Pregunta-respuesta · Sirve/NoSirve

### Otros cambios
- Nuevo `/audience-formato`
- `reel-architect` mejorado (Opus)
- SVGs arquitectura + pipeline actualizados

---

## v1.1.0 · 2026-05-28

### 🔥 asuntos-generator MULTI-FUENTE

15-20 ideas/día en mix:
- 6-7 de competidores validados (Apify)
- 6-7 generadas por IA (núcleo)
- 3-4 trending del momento
- 2 contraintuitivas

### Métricas profundas (Clases 8-9)

- `knowledge/metricas/00-las-3-metricas-del-metodo.md`
- `knowledge/metricas/01-decision-replicar-iterar-descartar.md`
- Sistema decisión 5 acciones (REPLICAR/ITERAR/GUARDAR/APRENDER/DESCARTAR)
- `metrics-analyst` mejorado (Sonnet → Opus)

### GETTING_STARTED.md nuevo

Workflow 7 días paso a paso · rutinas diaria/semanal/mensual.

### Coste actualizado a plan Claude

"Incluido en plan flat (Pro $20 · Max $100 · Max $200)"

---

## v1.0.0 · 2026-05-28

### Lanzamiento inicial

Sistema diario para crear contenido viral basado en el Método Audience de Elias Mamã (Marconi Rômulo) · adaptado por Joseph Moreno · Zenith.

#### Componentes iniciales
- 29 agentes especializados
- 15 slash commands
- 32 knowledge files
- 7 HTML templates estéticos
- 6 scripts Python (gratis · pytrends · PRAW · YT API · Whisper local)
- 2 MCP configs (Metricool Free · Apify Free $5/mes)
- 4 SVGs
- Examples canónicos
- Docs profesionales

#### Coste mensual estimado
- Plan Claude (Pro $20 · Max $100 · Max $200): incluye todo
- Metricool Free: $0
- Apify Free $5/mes: $0
- Total adicional: **$0**

---

## Roadmap

### v1.3 (próximo)
- Tests E2E mínimos en CI (valida que agentes referenciados en commands existen)
- Más knowledge files de formatos (de 7 a 15-20 con guion-tipo)
- HTML template para `formato-recomendaciones.html`

### v1.4
- Avatar IA / Sintético opcional (ElevenLabs)
- Dashboard Next.js opcional (Vercel · separado)

### v2.0
- Multi-marca (Metricool Starter)
- LinkedIn/Twitter cuando Metricool lo añada al Free
