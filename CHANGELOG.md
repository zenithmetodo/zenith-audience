# Changelog · Zenith Audience™

## v1.0.0 · 2026-05-28

### Lanzamiento inicial

Sistema diario para crear contenido viral basado en el Método Audience de Elias Mamã (Marconi Rômulo) · adaptado por Joseph Moreno · Zenith.

#### Componentes

- ✅ **29 agentes** especializados (cada uno crack de UNA cosa)
- ✅ **15 slash commands** para uso diario · semanal · mensual
- ✅ **32 knowledge files** con todo el método (3 pilares · 7 gatillos · 12 estructuras · 8 elementos notable · 10 preguntas núcleo)
- ✅ **7 HTML templates** estéticos PDF-ready (reel · carrusel · hilo · plan-semana · audit · métricas · engenharia)
- ✅ **6 scripts Python** (gratis · pytrends · PRAW · YT API · transcripción Whisper local)
- ✅ **2 MCP configs** (Metricool Free · Apify Free $5/mes)
- ✅ **4 SVGs** (logo · banner · arquitectura · pipeline)
- ✅ **Examples canónicos** (12 templates · 7 gatillos · 6 categorías · 1 núcleo completo · 1 engenharia reversa)

#### Features destacadas

- ⭐ **Agente `ideas-ganadoras-adapter`** · multi-fuente (web · Apify · IA generativa) · adapta virales a TU núcleo
- ✅ **Metricool MCP** integrado (plan Free permanente · 1 marca · 8 redes)
- ✅ **Stack transcripción 100% gratis local** (youtube-transcript-api + yt-dlp + faster-whisper)
- ✅ **3 tipos de headline** generados siempre (verbal + visual + audio)
- ✅ **Stacking de gatillos** (mezcla de 2-3 por contenido · no 1 solo)
- ✅ **Output HTML estético** PDF-ready con análisis "por qué funcionará" + "en qué se basa"

#### Estructura

```
zenith-audience/
├── .claude-plugin/plugin.json
├── agents/          (29)
├── commands/        (15)
├── knowledge/       (32)
├── templates/       (7 HTMLs)
├── examples/        (~15 archivos)
├── mcp-servers/     (2 configs)
├── scripts/         (6 Python)
├── assets/          (4 SVGs)
├── .github/
└── docs/            (README · INSTALL · setup guides)
```

#### Coste mensual estimado
- Claude API uso intenso: ~$20-25
- Metricool Free: $0
- Apify Free: $0 (dentro de $5/mes)
- APIs (Reddit · YouTube · pytrends): $0
- Whisper local: $0
- **TOTAL: ~$20-25/mes**

---

## Roadmap

### v1.1.0 (próximo)
- Más examples canónicos por nicho
- Agente `voice-cloning-adapter` (opcional · ElevenLabs)
- Dashboard Next.js opcional (Vercel · separado del plugin)

### v1.2.0
- Soporte LinkedIn (cuando Metricool lo incluya en Free)
- Integración con CapCut / Descript (edición automática)
- Agente `cover-designer` (diseño visual con IA)

### v2.0.0
- Multi-marca (cuando user actualice Metricool a Starter)
- Análisis sentiment vía Brand24 (opcional)
- Reportes ejecutivos automatizados mensuales
