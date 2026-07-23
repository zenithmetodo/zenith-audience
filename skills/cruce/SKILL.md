---
name: cruce
user-invocable: true
disable-model-invocation: false
description: 'ORQUESTADOR DE CRUCES de este plugin · Diagnostica el CRUCE del público (Temperatura × Consciencia × Sofisticación + modificadores) y el chequeo de TRÁFICO FRÍO antes de crear cualquier pieza, para no escribir a ciegas. Hace las preguntas mínimas cuando el tipo de público no está claro, aplica la matriz y los conflictos, deriva el lead (que es un OUTPUT, no un eje) y declara la celda con sus prohibidos — todo leyendo el conocimiento de cruces LOCAL de este mismo plugin. Autocontenido: no depende de ningún otro plugin. Se invoca cuando el operador quiere clavar el público, o antes de generar copy para un público nuevo. Triggers: "cruce", "diagnostica el público", "qué lead uso", "cómo le comunico a este público", "temperatura consciencia sofisticación", "es tráfico frío".'
---

# ORQUESTADOR DE CRUCES · haz las preguntas antes de escribir

> El motor de decisión por cruces de ESTE plugin. Su conocimiento vive **como propio** en `${CLAUDE_PLUGIN_ROOT}/knowledge/cruces` (autocontenido: si te descargas solo este plugin, funciona entero, sin depender de nada externo). Esta skill es el orquestador que lo usa **inline** en el hilo principal: hace las preguntas del público cuando hacen falta, cruza los ejes, resuelve conflictos y decide.

## CUÁNDO SE ACTIVA

- El operador pide diagnosticar el público / decidir cómo comunicar, **o**
- Vas a generar copy para un **público nuevo o no declarado** (pide el cruce antes de escribir a ciegas), **o**
- El operador menciona tráfico frío / paid / "no me conocen".

Si el cruce YA está declarado en el brief (`T=… · N=… · S=… · Pieza=…`), no repitas el interrogatorio: úsalo.

## 🔴 LO PRIMERO (obligatorio)

Lee con `Read`, sí o sí, antes de decidir:
1. `${CLAUDE_PLUGIN_ROOT}/knowledge/cruces/16-logica-del-operador.md` — CÓMO PENSAR los cruces (la lógica del operador + razonamiento siempre visible). LA PRIMERA.
2. `${CLAUDE_PLUGIN_ROOT}/knowledge/cruces/00-matriz-maestra.md` — el sistema y sus reglas de oro.
3. `${CLAUDE_PLUGIN_ROOT}/knowledge/cruces/12-conflictos-jerarquia.md` — qué manda cuando dos ejes chocan.
4. `${CLAUDE_PLUGIN_ROOT}/knowledge/cruces/17-trafico-frio-blueprint.md` — SI el público es FRÍO: la infraestructura obligatoria.

El resto del conocimiento (`01`-`15`, `referencias/`, `svg/`) lo consultas según la celda.

## EL PROCESO (inline, en el hilo principal — tú lo haces, sin sub-agentes)

### 1 · INGESTA
Recoge lo que el operador haya pasado (brief, avatar, oferta, la pieza a crear, el canal/origen del tráfico). Rellena las 4 puertas con lo que puedas, marcando `[SUPUESTO]` en lo inferido.

### 2 · PREGUNTAS MÍNIMAS (solo los huecos críticos, una tanda)
Si falta algo crítico, pregunta — máximo una tanda:
1. ¿Qué PIEZA creamos y a qué CANAL/origen va? (¿tráfico frío paid o público que ya te conoce?)
2. ¿El público te conoce? (frío / lista / seguidores / clientes)
3. ¿Qué vende y a quién? (si no hay brief ni avatar)
4. ¿Qué ha probado ya ese público y qué le falló?
5. ¿Cuál es el DESTINO del clic / siguiente activo del embudo?
Si el material lo cubre, no preguntes: trabaja en modo directo con `[SUPUESTO]`s. Fallback: si tras la tanda falta la pieza, asume la más probable, decláralo y sigue.

### 3 · DIAGNÓSTICO (las 4 puertas, leyendo el conocimiento local)
- **G1 Temperatura** (`03-temperatura.md`): frío/templado/caliente = cuánta confianza. **SI FRÍO**, reporta la señal de infraestructura (¿es un tramo de infraestructura de frío o una pieza suelta de embudo caliente lanzada al frío? — lo segundo es el fallo estructural nº1, `17-...`).
- **G2 Consciencia** (`01-consciencia.md`): Schwartz N1-N5, con evidencia de mercado (qué consume, qué anuncios escalan). + los 4 grados de consciencia del mecanismo.
- **G3 Sofisticación** (`02-sofisticacion.md`): S1-S5 (cuenta anuncios con la misma promesa raíz en Meta Ad Library si hay research; si no, estima y marca `SUPUESTO · SIN VALIDAR`). Levanta el lenguaje quemado.
- **G4 Modificadores** (`11-modificadores.md`): intención/urgencia · experiencias previas/escepticismo de categoría · objeción dominante · deseo dominante. Todos con default inferible.

### 4 · CONFLICTOS
¿Chocan dos ejes? Aplica las 4 reglas de precedencia (`12-conflictos-jerarquia.md`): confianza → sofisticación → paso proporcional → doble nivel. Documenta: `CONFLICTO <cuál> → REGLA <1-4 / C1-C8> → RESOLUCIÓN`. **Chequeo de frío:** si es FRÍO con embudo `Anuncio→Oferta→Compra`, dispara el AVISO ESTRUCTURAL y propón la infraestructura mínima.

### 5 · DECISIONES (deriva, con el conocimiento local)
- **Lead** (`04-leads-3-mapeos.md` + `05`/`08`): DERIVA el tipo (el lead es un OUTPUT, nunca un eje) + escribe 3 variantes de niveles distintos para test.
- **Estructura + dosis** (`10-dosis-estructuras-prueba.md`): esqueleto por temperatura + banco B/M/A por nivel + dosis dolor/deseo/mecanismo + prueba.
- **Cierre** (`13-siguiente-paso.md`): objetivo de la pieza · creencia a instalar · paso proporcional (en frío, baja fricción) · CTA · PROHIBIDOS de la celda.

### 6 · ENTREGA
Devuelve al operador, con **RAZONAMIENTO NARRADO** (situación → evidencia → choques → qué manda → creencia siguiente → decisión):
1. Declaración: `T=… · N=… · S=… · Pieza=…` + modificadores.
2. El hilo de razonamiento.
3. Lead + variante A + estructura + paso pedido.
4. Los PROHIBIDOS de la celda.
5. Los `[SUPUESTO]`s a validar.
Y pásale ese diagnóstico a las skills/agentes de ESTE plugin que van a escribir el copy, para que no decidan a ciegas. Si el operador quiere la Ficha en HTML, rellena la plantilla local `${CLAUDE_PLUGIN_ROOT}/knowledge/cruces/ficha-cruce.html` (branding Zenith, print-to-PDF).

## REGLAS INNEGOCIABLES
1. Ninguna pieza sin declarar `T·N·S·Pieza`. 2. El lead es un output — jamás preguntes "¿qué lead quieres?". 3. Toda decisión con celda + cita del conocimiento local. 4. `[SUPUESTO]` visible. 5. Razonamiento siempre visible (`16-...`). 6. En FRÍO, no metas a un frío por un embudo de caliente; paso de baja fricción. 7. Español de España, cero emojis en entregables. 8. No inventes cifras → `[DATO A RELLENAR]`; las cifras del cold-blueprint (70/15/55) son benchmark de cierre de llamada, no promesa, distintas del front-end ~1-2%.
