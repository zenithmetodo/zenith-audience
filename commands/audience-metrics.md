---
description: Lee métricas vía Metricool MCP (Free · 1 marca · IG+TT+YT+FB+Pinterest+Threads+Bluesky) · top posts · best time · competidores. Reporte completo HTML.
---

# /audience-metrics

Análisis de métricas vía Metricool MCP.

## Requisito previo

Metricool MCP configurado:
```bash
claude mcp add --transport http metricool https://ai.metricool.com/mcp
```

## Lo que hago

Invoco `metrics-analyst` que consulta vía MCP:
- Top posts (por engagement · alcance · saves · shares)
- Best time de publicación
- Retención reels/shorts
- Demografía audiencia
- 5 competidores comparativa
- Tendencias últimos 30 días

## Output

HTML estético con:
- Top 3 contenidos de la semana
- Análisis por plataforma
- Patrones detectados
- Comparativa competidores
- Recomendaciones para próxima semana
- Alertas (🟢 🟡 🔴)

## Tiempo
~1-2 min

## Coste
- Metricool Free: $0
- Análisis: ~$0.04
- **Incluido en plan Claude flat.** _Ref API: ~$0.04_

## Cuándo invocar
- Viernes (cierre semana)
- Lunes (validar trends + ajustar)
- Mensualmente (cierre estratégico)
