# Política de Seguridad · Zenith Audience™

## Versiones soportadas

| Versión | Soportada |
| ------- | --------- |
| 1.x.x   | ✅ |

## Reportar vulnerabilidad

Si descubres una vulnerabilidad de seguridad:

**NO** abras un issue público.

**SÍ** envía email a: impactodigitalformacionbrasil@gmail.com con:
- Descripción detallada
- Pasos para reproducir
- Impacto potencial

Responderemos en <72h.

## Buenas prácticas para usuarios

### Tokens y credenciales
- **NUNCA** commitees `.env` al repo
- Usa `.env.example` como template
- Rota tokens cada 6 meses

### MCP configs
- Los archivos `mcp-servers/*.json` están en `.gitignore`
- Solo `*.json.example` se commitean

### Scripts Python
- Revisa cambios antes de actualizar
- Los scripts hacen requests HTTP a APIs públicas (no envían tus datos)

### Whisper local
- Transcripciones se procesan LOCALMENTE
- Sin envío a cloud
- Audio descargado se guarda en `downloads/` (gitignored)

## Privacidad

Este plugin NO recolecta telemetría · NO envía datos a servidores propios. Toda comunicación es directa entre tu Claude Code y:
- **Anthropic API** (para Claude)
- **Metricool API** (si usas el MCP · solo tus datos)
- **Apify API** (si usas el MCP · solo scrapes que pidas)
- **APIs públicas** (Reddit · YouTube · pytrends)
