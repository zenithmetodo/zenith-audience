---
description: Audita un guion o contenido contra los 8 elementos notable + 5 criterios virales + STEPPS Berger. Devuelve score 0-100 + recomendaciones. Filtro de calidad antes de publicar.
---

# /audience-audit

Auditoría completa antes de publicar.

## Uso

```
/audience-audit "tu guion o copy"
```

## Lo que hago

Invoco:
1. `notable-auditor` (8 elementos + STEPPS)
2. `asunto-detector` (5 criterios viralidad)

Combino ambos scores.

## Output

```markdown
SCORE GLOBAL: X/100

- ¿Pasa 5 criterios virales?
- ¿Cuántos elementos notable integra?
- ¿STEPPS activados?
- Recomendaciones:
  - ✅ Publica
  - ⚠️ Mejora antes
  - 🔴 Reescribe
  - ❌ No publicar
```

## Tiempo
~30 segundos

## Coste
**Incluido en plan Claude (Pro $20 · Max $100 · Max $200).**
_Referencia API pay-per-use: ~$0.03_

## Cuándo invocar
- ANTES de cada publicación (filtro de calidad)
- Después de notable-builder
- Para validar batch del mes
