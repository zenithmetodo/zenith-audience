# Changelog · Zenith Audience™

## v1.11.0 · 2026-09-02

### 🔴 El método del reel, cosido DENTRO del pipeline diario + dos ejemplos trabajados

- ✅ **`SKILL.md` · la sección "LA SECUENCIA DE USO" reescrita.** El bloque **🌅 DIARIO** ya no es una lista de comandos: **es el método obligatorio de 5 pasos** (cruce → formato → guion → maquetado → revisores), con **el agente concreto de cada paso**, **qué se le enseña al usuario antes de pasar al siguiente** y **el gate de cada uno**. Ahí es donde mira un agente cuando va a trabajar, y ahí es donde ahora está el método.
  - Paso 1 · skill `cruce` + `consciencia-master` · Paso 2 · `formato-master` · Paso 3 · `reel-architect` · Paso 4 · `reel-html-builder` · Paso 5 · **tres pases independientes de `notable-auditor`** (voz · grabable · CTA y reconocimiento) + `notable-builder`.
- ✅ **El bloque del principio pasa a ser RESUMEN** y cede el mando: *"si algo de aquí y algo de allí no coinciden, manda la secuencia"*.
- ✅ **Eliminada la contradicción del atajo:** `/audience-reel` ya no es "alternativa rápida en un solo paso" — es **el paso 3**, y solo se lanza con el 1 y el 2 ya enseñados. El bloque SEMANAL también se corrigió.
- ✅ **Nuevo knowledge `knowledge/pipelines/02-ejemplos-trabajados.md`** — **dos casos reales recorridos de punta a punta**, enseñando **literalmente lo que el agente le escribe al usuario en cada paso**:
  - **EJEMPLO A · EL HOMBRE DEL TIEMPO** — el que salió bien. El ejemplo del **formato-objeto**: un objeto cotidiano que informa sin explicar.
  - **EJEMPLO B · LA ONDA (el no-show)** — el que **suspendió**: diagnóstico de cruce excelente (frío por RELACIÓN y no por ignorancia · S4-S5 con los mecanismos quemados · el hueco en el carril del DIAGNÓSTICO) y **los tres revisores lo tumbaron a la primera**. Sin maquillar: síntoma que no se reconocía en 3 s · ganchos abriendo con la pantalla vacía · **un dato inventado con fuente falsa** · un remate que culpaba al que mira · jerga interna en pantalla de principio a fin · y un guion que no cabía en la duración que declaraba. Su **DIBUJO es el modélico** (coordenadas, píxeles, tiempos).
  - Cierra con **LAS CLAVES · 12 reglas** sacadas de lo que falló en producción, no de la teoría.
- ✅ `01-metodo-obligatorio-del-reel.md` enlaza al 02 y concreta **quién hace cada uno de los tres pases de revisión**.
- ✅ Counts sincronizados de verdad (contados, no estimados): README · INSTALL · SKILL · plugin.json.

### 🔧 El método, propagado a los EJECUTORES (antes moría en la frontera del SKILL.md)

- ✅ **Gate del método en los 8 ficheros que hacen el trabajo.** Los 4 comandos (`/audience-formato` · `/audience-reel` · `/audience-reel-html` · `/audience-audit`) y los 4 agentes (`formato-master` · `reel-architect` · `reel-html-builder` · `notable-auditor`) abren ahora ordenando **leer `01-metodo-obligatorio-del-reel.md` entero**, declarando **qué paso son** y **parando si el paso anterior no se le ha enseñado al usuario**. Antes, quien escribía `/audience-reel` directamente no pasaba por el método en ningún momento.
- ✅ **`/audience-reel` deja de colapsar los pasos 2-3-4-5 en una llamada.** `reel-architect` ya **no lanza `formato-master`** (recibe el formato ganador y su dibujo del paso 2), y se le han quitado los bloques de auditoría (paso 5) y de maquetado HTML (paso 4), que son de otros agentes.
- ✅ **`/audience-audit` pasa a ser el gate de verdad:** **tres pases independientes** de `notable-auditor` (VOZ · GRABABLE · CTA Y RECONOCIMIENTO), veredicto **OK/FIX** con la corrección exacta en vez del `SCORE X/100`, y *"con un solo FIX abierto no se entrega"*. `notable-auditor` estrena la sección **MODO DE PASE** con el checklist de cada uno.
- ✅ **Resuelta la contradicción TRES formatos vs 8-15+** (estaba en el mismo SKILL.md, y la versión 8-15+ era la propagada a los ejecutores): **se explora un menú amplio internamente y al usuario COMPITEN TRES**. Aplicado, palabra por palabra, en SKILL · `formato-master` · `00-master-formatos-reels` · `10-formatos-zenith-html`; y `consciencia-master` pasa de "2-3 formatos" a "3".
- ✅ **LA TRAMPA DEL ORDEN, escrita:** *"orden de trabajo ≠ orden de documento"* — el paso 2 deja el hueco del `DI →` **marcado y vacío**; el texto literal es del paso 3. **`formato-master` no escribe guion nunca.**
- ✅ **`zenith-audience:` en TODAS las invocaciones** de `agents/` y `commands/` (antes: cero). Y la skill del paso 1 pasa a citarse como **`zenith-audience:cruce`** — hay una skill llamada `cruce` en al menos diez plugins más.
- ✅ **`/audience-formato` describe por fin el paso 2** (los tres, las dos mecánicas, el ganador y **EL DIBUJO**) y deja de invadir el paso 4 en su `description`.
- ✅ **Las reglas del HTML editable** (`#barra` fuera de `#contenido` · clave única en la copia · volcado en `visibilitychange`/`beforeunload` · cancelar el debounce antes de restablecer · guardar antes de imprimir · pegado a texto plano) escritas en `reel-html-builder` y en `/audience-reel-html`, que es donde se evitan.
- ✅ **Rutas:** 13 rutas relativas `scripts/…` y `templates/…` prefijadas con `${CLAUDE_PLUGIN_ROOT}/` (el comando de auto-verificación del SKILL fallaba siempre), y la ruta fantasma `MEMORIA ARCHIVOS MD/…` —lectura *obligatoria* de una carpeta que no existe en el plugin— sustituida por la **búsqueda tolerante con Glob** que ya define el propio SKILL.
- ✅ **Datos inventados fuera de `02-ejemplos-trabajados.md`** (verificados uno a uno contra los guiones reales): el gancho A del ejemplo A era un Frankenstein que además abría nombrando el formato —lo que el propio reel prohíbe—; el badge `FRÍO N1→N2` con pastilla, color y píxeles no existía y contradecía la CLAVE 7; los "52 segundos" y el "cuatro de los seis" no se pueden señalar en la fuente; la duración "70-85 s" son 81 (76 con cortes); "están grabados" son "listos para grabar"; y el documento se equivocaba contando sus propios hallazgos (seis y doce, no cuatro y trece).
- ✅ **Repo:** `install.sh` instala por fin **como plugin de marketplace** (clonaba en `~/.claude/skills/`, justo lo que el README dice que deja los 32 agentes inertes) · README declara **licencia propietaria** en vez de MIT · `INSTALL.md` dice 22 comandos y su árbol incluye `skills/` · el CI compara los counts **contra el README** en vez de umbrales flojos · `.in_use/` fuera de git y en `.gitignore` · SVG y plantilla de issue a v1.11.0.

#### Stats actuales
- **32 agentes** · **22 commands** · **102 knowledge files** · **9 bloques** · 70+ formatos + banco ZENITH (~24) · 6 ganchos-hook por reel · 7 HTML templates

---

## v1.8.0 · 2026-06-05

### 🧠 Niveles de consciencia + entrega HTML obligatoria

- ✅ Nuevo agente `consciencia-master` (`agents/32-consciencia-master.md`) — experto en NIVELES DE CONSCIENCIA (Schwartz). Diagnostica el nivel (y las **MEZCLAS** bajo-medio-alto, que son lo normal) y dicta QUÉ conecta en cada uno: BAJO=síntomas/creencias/dolor · MEDIO=mecanismo + comparación con-vs-sin · ALTO=romper objeciones + prueba + mecanismo. Importado de `neurocopy-ads-master`.
- ✅ `08-niveles-consciencia.md` ampliado con las tácticas canónicas por nivel + nota de **mezcla de niveles** + el CTA SIEMPRE existe (cambia la agresividad, no si "se vende").
- ✅ `reel-html-builder` (y la entrega de neurocopy ads-master/viral-reels): **estructura HTML OBLIGATORIA** con badge de NIVEL DE CONSCIENCIA + título + dibujo del formato + 6 ganchos + GUION palabra por palabra + overlays + CTA exacto.
- ✅ Nuevo formato #25: **cajetilla de pregunta de Instagram**.

#### Stats actuales
- **32 agentes** (Bloque F ahora con 6: formato-master + consciencia-master + reel-html-builder + reel + carrusel + hilo)
- **22 commands** · **53 knowledge files** · **70+ formatos + banco ZENITH**
- Counts sincronizados en README · INSTALL · SKILL · plugin.json (v1.8.0) · SVG.

---

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
- **22 commands** (añade `/audience-reel-html`)
- **51 knowledge files** (+ banco de formatos ZENITH)
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
