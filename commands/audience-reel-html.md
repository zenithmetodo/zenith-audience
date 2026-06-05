---
name: audience-reel-html
description: 🎬 Maqueta el reel TERMINADO en HTML estético (documento-guion Zenith con EL DIBUJO del formato + 6 ganchos-hook + cuerpo palabra por palabra + overlays + CTA) + un GUION.md legible. Si el formato es clasificatorio, genera además la herramienta interactiva drag-and-drop con la mascota Zenón de cursor. Invoca al agente `reel-html-builder`. Úsalo DESPUÉS de tener el formato elegido (formato-master) y el guion.
---

# /audience-reel-html 🎬

Convierte un reel ya pensado en algo **listo para grabar**: el `.html` bonito + el `.md` legible.

## Uso
```
/audience-reel-html "tema + formato elegido (+ ganchos/cuerpo si los tienes)"
```

## Diferencia con /audience-formato
- **`/audience-formato`** → `formato-master`: QUÉ formato (de 70+ / banco Zenith / inventa fuera de la caja) + ideas de ganchos.
- **`/audience-reel-html`** → `reel-html-builder`: CÓMO se presenta el reel terminado (el HTML doc-guion + el GUION.md legible + la herramienta interactiva si aplica).

## Lo que entrega
1. `🎯 [NOMBRE]-FORMATO.html` — documento-guion (plantilla Zenith + EL DIBUJO del formato en HTML/SVG + 6 ganchos + ⭐ CUERPO palabra por palabra + overlays + CTA + @media print).
2. `GUION.md` — versión legible en texto plano.
3. (opcional) `🎮 [NOMBRE]-INTERACTIVO.html` — drag-and-drop con Zenón de cursor, para clasificatorios (tier list, titular/suplente…).

## Reglas
- Ganchos = HOOKS (nunca CTA). Call-out al entrenador repartido audio/textual. "Comenta LIGA" solo en CTA + último beat.
- Voz Zenith (psicología del no, analogías humanas, CTA pequeño + liga del 1%).
- "DI →" embebido en el dibujo si es lista/escalera/ranking/tier.
- Verifica: 1 sola `</html>`, print-color-adjust, sección CUERPO, 0 "comenta" en ganchos.

## Coste
Incluido en plan Claude. Referencia API: ~$0.08-0.15 por reel.
