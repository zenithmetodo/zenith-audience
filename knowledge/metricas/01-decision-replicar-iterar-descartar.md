# Sistema de Decisión · REPLICAR / ITERAR / DESCARTAR

> Qué hacer con cada vídeo según sus métricas. Algoritmo de decisión claro.

---

## La premisa

> No todos los vídeos merecen el mismo trato.
> Algunos son ORO (replicar masivo).
> Algunos son APRENDIZAJE (iterar mejora).
> Algunos son BASURA (descartar · pasar al siguiente).

Saber CUÁL es cuál = la diferencia entre creator average y creator viral consistente.

---

## El sistema de decisión

### Input · las 3 métricas + tu media histórica

```
TUS PROMEDIOS HISTÓRICOS (últimos 30 días)
- Skip rate medio: X%
- Retención media: Y%
- Engagement medio: Z%

VS

ESTE VÍDEO
- Skip rate: A%
- Retención: B%
- Engagement: C%
```

### Output · una de 5 decisiones

1. **🚀 REPLICAR MASIVO** (>3x media)
2. **🌟 ITERAR INMEDIATO** (2-3x media)
3. **🟢 GUARDAR + ANALIZAR** (1.5-2x media)
4. **🟡 APRENDER + DESCARTAR** (cerca de media)
5. **🔴 DESCARTAR + NO REPETIR** (<media)

---

## DECISIÓN 1 · 🚀 REPLICAR MASIVO

### Cuándo
- Engagement >3x tu media histórica
- Y al menos 2 de las 3 métricas en zona "viral"

### Qué hacer
1. **Inmediatamente** invoca `/audience-iterar [post-url]`
2. Genera 10 variantes (diferentes ángulos · gatillos · templates)
3. Publica 2-3 variantes esa misma semana
4. Distribuye resto durante el mes
5. Documenta los patrones que viralizaron en `/audience-engenharia`

### Por qué CRÍTICO
- Los algoritmos detectan "creador viral" cuando publicas múltiples virales en serie
- 1 viral aislado = boost temporal
- Serie de virales = nuevo umbral de audiencia permanente

### Ejemplo
- Vídeo X: 500K views vs tu media 50K
- Acción: 10 variantes · publicar 3 esta semana
- Resultado típico: 3-5 de las 10 variantes también viralizan → seguidores 5-10x

---

## DECISIÓN 2 · 🌟 ITERAR INMEDIATO

### Cuándo
- Engagement 2-3x tu media
- Skip rate <50% PERO retención <40%
- Algo funciona · algo no

### Qué hacer
1. Identifica QUÉ funcionó (hook · estructura · gatillo)
2. Identifica QUÉ falló (drop en segundo X · CTA débil · etc.)
3. Reescribe la parte débil
4. Re-publica como "versión 2" (legal en TT/IG después de 48h)

### Por qué importa
Un vídeo a medio camino = oportunidad clara de mejora · NO descartar prematuro.

### Ejemplo
- Vídeo Y: 150K views (3x tu media) · pero retención 22%
- Diagnóstico: hook fue genial · pero perdiste audiencia en segundo 15
- Acción: rehacer SOLO el segundo 15-25 con stacking de curiosidad
- Re-publicar día 4 con mismo hook

---

## DECISIÓN 3 · 🟢 GUARDAR + ANALIZAR

### Cuándo
- Engagement 1.5-2x tu media
- Saves y shares por encima de tu promedio
- Pero NO es viral masivo

### Qué hacer
1. Guardar en banco de "ideas validadas"
2. Esperar 1-2 semanas (a veces escala tarde)
3. Si sube → escalar (decisión 1 o 2)
4. Si no sube → analizar patrón para próximos vídeos

### Por qué
- Algunos vídeos crecen LENTO pero firme (slow burn)
- Especialmente contenido evergreen (no trend)
- Pueden estar acumulando saves durante semanas

---

## DECISIÓN 4 · 🟡 APRENDER + DESCARTAR

### Cuándo
- Métricas cerca de tu media (±20%)
- Ni gana ni pierde
- Average completo

### Qué hacer
1. Analiza qué pasó (rápido · 5 min)
2. Documenta lección en notas
3. NO repitas el mismo formato
4. Sigue adelante · próxima idea

### Por qué importa
- Insistir en formato average = quemar audiencia
- Aprender + soltar = libertad mental
- Cada vídeo average enseña algo

---

## DECISIÓN 5 · 🔴 DESCARTAR + NO REPETIR

### Cuándo
- Métricas peores que tu media histórica
- Skip rate >65%
- Engagement <3%

### Qué hacer
1. **NO intentar revivirlo** (es perder tiempo)
2. Identifica QUÉ falló específicamente:
   - ¿Hook genérico?
   - ¿Tema no conecta con avatar?
   - ¿Estructura mal?
3. Anota "evitar [patrón]" para futuros vídeos
4. PASAR a la siguiente idea

### Por qué crítico
- Insistir en vídeos que fallan = quemar tiempo + energía
- El feed es brutal: si no pasó la ronda inicial, no pasará nunca
- Acepta · aprende · sigue

---

## Frecuencia de revisión

### Diaria (1 min)
- Solo vídeos del día anterior
- Revisa rápido si alguno destaca
- Si >2x media → marca para revisión profunda

### Semanal (15 min)
- Vídeos de la semana
- Aplica el sistema de decisión a cada uno
- Acciones:
  - Top 1-2: iterar inmediato
  - Top 3-5: guardar + analizar
  - Resto: aprender + descartar

### Mensual (1h)
- Vídeos del mes completo
- Identifica patrones (formatos · gatillos · temas que ganan)
- Ajusta `template-rotation-planner` para próximo mes

---

## La tabla maestra de decisión

| Engagement vs media | Skip rate | Retención | DECISIÓN |
|---|---|---|---|
| >3x | <40% | >40% | 🚀 REPLICAR MASIVO |
| >3x | <50% | >30% | 🚀 REPLICAR MASIVO |
| 2-3x | <50% | >30% | 🌟 ITERAR INMEDIATO |
| 2-3x | 50-60% | 20-30% | 🌟 ITERAR INMEDIATO |
| 1.5-2x | cualquiera | >25% | 🟢 GUARDAR + ANALIZAR |
| 0.8-1.5x | cualquiera | cualquiera | 🟡 APRENDER + DESCARTAR |
| <0.8x | >65% | <20% | 🔴 DESCARTAR + NO REPETIR |

---

## El error #1 que cometen los creadores

> Dejar el viral SIN ITERAR.
>
> Encuentran fórmula ganadora → publican 1 viral → no iteran → audiencia se estanca.

**Regla:** TODO viral genera mínimo 5-10 variantes en las próximas 2 semanas.

---

## El error #2 que cometen los creadores

> Insistir con vídeos fallidos.
>
> "Tal vez si lo mejoro un poco..."  → invierten 5h en algo que nunca despegará.

**Regla:** si pasaron 72h y métricas <0.5x tu media → DESCARTAR · pasar a siguiente.

---

## Cómo este sistema se integra con los agentes

- **`metrics-analyst`** lee Metricool MCP · aplica este sistema · te dice cuál decisión
- **`iteracion-ganador`** ejecuta DECISIÓN 1 (10 variantes)
- **`engenharia-reversa`** ejecuta DECISIÓN 1/2 (análisis profundo)
- **`asuntos-generator`** alimenta tu próxima ronda con ideas validadas

---

## Atribución
Sistema de decisión basado en métricas del Método Audience (Clases 8-9) · Elias Mamã. Algoritmo operativo de Joseph Moreno · Zenith.
