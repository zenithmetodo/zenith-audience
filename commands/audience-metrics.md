---
name: audience-metrics
description: Lee métricas vía Metricool MCP (Free · 1 marca · IG+TT+YT+FB+Pinterest+Threads+Bluesky) y aplica sistema de decisión REPLICAR/ITERAR/GUARDAR/APRENDER/DESCARTAR por cada vídeo. Si NO tienes Metricool · modo manual disponible (pegas screenshot/CSV/texto).
---

# /audience-metrics ⭐

Análisis de métricas + sistema de decisión automático.

## Requisito previo (recomendado)

Metricool MCP configurado:
```bash
claude mcp add --transport http metricool https://ai.metricool.com/mcp
```

Setup completo: [METRICOOL_SETUP.md](../METRICOOL_SETUP.md)

## Modo manual (si NO tienes Metricool)

Puedes pasarme directamente:

1. **Screenshot** de IG Insights · TT Analytics · YT Studio (por reel)
2. **CSV exportado** desde la app nativa
3. **Texto plano** con: título · views · likes · comments · saves · shares · skip rate · watch time

Yo aplicaré el sistema de decisión igualmente.

**NOTA:** sin Metricool no podré comparar contra tus competidores ni dar best time. Para eso → configura Metricool.

### Si no conozco tu media histórica

Te pregunto 3 datos rápidos:
- ¿Views medias de tus reels últimos 30 días?
- ¿Engagement medio aproximado (%)?
- ¿Skip rate medio si lo conoces?

Con eso aplico el sistema de decisión por multiplicador (>3x media · 2-3x · etc.).

## Lo que hago

Invoco `metrics-analyst` que ejecuta:

1. **Lee tus 3 métricas** (pulados · retención · interacciones) por cada vídeo
2. **Aplica sistema de decisión** (Clases 8-9):
   - 🚀 REPLICAR MASIVO (>3x media)
   - 🌟 ITERAR INMEDIATO (2-3x)
   - 🟢 GUARDAR + ANALIZAR (1.5-2x)
   - 🟡 APRENDER + DESCARTAR (cerca de media)
   - 🔴 DESCARTAR + NO REPETIR (<media)
3. **Compara con competidores** (top 5 · vía Metricool)
4. **Detecta patrones** ganadores / antipatrones
5. **Si detecta REPLICAR** · auto-invoca `/audience-iterar`

## Output

HTML estético con:
- Top 3 contenidos de la semana
- **Decisión por cada vídeo** (con acción específica)
- Análisis por plataforma
- Patrones detectados (lo que funciona / lo que no)
- Comparativa competidores
- TOP 3 acciones prioritarias para esta semana
- Alertas 🟢 🟡 🔴

## Tiempo
~1-2 min

## Coste
**Incluido en plan Claude (Pro $20 · Max $100 · Max $200).** Metricool Free: $0.

## Cuándo invocar

- **Viernes** (cierre semana)
- **Lunes** (validar trends + ajustar)
- **Mensualmente** (cierre estratégico)
- Cuando un vídeo destaca claramente (rápida revisión)

## Sin Metricool · qué pierdes

- Comparativa con competidores
- Best time automático
- Histórico 30 días sin pegar datos manualmente
- Auto-detección de virales

**Pero el sistema de decisión funciona igual** si me pasas las métricas.
