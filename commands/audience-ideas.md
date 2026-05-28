---
description: Genera 15-20 ideas de contenido para HOY en MIX MULTI-FUENTE · 6-7 de competidores ya validados (Apify) + 6-7 generadas por IA según tu núcleo + 3-4 trending del momento + 2 contraintuitivas. Cada idea con respaldo de POR QUÉ funcionará. Rutina diaria AM.
---

# /audience-ideas ⭐

15-20 ideas frescas multi-fuente para hoy.

## Lo que hago

Invoco `asuntos-generator` con pipeline:

1. **Apify scraping** (3-5 competidores tuyos · top posts validados)
2. **Trends multi-fuente** (Google Trends · Reddit · YT · TT/IG vía Apify)
3. **IA generativa** Opus 4.7 (cruza avatar × 6 categorías × gap detectado)
4. **Scoring + ranking** (cada idea pasa filtro de 5 criterios)

## Distribución estándar de las 15-20 ideas

```
🔥 BLOQUE A · 6-7 ideas de COMPETIDORES validados
   (con métricas reales como respaldo)

🧠 BLOQUE B · 6-7 ideas generadas por IA
   (gaps detectados · únicos · adaptados a tu núcleo)

📈 BLOQUE C · 3-4 ideas TRENDING del momento
   (window oportunidad <72h · publica YA)

⚡ BLOQUE D · 2 ideas CONTRAINTUITIVAS
   (alto riesgo · alta recompensa)
```

## Output

```
Por cada idea:
- Título adaptado a tu núcleo
- Inspiración (si viene de competidor: link + métricas)
- Por qué funcionará (lógica psicológica)
- Template viral recomendado (de los 12)
- Gatillos dominantes (de los 7)
- Categorías virales tocadas (de las 6)
- Score 0-10
- Notas adicionales (b-roll · CTA · diferenciación)

+ TOP 5 RECOMENDADAS para hoy con razones
+ Cómo proceder (siguiente comando a usar)
```

## Tiempo
~1-2 min (más si configurado Apify · scraping es lo más lento)

## Coste
- Incluido en tu plan Claude (Pro/Max)
- Apify scraping: ~$0.30 (dentro de Free $5/mes)

## Cuándo invocar
- DIARIO AM (rutina)
- Cuando bloqueado creativamente
- Antes de batch mensual
- Para nutrir el banco de ideas semanal

## Siguiente paso recomendado

Eliges 1 idea del top 5 → invoca `/audience-reel`, `/audience-carrusel` o `/audience-hilo`.

## Setup recomendado

Para activar BLOQUE A (competidores) · configura Apify:
```bash
claude mcp add --transport http apify https://mcp.apify.com \
  --header "Authorization=Bearer YOUR_TOKEN"
```

Sin Apify · funciona pero solo con BLOQUES B + C + D (gratis · sin scraping).
