---
description: Genera guion COMPLETO de reel 15-90s con FORMATO visual elegido + 4 GANCHOS óptimos (cada uno con verbal + textual) + análisis "por qué funcionará". Output HTML estético PDF-ready listo para grabar.
---

# /audience-reel ⭐

Guion completo de reel · todo en uno · con los 4 ganchos óptimos.

## Uso

```
/audience-reel "tu idea"
```

## Lo que hago

Invoco `reel-architect` que orquesta el pipeline completo:

1. **`asunto-detector`** valida la idea (5 criterios)
2. **`template-selector`** + **`template-aplicador`** eligen y aplican estructura (1 de las 12)
3. **`formato-master`** ⭐ recomienda formato visual (de 60+ · o genera nuevo si ninguno encaja) + entrega los 4 ganchos óptimos
4. **`gatillo-master`** aplica gatilhos stacking (2-3 de los 7)
5. **`notable-auditor`** audita contra 8 elementos + STEPPS

## Output

HTML estético PDF-ready en `output/reels/[fecha]-[título].html`:

- **Setup** (formato · template · gatillos · categorías · notable)
- **⭐ 4 ganchos óptimos** (cada uno con VERBAL + TEXTUAL + visual del primer frame + tipo psicológico + por qué es óptimo)
- **🏆 Recomendación de orden** para testing A/B/C/D secuencial
- **Cuerpo del reel** completo (timestamps segundo a segundo · VISUAL · AUDIO · OVERLAY · ICONO)
- **CTA final** palabra a palabra
- **Producción** (b-roll · música · iluminación · vestuario · tiempo grabación)
- **Distribución** (copy · hashtags · timing)
- **Plan A/B/C/D testing** (calendario de 10 días)
- **Análisis** · POR QUÉ funcionará + EN QUÉ se basa (knowledge files · clases · estudios)
- **Checklist final** antes de grabar

## Tiempo
~3-5 min

## Coste
**Incluido en plan Claude (Pro $20 · Max $100 · Max $200).**

## Cuándo invocar

- Para CADA reel que vas a grabar (3-5/semana)
- En batch de grabación (prepara varios juntos con `/audience-batch-day`)

## Cómo se usan los 4 ganchos en producción

1. Grabas el CUERPO del reel UNA sola vez
2. Grabas los 4 ganchos por separado (cambias solo primeros 3s)
3. Tiempo extra: ~15-20 min
4. En edición: combinas cada VERBAL con su TEXTUAL correspondiente
5. Tienes 4 versiones del mismo reel · listas para A/B/C/D testing
6. Publicas versión Gancho A · esperas 48h
7. Si <0.5x tu media → publicas versión Gancho B
8. Si >3x media → ITERAS esa versión con `/audience-iterar`

## Siguiente paso

Después de generar → valida con `/audience-audit [guion]` antes de grabar.
