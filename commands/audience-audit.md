---
name: audience-audit
description: PASO 5 · el gate de los 3 revisores independientes (VOZ · GRABABLE · CTA Y RECONOCIMIENTO), tres pases por separado de notable-auditor. Devuelve OK/FIX por pase + la corrección exacta de cada hallazgo. Con un FIX abierto no se entrega.
---

> 🔴 **OBLIGATORIO ANTES DE NADA:** lee `${CLAUDE_PLUGIN_ROOT}/knowledge/pipelines/01-metodo-obligatorio-del-reel.md` **ENTERO**. Esto es el **PASO 5** del método de 5 pasos. Si el **paso 4 (el maquetado)** no se le ha **ENSEÑADO** al usuario, **PARA y pídelo**; no se ejecuta fuera de orden.

# /audience-audit

**El gate del método.** No es un semáforo ni una nota: son tres revisores independientes y un veredicto binario por cada uno.

## Uso

```
/audience-audit "tu guion o copy"
```

## Lo que hago

**3 pases INDEPENDIENTES de `zenith-audience:notable-auditor`**, lanzados por separado y **sin que ninguno vea el trabajo del otro**:

1. **Pase 1 · VOZ** — regla §9 (prohibido negar la culpa), emojis, anglicismos, cuentas mentales, ganchos que gastan el remate, **números sin respaldo**.
2. **Pase 2 · GRABABLE** — ¿se graba mañana con el material que existe?, privacidad de cada captura, colisiones del dibujo, ¿cabe en la duración declarada?
3. **Pase 3 · CTA Y RECONOCIMIENTO** — las 6 piezas del CTA, triángulo de congruencia, ¿el síntoma se reconoce al instante?

Lo que devuelvan se arregla con `zenith-audience:notable-builder`.

## Output

Por cada pase, veredicto **binario** — nunca una nota:

```markdown
PASE 1 · VOZ ............... OK / FIX
PASE 2 · GRABABLE .......... OK / FIX
PASE 3 · CTA Y RECONOC. .... OK / FIX

Por cada FIX:
| Hallazgo (qué falla y dónde) | Corrección exacta (el texto/valor que va en su sitio) |
```

**Con un solo FIX abierto NO se entrega: se arregla con `zenith-audience:notable-builder` y se vuelve a pasar.**

## Tiempo
~2 min (son tres pases, no uno)

## Coste
**Incluido en plan Claude (Pro $20 · Max $100 · Max $200).**
_Referencia API pay-per-use: ~$0.03_

## Cuándo invocar
- **Siempre, como PASO 5**, antes de dar por entregado cualquier reel
- Otra vez después de cada `notable-builder` (hasta que los tres pases devuelvan OK)
- Para validar batch del mes
