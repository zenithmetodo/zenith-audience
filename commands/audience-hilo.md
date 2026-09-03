---
name: audience-hilo
description: Genera thread X/IG/LinkedIn con 8-15 tweets · cliffhangers entre mensajes · CTA final. Para storytelling escrito largo.
---

# /audience-hilo

Thread estructurado completo.

## Uso

```
/audience-hilo "tu tema"
```

## Lo que hago

Invoco pipeline:
1. `gatillo-master`
2. `template-aplicador`
3. `hilo-architect` (genera 8-15 tweets)
4. `notable-auditor`

## Output

```markdown
Thread completo:
- Tweet 1 (hook)
- Tweets 2-N (desarrollo + cliffhangers)
- Tweet final (CTA)
- Variaciones por plataforma (X · IG · LinkedIn)
- Análisis
```

## Tiempo
~2-3 min

## Coste
**Incluido en plan Claude (Pro $20 · Max $100 · Max $200).**
_Referencia API pay-per-use: ~$0.10_

## Cuándo invocar
- Audiencia principal en X/LinkedIn
- Storytelling largo
- Caso de estudio
- Construir autoridad escrita
