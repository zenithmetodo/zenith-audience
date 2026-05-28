# Setup Metricool MCP · paso a paso

> Métricas IG · TT · YT · FB · Pinterest · Threads · Bluesky · Twitch · 100% gratis con plan Free permanente.

---

## Por qué Metricool

✅ **MCP oficial** mantenido por Metricool · integración nativa Claude Code
✅ **Plan Free permanente** · 1 marca · múltiples redes
✅ **Empresa española** (Valladolid) · soporte y docs en castellano
✅ **30 días histórico** + **5 competidores** + **20 contenidos planificados/mes**
✅ **MCP completo en Free** (no requiere upgrade para uso normal)

---

## Setup en 5 pasos

### Paso 1 · Crear cuenta Metricool Free

1. Ve a https://metricool.com
2. Click "Empezar gratis"
3. Registra con email
4. Plan Free → confirmar

**No se requiere tarjeta de crédito.**

### Paso 2 · Conectar tus redes sociales

Dentro de Metricool dashboard:

1. **Settings · Brands · Add brand** → crea tu marca personal
2. Conecta las redes principales:
   - **Instagram:** OAuth con Facebook Business (requiere cuenta Creator/Business)
   - **TikTok:** OAuth directo
   - **YouTube:** OAuth con cuenta Google del canal
   - **Facebook · Pinterest · Threads · Bluesky · Twitch:** OAuth individual

**Plan Free incluye TODAS estas redes EXCEPTO LinkedIn y Twitter/X.**

### Paso 3 · Instalar MCP en Claude Code

```bash
claude mcp add --transport http metricool https://ai.metricool.com/mcp
```

Verifica:
```bash
claude mcp list
```

Debe aparecer `metricool`.

### Paso 4 · Autenticar (primera vez)

Ejecuta el primer comando:
```bash
/audience-metrics
```

Te abrirá browser para login OAuth · acepta permisos · guarda token automáticamente.

### Paso 5 · Verificar funcionamiento

```bash
/audience-metrics
```

Debes ver reporte HTML con:
- Top posts de la semana
- Engagement por plataforma
- Best time de publicación
- Comparativa competidores
- Recomendaciones

---

## Configuración avanzada (opcional)

### Modo token manual (en lugar de OAuth)

1. En Metricool dashboard: **Settings · Integrations · API**
2. Genera token personal
3. Añade al `.env` del plugin:
   ```
   METRICOOL_USER_TOKEN=tu_token_aqui
   METRICOOL_USER_ID=tu_user_id
   ```

### Cambiar marca activa

Si tienes varias marcas (plan pagado):
```bash
/audience-metrics --brand "Mi Otra Marca"
```

---

## Límites del plan Free

| Feature | Free | Starter (16€/mes) | Advanced (43€/mes) |
|---|---|---|---|
| Marcas | 1 | 5 | 15 |
| Histórico | 30 días | 90 días | Ilimitado |
| Competidores | 5 | 25 | 100 |
| Contenidos planificados/mes | 20 | Ilimitado | Ilimitado |
| MCP acceso | ✅ | ✅ | ✅ |
| LinkedIn/Twitter | ❌ | ✅ | ✅ |
| Export PDF | ❌ | ✅ | ✅ |

**El plan Free cubre el 100% del uso del plugin para creador individual.**

---

## Problemas comunes

### "MCP no responde"
- Verifica conexión: `claude mcp list`
- Re-instala: `claude mcp remove metricool && claude mcp add --transport http metricool https://ai.metricool.com/mcp`

### "OAuth falla"
- Verifica que tu Instagram esté en cuenta Business/Creator
- Reconecta vía Metricool dashboard primero
- Después intenta `/audience-metrics`

### "Sin datos"
- Espera 24-48h después de conectar redes (Metricool indexa retroactivamente)
- Verifica que tienes contenido publicado en período analizado

### "Histórico limitado"
- Plan Free = 30 días máximo
- Para más histórico → upgrade a Starter

---

## Datos que expone vía MCP

### Por cada plataforma
- Lista de posts (último mes)
- Engagement por post (likes · comments · shares · saves)
- Alcance · impresiones · views
- Retención reels/shorts (cuando IG/TT/YT lo exponen)
- Demografía audiencia (edad · género · ubicación)
- Best time de publicación
- Hashtags utilizados + performance
- Growth de seguidores

### Por cada competidor (max 5)
- Posts publicados
- Engagement medio
- Hashtags
- Frecuencia
- Formatos preferidos

---

## Recursos

- **Web Metricool:** https://metricool.com
- **Docs MCP:** https://help.metricool.com/en/article/how-to-connect-metricools-mcp
- **Status MCP:** https://ai.metricool.com/health
