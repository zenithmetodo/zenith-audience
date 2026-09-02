---
name: audience-reel
description: Genera guion COMPLETO de reel 15-90s con FORMATO visual elegido + 6 GANCHOS óptimos (cada uno con verbal + textual) + análisis "por qué funcionará". Output HTML estético PDF-ready listo para grabar.
---

> 🔴 **OBLIGATORIO ANTES DE NADA:** lee `${CLAUDE_PLUGIN_ROOT}/knowledge/pipelines/01-metodo-obligatorio-del-reel.md` **ENTERO**. Esto es el **PASO 3** del método de 5 pasos. Si el **paso 2 (el formato y su dibujo)** no se le ha **ENSEÑADO** al usuario, **PARA y pídelo**; no se ejecuta fuera de orden.

# /audience-reel ⭐

Guion completo de reel · todo en uno · con los 6 ganchos óptimos.

## Uso

```
/audience-reel "tu idea"
```

## Lo que hago

**Esto es el PASO 3 del método, no un atajo.** Antes de empezar compruebo que el usuario ya ha visto **la celda del cruce (paso 1)** y **los tres formatos compitiendo con EL DIBUJO del ganador (paso 2)**. Si falta cualquiera de las dos, **paro y las pido**.

Invoco `zenith-audience:reel-architect`, que orquesta SOLO el guion:

1. **`zenith-audience:asunto-detector`** valida la idea (5 criterios)
2. **`zenith-audience:template-selector`** + **`zenith-audience:template-aplicador`** eligen y aplican estructura (1 de las 12)
3. **El formato NO se vuelve a elegir:** llega hecho del paso 2 (formato ganador + dibujo componente a componente). Aquí solo se escribe encima
4. **`zenith-audience:gatillo-master`** aplica gatilhos stacking (2-3 de los 7)
5. **`zenith-audience:headline-3-tipos`** ayuda con los 6 ganchos (dice / ve / lee) + ficha técnica

**Lo que NO hago aquí:** ni maquetar (PASO 4 · `/audience-reel-html`) ni auditar (PASO 5 · `/audience-audit`, tres pases independientes).

## Output

El guion completo en markdown (el `.html` lo monta el PASO 4 con `/audience-reel-html`):

- **Setup** (formato · template · gatillos · categorías · notable)
- **⭐ 6 ganchos óptimos** (cada uno con VERBAL + TEXTUAL + visual del primer frame + tipo psicológico + por qué es óptimo)
- **🏆 Recomendación de orden** para testing A/B secuencial secuencial
- **Cuerpo del reel** completo (timestamps segundo a segundo · VISUAL · AUDIO · OVERLAY · ICONO)
- **CTA final** palabra a palabra
- **Producción** (b-roll · música · iluminación · vestuario · tiempo grabación)
- **Distribución** (copy · hashtags · timing)
- **Plan A/B testing secuencial** (calendario de 10 días)
- **Análisis** · POR QUÉ funcionará + EN QUÉ se basa (knowledge files · clases · estudios)
- **Checklist final** antes de grabar

## Tiempo
~3-5 min

## Coste
**Incluido en plan Claude (Pro $20 · Max $100 · Max $200).**

## Cuándo invocar

- Para CADA reel que vas a grabar (3-5/semana)
- En batch de grabación (prepara varios juntos con `/audience-batch-day`)

## Cómo se usan los 6 ganchos en producción

1. Grabas el CUERPO del reel UNA sola vez
2. Grabas los 6 ganchos por separado (cambias solo primeros 3s)
3. Tiempo extra: ~15-20 min
4. En edición: combinas cada VERBAL con su TEXTUAL correspondiente
5. Tienes 6 versiones del mismo reel · listas para A/B testing secuencial
6. Publicas versión Gancho A · esperas 48h
7. Si <0.5x tu media → publicas versión Gancho B
8. Si >3x media → ITERAS esa versión con `/audience-iterar`

## Siguiente paso

**PASO 4 · `/audience-reel-html`** → el `REEL.html` editable con el dibujo dentro + el `GUION.md` legible.
Y después **PASO 5 · `/audience-audit`** → el gate de los tres revisores. Con un solo FIX abierto no se entrega.
