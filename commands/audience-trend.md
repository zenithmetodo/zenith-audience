---
description: Escanea trends activos multi-fuente · Google Trends + Reddit + YouTube + Apify (TT/IG). Detecta qué subiendo · qué cayendo · 10 ideas basadas en data fresca.
---

# /audience-trend

Escaneo completo de trends activos.

## Lo que hago

Invoco en paralelo:
- `trend-google` (pytrends · gratis)
- `trend-foros` (Reddit + YouTube API · gratis)
- `trend-redes` (Apify TT + IG · usa free $5/mes)

Combino los 3 outputs en reporte único.

## Output

Reporte HTML con:
- Trends en alza por plataforma
- Hashtags emergentes
- Hooks campeones de la semana
- 10 ideas basadas en data combinada

## Tiempo
~2 min

## Coste
**Incluido en plan Claude (Pro $20 · Max $100 · Max $200).**
_Referencia API pay-per-use: ~$0.55-0.80 (Apify es lo más caro)_

## Cuándo invocar
- 2x/semana (lunes + jueves)
- Antes de plan semanal
- Cuando detectas caída de views

## Siguiente paso

Usa las 10 ideas → invoca `/audience-headline-batch` o eliges 1 y vas a `/audience-reel`.
