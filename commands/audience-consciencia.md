---
name: audience-consciencia
description: 🧠 Diagnostica el NIVEL DE CONSCIENCIA (Schwartz · BAJO 1-2 / MEDIO 3-4 / ALTO 5) de una idea o reel y dicta QUÉ conecta en ese nivel (síntomas/creencias · mecanismo/comparaciones CON-vs-SIN · romper objeciones/prueba social), qué formatos encajan y cómo se mezclan los niveles. Invoca al agente consciencia-master. El CTA lo diriges TÚ (no depende del nivel).
---

# /audience-consciencia 🧠

Diagnostica a qué **nivel de consciencia** está tu idea/avatar y qué conecta ahí, para que el reel lleve su badge de nivel y el cuerpo coherente.

## Uso

```
/audience-consciencia "tu idea o el tema del reel"
```

## Lo que hago

Cargo y ejecuto el agente **`consciencia-master`** (`agents/32-consciencia-master.md`), que SIEMPRE lee antes:
1. `${CLAUDE_PLUGIN_ROOT}/knowledge/formatos-reels/08-niveles-consciencia.md` — el mapeo completo.
2. `${CLAUDE_PLUGIN_ROOT}/knowledge/formatos-reels/10-formatos-zenith-html.md` — qué formato encaja en cada nivel.
3. `MEMORIA ARCHIVOS MD/avatar-cliente-ideal.md` + `tono-y-comunicacion.md` (si existen).

## Output

1. **Nivel diagnosticado** (BAJO / MEDIO / ALTO + número 1-5) y por qué (dónde está el avatar respecto al problema y a la oferta).
2. **Qué conecta ahí** en 2-3 bullets accionables:
   - 🔵 **BAJO (1-2):** síntomas · creencias erróneas · dolor universal · rotura de patrón · "no hagas esto / haz esto".
   - 🟡 **MEDIO (3-4):** el mecanismo + TODAS las comparaciones (sobre todo **CON vs SIN**, vieja/nueva forma, tú vs competencia) · demostración · prueba social. **Aquí cabe muchísimo.**
   - 🔴 **ALTO (5):** romper objeciones (precio/tiempo/miedo) · prueba social definitiva · mecanismo para tumbar la objeción (también con formatos, ej. ranking de excusas).
3. **2-3 formatos** del banco que encajan en ese nivel.
4. **Cómo se MEZCLAN** los niveles en ese reel (ej. abre en BAJO → cierra en MEDIO) y qué badge poner (`BAJO → MEDIO`, `MEDIO-ALTO`…).
5. (Si lo pides) la **misma idea lateralizada** a los otros niveles, para el plan semanal.

> ⚠️ El **CTA NO depende del nivel** — lo diriges TÚ en cada reel. El nivel solo manda el **hook y el cuerpo**. Y **cualquier formato sirve en cualquier nivel**.

## Cuándo invocar

- Antes de escribir un reel, para fijar el nivel y qué conecta.
- Para adaptar una misma idea a varios niveles (rotación del plan semanal).
- Para auditar que un guion ya escrito encaja con su nivel.

## Siguiente paso

Con el nivel claro → `/audience-formato [tema]` (formato + 6 ganchos) y luego `/audience-reel-html` para maquetar con el **badge de NIVEL DE CONSCIENCIA**.

## Atribución

Niveles de consciencia: Eugene Schwartz · *Breakthrough Advertising*. Tácticas por nivel de `neurocopy-ads-master` (Joseph Moreno). Zenith Audience · 2026.
