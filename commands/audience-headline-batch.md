---
name: audience-headline-batch
description: Genera el BATCH MENSUAL de 30-50 headlines del mes en una sesión única. Cada uno con 3 tipos (verbal · visual · audio) + template viral + gatillos asignados + día programado. Para llenar el banco de contenido del mes.
---

# /audience-headline-batch

Batch mensual de headlines · 30-50 en una sola sesión.

## Uso

```
/audience-headline-batch
```

## Lo que hago

Invoco `plan-headlines-mes` que:

1. Define temática del mes (con `trend-google` · `trend-redes` · `trend-foros` opcional)
2. Identifica 3-5 sub-temas dentro de la temática
3. Genera 30-50 ideas concretas
4. Valida cada una contra los 5 criterios (vía `asunto-detector`)
5. Para cada idea validada · genera 3 headlines (verbal + visual + audio)
6. Asigna template viral de los 12 (rotando para no repetir)
7. Asigna día y hora del mes programado

## Output

HTML estético en `output/headlines-batch/[mes].html`:
- Calendario completo del mes (semana por semana)
- Cada día con: idea · headlines · template · gatillos · score · notas
- Resumen estadístico (distribución por template · gatillo · formato)
- Notas para día de grabación batch

## Tiempo
~5-10 min (sesión profunda)

## Coste
**Incluido en plan Claude (Pro $20 · Max $100 · Max $200).**

## Cuándo invocar

- Día 1 de cada mes (rutina mensual)
- Al lanzar nueva temporada/serie
- Cuando se acaba el banco anterior

## Beneficios

- Ahorras 30-60 min por publicación diaria del mes
- Calidad consistente (todos pasan filtro de 5 criterios)
- Permite grabación batch (1 día = 2 semanas de contenido)
- Estrategia clara mensual

## Siguiente paso

Después del batch → invoca `/audience-batch-day` para preparar la grabación de 5-10 reels juntos.
