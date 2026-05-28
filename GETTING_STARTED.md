# Getting Started · Zenith Audience™

> Tu primera semana paso a paso · de instalación a primer viral.

---

## 🎯 La promesa

En 7 días tendrás:
- Núcleo de influencia definido
- Banco de 50+ ideas validadas
- 5-7 vídeos grabados y publicados
- Sistema de métricas funcionando
- Workflow diario establecido

---

## DÍA 1 · Setup técnico (1h)

### Mañana (30 min)
1. **Instalar el plugin**
   ```bash
   curl -fsSL https://raw.githubusercontent.com/zenithmetodo/zenith-audience/main/install.sh | bash
   ```

2. **Configurar Metricool MCP** (gratis)
   - Crear cuenta en https://metricool.com (plan Free)
   - Conectar tus IG/TT/YT
   ```bash
   claude mcp add --transport http metricool https://ai.metricool.com/mcp
   ```

3. **(Opcional) Configurar Apify MCP** (Free $5/mes)
   - Crear cuenta en https://apify.com
   - Obtener token
   ```bash
   claude mcp add --transport http apify https://mcp.apify.com \
     --header "Authorization=Bearer YOUR_TOKEN"
   ```

### Tarde (30 min)
4. **APIs gratis adicionales** (para trends)
   - Reddit app → `.env`
   - YouTube API key → `.env`
   - Detalles en `INSTALL.md`

5. **Verificar funcionamiento**
   ```bash
   /audience-ideas
   ```
   Si recibes 20 ideas → todo OK.

---

## DÍA 2 · Núcleo de Influencia (2-3h · sesión guiada)

> El paso MÁS IMPORTANTE. Sin esto · todo el contenido será genérico.

### Sesión bloqueada · sin interrupciones
```bash
/audience-setup
```

El agente `nucleo-architect` te guía las 10 preguntas:
1. ¿Quién eres tú?
2. ¿Tu historia de creación?
3. ¿A quién ayudas?
4. ¿Qué dolor resuelves?
5. ¿Para dónde los llevas?
6. ¿Quién es tu enemigo?
7. ¿Qué creencias defiendes?
8. ¿Cuáles son tus pruebas?
9. ¿Tus bordones · lenguaje propio?
10. ¿Tu verdadero yo?

### Output
- Documento maestro en `output/nucleo/[tu-nombre]-nucleo.md`
- HTML estético imprimible
- Frase maestra: "Yo soy [TÚ]. Ayudo a [AVATAR] a [PROMESA]."

### Tip
- No tienes que tener las respuestas perfectas hoy
- Empieza imperfecto · refinarás con producción
- Si te bloqueas en una pregunta · salta · vuelve después

---

## DÍA 3 · Investigación · Spy + Trends (2h)

### Paso 1 · Identifica 3-5 competidores top de tu nicho
- Cuentas con 50K-1M seguidores
- Tu mismo avatar/temática
- Activos esta semana

### Paso 2 · Spy de cada competidor
```bash
/audience-spy @competidor_1
/audience-spy @competidor_2
/audience-spy @competidor_3
```

Cada spy te devuelve:
- Top 5 contenidos
- Gatillos · estructuras dominantes
- **GAPS NO EXPLOTADOS** (oportunidades para ti)

### Paso 3 · Trends activos
```bash
/audience-trend
```

Recibirás trends de:
- Google Trends (búsquedas)
- Reddit (debates calientes)
- YouTube (shorts trending)
- TikTok/IG (vía Apify si configurado)

### Output
Tienes ya **mapa de tu nicho completo:**
- Qué hacen los top
- Dónde están los gaps
- Qué está caliente esta semana

---

## DÍA 4 · Batch mensual de headlines (3h)

### Generar 30-50 headlines del mes
```bash
/audience-headline-batch
```

El agente `plan-headlines-mes` genera:
- Temática mensual definida
- 3-5 sub-temas
- 30-50 headlines totales (cada uno con 3 tipos: verbal + visual + audio)
- Calendario asignado día a día
- Rotación de los 12 templates virales

### Output
HTML con calendario mes completo · listo para grabar.

**Beneficio:** las próximas 4 semanas NO piensas headline · solo grabas.

---

## DÍA 5 · Primer día de grabación (4h)

### Paso 1 · Plan del día
```bash
/audience-batch-day
```

El agente `batch-content-day` organiza:
- Orden óptimo (vestuario · locación · energía)
- B-roll necesario
- Música/sonidos
- Iluminación · vestuario

### Paso 2 · Graba 5-8 reels + 1-2 carruseles

- Sigue el plan al pie de la letra
- Lee los guiones HTML antes de cada take
- Múltiples tomas (mínimo 3 por reel)

### Paso 3 · Edita esta noche
- Cortes cada 2-4s
- Subtítulos siempre
- Música cuando aplica

---

## DÍA 6 · Publica + Audita

### Mañana · auditoría final
```bash
/audience-audit "[copy del primer vídeo]"
```

El agente `notable-auditor` verifica:
- Los 8 elementos notable
- STEPPS Berger
- Score 0-100

### Si pasa el filtro → publica
### Si no → ajusta antes

### Distribuye los vídeos a lo largo de la semana
- Lunes: vídeo 1
- Martes: vídeo 2
- etc.

---

## DÍA 7 · Primera revisión semanal

### Métricas (15 min)
```bash
/audience-metrics
```

El agente `metrics-analyst` ejecuta:
- Lee tus 3 métricas (pulados · retención · interacciones)
- Aplica sistema de decisión
- Te dice qué hacer con cada vídeo:
  - 🚀 REPLICAR MASIVO
  - 🌟 ITERAR INMEDIATO
  - 🟢 GUARDAR + ANALIZAR
  - 🟡 APRENDER + DESCARTAR
  - 🔴 DESCARTAR

### Si alguno destacó
```bash
/audience-iterar [url del viral]
```
→ 10 variantes generadas · publica 2-3 esta semana

### Planifica próxima semana
```bash
/audience-plan-semana
```

---

## RUTINAS POST-DÍA 7 (workflow diario establecido)

### 🌅 Rutina diaria AM (10 min)
```bash
07:00 → /audience-ideas              # 15-20 ideas (Apify + IA + trends)
07:05 → /audience-reel [idea elegida] # Guion completo HTML
07:08 → /audience-audit [guion]       # Checklist final
07:10 → Grabas y publicas
```

### 📅 Rutina semanal
| Día | Acción | Tiempo |
|---|---|---|
| **Lunes** | `/audience-trend` (validar trends) | 10 min |
| **Mar-Jue** | 3 reels (rutina diaria AM) | 30 min/día |
| **Viernes** | `/audience-metrics` + iterar ganadores | 20 min |
| **Sábado** | `/audience-spy @competidor-top` | 15 min |
| **Domingo** | `/audience-plan-semana` siguiente | 20 min |

### 📆 Rutina mensual
- Día 1: `/audience-headline-batch` (banco mensual)
- Día 15: `/audience-batch-day` (grabación batch)
- Día 30: `/audience-engenharia [top-3-virales-del-mes]`

---

## CÓMO FUNCIONAN LOS 9 BLOQUES DE AGENTES

### 🔍 BLOQUE A · Investigación (6 agentes)
**Qué hace:** detecta qué funciona en tu nicho · qué está trending · qué adaptar.

| Agente | Función |
|---|---|
| `spy-competidor` | Disecciona perfiles top · gaps no explotados |
| `trend-google` | Búsquedas en alza (gratis · pytrends) |
| `trend-redes` | Trends TT/IG vía Apify |
| `trend-foros` | Reddit + YT debates calientes |
| `engenharia-reversa` | Disecciona virales · receta replicable |
| `ideas-ganadoras-adapter` ⭐ | Multi-fuente · adapta virales a TU núcleo |

**Cuándo usar:** lunes (trends) · sábados (spy) · cuando ves un viral interesante.

---

### 🧬 BLOQUE B · Núcleo Influencia (5 agentes · ONE-SHOT)
**Qué hace:** define QUIÉN ERES como creador (la base de TODO).

| Agente | Función |
|---|---|
| `nucleo-architect` | Orquesta las 10 preguntas |
| `enemigo-namer` | Define enemigo común |
| `dor-promesa-builder` | Palabra simbólica · promesa |
| `crencas-pruebas` | Creencias + colete antibalas |
| `bordones-creator` | Bordones · lenguaje único |

**Cuándo usar:** UNA VEZ al inicio (día 2) · refresh anual o al pivotar.

---

### 💡 BLOQUE C · Asuntos Virales (3 agentes)
**Qué hace:** genera ideas validadas · evita el bloqueo creativo.

| Agente | Función |
|---|---|
| `asuntos-generator` ⭐ | 15-20 ideas diarias multi-fuente |
| `asunto-detector` | Valida idea contra 5 criterios |
| `pesquisa-magnetica` | Investigación profunda mensual |

**Cuándo usar:** DIARIO (asuntos-generator AM · asunto-detector antes de grabar).

---

### 🎣 BLOQUE D · Gatillos y Headlines (3 agentes)
**Qué hace:** aplica los 7 gatillos · genera los 3 tipos de headline.

| Agente | Función |
|---|---|
| `gatillo-master` | Aplica los 7 gatillos + stacking |
| `headline-3-tipos` | Verbal + visual + audio |
| `plan-headlines-mes` | Batch 30-50 headlines mensual |

**Cuándo usar:** antes de cada grabación · mensualmente (batch).

---

### 📐 BLOQUE E · 12 Estructuras Virales (3 agentes)
**Qué hace:** elige y aplica la estructura óptima de las 12.

| Agente | Función |
|---|---|
| `template-selector` | Recomienda cuál usar |
| `template-aplicador` | Aplica fórmula literal |
| `template-rotation-planner` | Rotación 12 templates (1.5 meses sin repetir) |

**Cuándo usar:** en cada reel · al planificar el mes.

---

### 🎬 BLOQUE F · Creación de Contenido (3 agentes)
**Qué hace:** guion completo del vídeo · listo para grabar.

| Agente | Función |
|---|---|
| `reel-architect` | Reel 15-60s · guion HTML |
| `carrusel-architect` | Carrusel 8-10 slides · HTML |
| `hilo-architect` | Thread X/IG/LinkedIn |

**Cuándo usar:** 3-5 veces/semana (1 por contenido).

---

### 🎨 BLOQUE G · Contenido Notable (2 agentes)
**Qué hace:** audita y mejora contenido para ser memorable.

| Agente | Función |
|---|---|
| `notable-auditor` | Score 0-100 · 8 elementos + Berger |
| `notable-builder` | Sugiere qué añadir para hacerlo notable |

**Cuándo usar:** ANTES de publicar (auditor) · al mejorar guion débil (builder).

---

### 📊 BLOQUE H · Métricas (2 agentes)
**Qué hace:** lee métricas · decide qué replicar o descartar.

| Agente | Función |
|---|---|
| `metrics-analyst` ⭐ | Lee Metricool · sistema decisión |
| `iteracion-ganador` | 10 variantes de viral |

**Cuándo usar:** viernes (cierre) · al detectar viral propio.

---

### 🗓️ BLOQUE I · Planificación (2 agentes)
**Qué hace:** organiza tu semana y día de grabación.

| Agente | Función |
|---|---|
| `plan-semana` | Calendario 7 días |
| `batch-content-day` | Plan día de grabación batch |

**Cuándo usar:** domingo (plan semana) · antes de batch (batch-day).

---

## TIPS PARA MAXIMIZAR EL PLUGIN

### Tip 1 · No saltes el núcleo
El día 2 es crítico. Sin núcleo definido · TODO el contenido será genérico.

### Tip 2 · Métricas semanal · sin excepción
Sin métricas = quemas energía en formatos que no funcionan.
Con métricas = creces 3-5x más rápido (sabes qué replicar).

### Tip 3 · Itera tus virales SIEMPRE
El error más común: 1 viral aislado · no se itera · pierdes la oportunidad.
TODO viral genera mínimo 5-10 variantes en las próximas 2 semanas.

### Tip 4 · Usa Apify Free $5/mes
Para 3-5 spy/mes · suficiente. No es coste recurrente (dentro del Free).

### Tip 5 · Adapta · NUNCA copies
`/audience-adaptar` es tu mejor amigo · adapta virales ajenos a TU núcleo.
Copia literal = mata tu Verdadero Yo.

---

## COSTE TOTAL

Si usas **plan Claude Pro ($20/mes)** o **Max ($100-200/mes)** · TODO el uso del plugin está incluido.

- ✅ No hay coste por uso (ya está en tu plan flat)
- ✅ Metricool Free: $0
- ✅ Apify Free: $0 (dentro del $5/mes credit)
- ✅ Whisper local: $0
- ✅ APIs gratis (Reddit · YouTube · pytrends): $0

**Solo pagas tu plan Claude habitual.**

---

## TROUBLESHOOTING

### "No tengo competidores claros del nicho"
- Usa `/audience-trend` para descubrir creadores trending
- Pide al agente `pesquisa-magnetica` que mapee tu nicho

### "Mis ideas suenan genéricas"
- Falta núcleo de influencia profundo · vuelve al día 2
- Refuerza `enemigo-namer` y `bordones-creator`

### "Skip rate alto en mis vídeos"
- Hook débil · usa `gatillo-master` para reforzar
- Aplica stacking de 2-3 gatillos en primeros 3s

### "Retención cae a mitad del vídeo"
- Falta stacking de curiosidad
- Aplica open loops cada 5-10s
- Pacing más rápido (cortes 2-3s)

### "Engagement bajo aunque watch time alto"
- Falta notable · usa `notable-builder`
- CTA débil · más específico
- Falta polarización · opinión más fuerte

---

## RECURSOS

- [README.md](README.md) · overview del plugin
- [INSTALL.md](INSTALL.md) · instalación detallada
- [METRICOOL_SETUP.md](METRICOOL_SETUP.md) · setup métricas
- [APIFY_SETUP.md](APIFY_SETUP.md) · setup research
- [WHISPER_SETUP.md](WHISPER_SETUP.md) · setup transcripción
- [EXTERNAL_SERVICES.md](EXTERNAL_SERVICES.md) · todos los servicios externos

---

## La promesa final

Si sigues este workflow durante 30 días:
- Tendrás 20-30 vídeos publicados
- Sabrás cuáles funcionan y por qué
- Habrás iterado mínimo 3-5 virales propios
- Tu audiencia habrá crecido (5-10x si haces todo bien)
- Tu sistema operativo estará rodando · sin friction

**No es magia. Es SISTEMA.** 🚀
