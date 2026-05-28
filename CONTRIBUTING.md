# Contribuir a Zenith Audience™

¡Gracias por querer contribuir! Este plugin es un sistema vivo y se beneficia de cada mejora.

## Cómo contribuir

### Reportar bugs
1. Verifica que el bug no esté ya reportado en [Issues](https://github.com/zenithmetodo/zenith-audience/issues)
2. Abre nuevo issue con template "Bug Report"
3. Describe pasos para reproducir

### Sugerir features
1. Abre issue con template "Feature Request"
2. Describe el problema que resuelve
3. Sugiere solución concreta

### Pull Requests

#### Para nuevos agentes
- Crear `agents/NN-nombre-agente.md`
- Seguir formato (frontmatter + manual)
- Internalizar knowledge en system prompt
- Incluir "cuándo SÍ usar / cuándo NO usar"

#### Para nuevos templates virales
- Solo si se valida en clase 25-36 del Método Audience
- Mantener atribución a Elias Mamã

#### Para mejoras de HTMLs
- Mantener branding Zenith (cian + purple + dark)
- Verificar print-color-adjust: exact
- Probar en print preview

#### Para nuevos examples
- Casos REALES (con permiso del creador)
- Atribuir fuente
- Estructurar como `examples/*/`

### Convenciones

- **Idioma:** Español (con tecnicismos en portugués cuando aplica del método original)
- **Bordones del método:** mantener (gatilhos · estructuras · notable)
- **Branding visual:** cian #00E5CF + purple #B845FF + dark #050510
- **Fuentes:** Fraunces (títulos) + Inter (body) + JetBrains Mono (código)

## Atribución del Método

Todo conocimiento del Método Audience original debe atribuirse a:
- **Elias Mamã (Marconi Rômulo)** y su equipo

Las adaptaciones operativas e implementaciones se atribuyen a:
- **Joseph Moreno · Zenith**

## Process de PR

1. Fork del repo
2. Branch nueva: `git checkout -b feature/nombre-feature`
3. Commits descriptivos
4. Push y abre PR contra `main`
5. CI ejecutará validación automática
6. Review · merge

## Code of Conduct

Ver [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

## Preguntas

- Issues de GitHub
- Email: impactodigitalformacionbrasil@gmail.com
