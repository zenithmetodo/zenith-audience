---
name: cruce
user-invocable: true
disable-model-invocation: false
description: 'ORQUESTADOR DE CRUCES de este plugin · Diagnostica el CRUCE del público (Temperatura × Consciencia × Sofisticación + modificadores) CON PREGUNTAS en vez de a ojo (los bancos de preguntas Liga del 1%), el chequeo de TRÁFICO FRÍO, y elige la ESTRUCTURA que funciona en ese nivel (pregunta abierta, rotura de patrón, 9 puertas de historia, hard sell, comparativas, rompe-objeciones) antes de crear cualquier pieza. Hace las preguntas mínimas cuando el tipo de público no está claro, aplica la matriz y los conflictos, deriva el lead (que es un OUTPUT, no un eje) y declara la celda EXTENDIDA (T·N·S·Pieza + objetivo + paso + objeción) con sus prohibidos — todo leyendo el conocimiento de cruces LOCAL de este mismo plugin. Autocontenido: no depende de ningún otro plugin. Triggers: "cruce", "diagnostica el público", "qué lead uso", "cómo le comunico a este público", "temperatura consciencia sofisticación", "es tráfico frío", "qué estructura uso", "mi anuncio no funciona".'
---

<!-- MANIFIESTO DE PROPAGACIÓN (para quien copie esta plantilla a otro plugin): ${CLAUDE_PLUGIN_ROOT}/knowledge/cruces debe contener
     los operativos 00-17 + 19-marco-estrategico-preguntas.md + 20-estructuras-por-nivel.md + 21-cta-beneficio-llamada-con-nombre.md
     (versiones actuales con punteros) + 15-fuentes.md con [liga-mensaje] y [liga-cta] resueltas + referencias/ (incluidas
     marco-estrategico-liga-del-1.md y llamada-con-nombre-liga-del-1.md) + svg/ + ficha-cruce.html. Si falta cualquiera,
     esta skill citará archivos inexistentes: copia el conocimiento JUNTO a este SKILL.md, nunca solo el SKILL.md. -->

# ORQUESTADOR DE CRUCES · haz las preguntas antes de escribir

> El motor de decisión por cruces de ESTE plugin. Su conocimiento vive **como propio** en `${CLAUDE_PLUGIN_ROOT}/knowledge/cruces` (autocontenido: si te descargas solo este plugin, funciona entero, sin depender de nada externo). Esta skill es el orquestador que lo usa **inline** en el hilo principal: hace las preguntas del público cuando hacen falta, cruza los ejes, resuelve conflictos y decide.
>
> El suelo de todo: la atención por defecto es CERO e indiferente, y cuando te equivocas de mensaje NADIE te avisa — por eso se diagnostica ANTES de escribir. [liga-mensaje]

## CUÁNDO SE ACTIVA

- El operador pide diagnosticar el público / decidir cómo comunicar, **o**
- Vas a generar copy para un **público nuevo o no declarado** (pide el cruce antes de escribir a ciegas), **o**
- El operador menciona tráfico frío / paid / "no me conocen", **o**
- El operador trae una pieza que "no funciona" (aplica LA ESCALERA, ver abajo).

Si el cruce YA está declarado en el brief (`T=… · N=… · S=… · Pieza=…`), no repitas el interrogatorio: úsalo.

## LO PRIMERO (obligatorio)

Lee con `Read`, sí o sí, antes de decidir:
1. `${CLAUDE_PLUGIN_ROOT}/knowledge/cruces/16-logica-del-operador.md` — CÓMO PENSAR los cruces (la lógica del operador + razonamiento siempre visible). LA PRIMERA.
2. `${CLAUDE_PLUGIN_ROOT}/knowledge/cruces/19-marco-estrategico-preguntas.md` — EL MARCO Liga del 1%: la filosofía, los BANCOS DE PREGUNTAS por puerta (7+7+5+4), el marco de decisión respuesta→acción, la declaración EXTENDIDA y el músculo crítico. SE LEE JUNTO AL 16.
3. `${CLAUDE_PLUGIN_ROOT}/knowledge/cruces/00-matriz-maestra.md` — el sistema y sus reglas de oro.
4. `${CLAUDE_PLUGIN_ROOT}/knowledge/cruces/12-conflictos-jerarquia.md` — qué manda cuando dos ejes chocan.
5. `${CLAUDE_PLUGIN_ROOT}/knowledge/cruces/17-trafico-frio-blueprint.md` — SI el público es FRÍO: la infraestructura obligatoria.

Para las DECISIONES, consulta además `${CLAUDE_PLUGIN_ROOT}/knowledge/cruces/20-estructuras-por-nivel.md` (las estructuras que funcionan en cada nivel, con ejemplos) y `${CLAUDE_PLUGIN_ROOT}/knowledge/cruces/21-cta-beneficio-llamada-con-nombre.md` (el CTA siempre vende un beneficio; la llamada con nombre). El resto del conocimiento (`01`-`15`, `referencias/`, `svg/`) lo consultas según la celda.

## EL PROCESO (inline, en el hilo principal — tú lo haces, sin sub-agentes)

### 1 · INGESTA
Recoge lo que el operador haya pasado (brief, avatar, oferta, la pieza a crear, el canal/origen del tráfico). Rellena las 4 puertas con lo que puedas, marcando `[SUPUESTO]` en lo inferido. Regla previa del marco: **lo observado manda sobre lo recordado** — lo comprobable se comprueba; lo no comprobable se marca.

### 2 · PREGUNTAS MÍNIMAS (solo los huecos críticos, una tanda)
Si falta algo crítico, pregunta — máximo una tanda (el banco completo vive en `19` §3):
1. ¿Qué PIEZA creamos y a qué CANAL/origen va? (¿tráfico frío paid o público que ya te conoce?)
2. ¿El público te conoce? — y el matiz que separa templado de caliente: **¿te ha DADO algo (correo, tiempo, dinero)? ¿le sorprendería que le escribieras hoy por privado?**
3. ¿Qué vende y a quién? (si no hay brief ni avatar)
4. ¿Qué ha probado ya ese público, qué le falló **y qué se cuenta a sí mismo sobre por qué**?
5. ¿Ese público está BUSCANDO activamente o le pillas de paso?
6. ¿Cuál es el DESTINO del clic / siguiente activo del embudo?
Si el material lo cubre, no preguntes: trabaja en modo directo con `[SUPUESTO]`s. **PERO lo NECESARIO se pregunta SIEMPRE:** "mínimas" = sin interrogatorio vacío, NUNCA saltarse una pregunta que hace falta — si un dato CRÍTICO sigue dudoso (pieza, origen, público, destino, qué probó), PREGUNTA; los supuestos son para lo secundario. **No se hace por hacer: primero el diagnóstico con sus preguntas, después la ejecución.** Fallback: si tras la tanda falta la pieza, asume la más probable, decláralo y sigue.

### 3 · DIAGNÓSTICO (las 4 puertas, CON SUS BANCOS DE PREGUNTAS — `19` §3-4)
- **G1 Temperatura** (`03-temperatura.md` + las 7 preguntas de `19`): frío/templado/caliente = cuánta confianza. "¿Me ha dado algo?" y "¿le sorprendería mi privado?" pesan más que los seguidores — **que te siga no es que te crea**. **SI FRÍO**, reporta la señal de infraestructura (¿tramo de infraestructura o pieza suelta de embudo caliente lanzada al frío? — lo segundo es el fallo estructural nº1, `17-...`). **Ante la duda: la MÁS FRÍA.**
- **G2 Consciencia** (`01-consciencia.md` + las 7 preguntas y el árbol de `19`): Schwartz N1-N5 bajando por el árbol (la primera respuesta "no" da el nivel), con evidencia de mercado (qué consume, qué anuncios escalan). + los 4 grados de consciencia del mecanismo. **Ante la duda: el DE ABAJO** (estás describiendo al operador, no a su cliente).
- **G3 Sofisticación** (`02-sofisticacion.md` + las 5 preguntas de `19`): S1-S5 (cuenta anuncios con la misma promesa raíz — "cuéntalos, no los estimes" — si hay research; si no, estima y marca `SUPUESTO · SIN VALIDAR`). Levanta el lenguaje quemado, el hueco ("¿qué es lo que NADIE está diciendo?") y la señal de reparto si el mercado está muy quemado.
- **G4 Modificadores** (`11-modificadores.md` + Ruta 4 de `19`): intención/urgencia · experiencias previas/escepticismo de categoría (**ya falló antes → invalidación POR DELANTE · categoría quemada → sube prueba y BAJA promesa**) · objeción dominante (de los 6 noes) · deseo dominante (restaurar > transformar en caliente).

### 4 · CONFLICTOS + MÚSCULO CRÍTICO
¿Chocan dos ejes? Aplica las 4 reglas de precedencia (`12-conflictos-jerarquia.md` + Ruta 6 de `19`): confianza → sofisticación → paso proporcional → doble nivel. Documenta: `CONFLICTO <cuál> → REGLA <1-4 / C1-C8> → RESOLUCIÓN`. **Chequeo de frío:** si es FRÍO con embudo `Anuncio→Oferta→Compra`, dispara el AVISO ESTRUCTURAL y propón la infraestructura mínima. **Y antes de decidir, pasa el diagnóstico por las 5 preguntas de segundo orden** (`19` §6): ¿visto o contado? · ¿el cliente o yo? · ¿qué lo refutaría? · ¿casilla cómoda? · si falla, ¿sabré por qué?

### 5 · DECISIONES (deriva, con el conocimiento local)
- **Lead** (`04-leads-3-mapeos.md` + `05`/`08` + las PUERTAS DE ENTRADA de `20`): DERIVA el tipo (el lead es un OUTPUT, nunca un eje) + escribe 3 variantes de niveles distintos para test, **cada una entrando por una PUERTA DISTINTA** (pregunta abierta · rotura de patrón · 9 puertas de historia · síntomas… — **la historia no es la única puerta; abrir siempre igual suena a plantilla**).
- **Estructura + dosis** (`10-dosis-estructuras-prueba.md` + el menú Liga del 1% de `20`): esqueleto por temperatura + estructura del nivel (bajo: pregunta abierta/rotura/motores/puertas · medio: hard sell P·C+M·I·S·S·U·CTA / demostrativa / comparativa ×6 · alto: prueba social definitiva incl. prueba del MECANISMO) + dosis dolor/deseo/mecanismo + prueba. Multi-creativo: reparto 3-4-2 y formatos que no se parezcan.
- **Cierre** (`13-siguiente-paso.md` + `21-cta-beneficio-llamada-con-nombre.md` + los rompe-objeciones de `20` Parte C): objetivo de la pieza · creencia a instalar · paso proporcional (en frío, baja fricción) · **CTA formulado SIEMPRE como BENEFICIO, nunca el trámite** — jamás "compra ahora"/"agenda una llamada gratis" a secas; la persona se lleva algo aunque no compre; **si el paso es agendar → la LLAMADA CON NOMBRE** (el nombre habla de SU situación · promete veredicto/número/porqué · cumplible de verdad) · urgencia CIERTA o nada · **en nivel alto multi-creativo: cada objeción es un creativo entero** · PROHIBIDOS de la celda.

### 6 · ENTREGA
Devuelve al operador, con **RAZONAMIENTO NARRADO** (situación → evidencia → choques → qué manda → creencia siguiente → decisión):
1. **Declaración EXTENDIDA**: `T=… · N=… · S=… · Pieza=…` + modificadores + **Objetivo (la creencia que instala) + Paso que pide + Objeción que mata** (`19` §5 — "si no lo declaras, el copy sale genérico").
2. El hilo de razonamiento.
3. Lead + variante A (con su puerta de entrada) + estructura + paso pedido.
4. Los PROHIBIDOS de la celda.
5. Los `[SUPUESTO]`s a validar.
Y pásale ese diagnóstico a las skills/agentes de ESTE plugin que van a escribir el copy, para que no decidan a ciegas. Si el operador quiere la Ficha en HTML, rellena la plantilla local `${CLAUDE_PLUGIN_ROOT}/knowledge/cruces/ficha-cruce.html` (branding Zenith, print-to-PDF).

## MODO ESCALERA (pieza que "no funciona")
Si el operador trae métricas de una pieza floja, baja hasta el DATO antes de tocar nada (`19` §6): ¿no para el scroll? → gancho y NIVEL · ¿para pero no acaba? → puente o dosis · ¿acaba pero no clic? → CTA o proporción · ¿clic pero no convierte? → NO es la pieza: es incongruencia con lo que se encuentra después. Cada peldaño se arregla en un sitio distinto. **Si NO trae métricas:** pregunta en la tanda única en qué peldaño falla (¿no para el scroll? ¿no llegan al final? ¿no hacen clic? ¿clic sin conversión?); si no lo sabe, diagnostica la pieza como cruce normal (celda a la que habla vs celda real) y marca el peldaño `[SUPUESTO]`.

## REGLAS INNEGOCIABLES
1. Ninguna pieza sin la declaración EXTENDIDA (`T·N·S·Pieza` + objetivo + paso + objeción). 2. El lead es un output — jamás preguntes "¿qué lead quieres?". 3. Toda decisión con celda + cita del conocimiento local. 4. `[SUPUESTO]` visible; lo observado manda sobre lo recordado. 5. Razonamiento siempre visible (`16` + `19`). 6. En FRÍO, no metas a un frío por un embudo de caliente; paso de baja fricción. 7. **Ante la duda: nivel DE ABAJO, temperatura MÁS FRÍA.** 8. **Variedad de puertas: la historia no es la única entrada** — las 3 variantes entran por puertas distintas. 9. **El CTA siempre vende un BENEFICIO, nunca el trámite** (`21`): jamás "compra ahora"/"agenda una llamada gratis" a secas; si el paso es agendar, la llamada va CON NOMBRE. 10. Español de España, cero emojis en entregables (los marcadores del conocimiento son notas internas, jamás salida de cliente). 11. No inventes cifras → `[DATO A RELLENAR]`; las cifras del cold-blueprint (70/15/55) y las del caso de la llamada con nombre (+42/+22) son benchmarks de SUS fuentes, no promesas propias.
