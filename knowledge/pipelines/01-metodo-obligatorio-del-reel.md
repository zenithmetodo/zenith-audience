# EL MÉTODO OBLIGATORIO DEL REEL · paso a paso

> Esto no es una recomendación. Es **el orden en el que se hace un reel en Zenith**, y no se salta ningún paso ni se cambia el orden.
> Cada paso **se le enseña al usuario y se le explica** antes de pasar al siguiente. Un reel que aparece de golpe, ya escrito, sin que se haya visto el diagnóstico ni el formato, está mal hecho aunque el guion sea bueno.
>
> **¿Quieres verlo hecho en vez de explicado?** `${CLAUDE_PLUGIN_ROOT}/knowledge/pipelines/02-ejemplos-trabajados.md` recorre los cinco pasos en dos reels reales —uno que salió bien y uno que los tres revisores tumbaron a la primera— con lo que el agente le escribe literalmente al usuario en cada paso, y cierra con **LAS CLAVES**.
> **Y el pipeline operativo, con el agente concreto de cada paso**, está en la sección «LA SECUENCIA DE USO → 🌅 DIARIO» de `${CLAUDE_PLUGIN_ROOT}/skills/audience-master/SKILL.md`.

---

## POR QUÉ EXISTE ESTE FICHERO

Un guion de reel bueno no sale de escribir bien. Sale de tres decisiones que se toman **antes** de escribir una sola frase:

1. **A quién le hablo y en qué punto está** (el cruce).
2. **Qué se ve en pantalla y por qué eso** (el formato).
3. **Con qué frases exactas se lo cuento** (el guion).

Si el paso 3 se hace sin los pasos 1 y 2, sale un guion que suena bien y no convierte: le habla a un público que no existe con un formato que no se puede grabar. Por eso el orden es obligatorio.

---

## PASO 1 · EL CRUCE (diagnosticar y EXPLICAR)

**Nunca se escribe un reel sin saber a quién le habla.** Se diagnostican tres ejes leyendo `knowledge/cruces/`:

| Eje | Qué mide | Dónde está |
|---|---|---|
| **Temperatura** | Cuánta relación tiene ya contigo. Frío, templado o caliente | `cruces/03-temperatura.md` |
| **Consciencia** | Qué sabe del problema y de la solución. Schwartz N1-N5 | `cruces/01-consciencia.md` |
| **Sofisticación** | Cuánto ha oído ya el mercado. S1-S5 | `cruces/02-sofisticacion.md` |

Y encima, los **modificadores** (`cruces/11-modificadores.md`): urgencia real, qué ya ha probado y le falló, objeción dominante y deseo dominante.

**Lo que hay que ENTREGARLE al usuario en este paso, por escrito, antes de seguir:**

- La celda: *"esto le habla a frío × N2 × S3"*.
- **Qué impone esa celda**: la dosis de dolor y de deseo, cuánta prueba hace falta y dónde va colocada, cuánto puede durar la pieza, y **hasta dónde puede pedir el CTA** (en frío se pide un clic o un comentario, no una llamada).
- Los **prohibidos de esa celda**: los errores que queman dinero justo ahí.
- Lo que se ha dado por supuesto, marcado como `[SUPUESTO]`, para que el usuario lo confirme o lo corrija.

> **Regla dura:** ante la duda, la temperatura más fría. Es el error barato; el caro es hablarle de tú a alguien que no sabe quién eres.

---

## PASO 2 · EL FORMATO (competir, elegir, ENSEÑAR el dibujo)

**Nunca se propone un solo formato.** Se hacen competir al menos **tres**, cada uno desde un ángulo distinto, y uno de los tres tiene que pensar **fuera de la caja**: un objeto cotidiano que no tenga nada que ver con marketing, convertido en metáfora.

Cada propuesta trae, obligatoriamente:

- **Mecánica 1** y **mecánica 2**.
- **Por qué es híbrido de verdad**: hay que poder decir qué se rompe si quitas una de las dos. Si el reel sigue funcionando sin una de ellas, **no es un híbrido: es un formato con un adorno**, y no vale.
- **EL DIBUJO**: qué se ve en pantalla, componente a componente, con el detalle suficiente para que el editor lo recree **sin preguntar nada**. Esta es la pieza más importante del paso.
- **Con qué se graba**, del material que existe de verdad.
- **El riesgo**: por dónde se estropea.

Después compite: un juez elige uno, dice **por qué** y dice **qué injerta** de los otros dos.

**Lo que hay que ENTREGARLE al usuario:** el menú de los tres, el ganador, el porqué, y **el dibujo del ganador explicado**. Solo cuando eso está sobre la mesa se pasa al guion.

> No repitas formato. Antes de proponer, mira los reels que ya existen en el proyecto y descarta los formatos ya usados.

---

## PASO 3 · EL GUION (recién ahora)

Con el cruce y el formato cerrados, se escribe el `GUION.md`, con estas secciones y en este orden:

1. **De qué va, en una frase.**
2. **Por qué es híbrido** (las dos mecánicas y qué se rompe si quitas una).
3. **Los 6 ganchos.** Cada uno con las tres capas: lo que se **DICE**, lo que se **VE** y lo que se **LEE** en el overlay. Y su ficha: asuntos virales, estructura y gatillos.
4. **El cuerpo palabra por palabra**, con tiempos.
5. **La tabla de overlays**, con segundo de entrada y de salida de cada uno.
6. **El CTA entero**, con sus 6 piezas desglosadas.
7. **Cómo se graba** y **dónde se estropea**.
8. **Por qué funciona** y **checklist antes de grabar**.

---

## PASO 4 · EL MAQUETADO

El entregable no es el `.md`: es el **documento-guion en HTML** (`REEL.html`), que es lo que se lee mientras se graba. Reglas en `formatos-reels/10-formatos-zenith-html.md` y en el agente `31-reel-html-builder`. Lo esencial:

- Un solo fichero **autocontenido**: cero CDNs, cero enlaces externos.
- Todo el contenido en `<div id="contenido" contenteditable="true">`, con la barra de botones **fuera**.
- Autoguardado en `localStorage` con clave única, que restaure al cargar.
- Tres botones: **Guardar PDF**, **Descargar copia** y **Restablecer**.
- **EL DIBUJO DEL FORMATO** renderizado en HTML/SVG dentro del documento.

### Los cuatro fallos que hay que evitar (ya pasaron, no se repiten)

1. **La copia descargada se borra a sí misma.** El clon se lleva dentro el mismo `<script>` con la **misma clave** de `localStorage`, así que al abrirlo restaura encima el estado del original. → Dale al clon una clave distinta, o quítale el script de autoguardado al serializar.
2. **Se pierde la última frase.** El guardado va con *debounce* y no hay guardado al cerrar. → Guarda también en `visibilitychange` y `beforeunload`.
3. **"Restablecer" no borra de verdad.** Quita la clave, pero el *debounce* pendiente la resucita 700 ms después. → Cancela el temporizador antes de borrar.
4. **El botón de PDF imprime sin guardar.** → Guarda y luego imprime.

Y dos más: `contenteditable="false"` en el dibujo y en las tablas para que no se descoloquen al editar, y filtro de pegado en texto plano para que pegar desde Word no meta fondos blancos dentro del documento.

---

## PASO 5 · LOS REVISORES (gate, no adorno)

**Nada se entrega sin pasar tres revisores independientes.** No los hace el que escribió: se lanzan aparte y devuelven Keep/Fix.

| Revisor | Qué mira | Quién lo hace |
|---|---|---|
| **Voz** | La regla §9, emojis, anglicismos, lenguaje de consultor, cuentas mentales, ganchos que gastan el remate, **y todo número sin respaldo** | `zenith-audience:notable-auditor`, pase 1 |
| **Grabable** | Si se puede grabar mañana con el material que existe de verdad, la privacidad de cada captura, las **colisiones del dibujo** y si **cabe en la duración declarada** | `zenith-audience:notable-auditor`, pase 2 |
| **CTA y reconocimiento** | Las 6 piezas, el triángulo de congruencia, y si el síntoma se reconoce al instante | `zenith-audience:notable-auditor`, pase 3 |

Los tres pases van **por separado**, con encargo distinto y sin ver el trabajo del otro. Lo que devuelvan se arregla con `zenith-audience:notable-builder`.

Si alguno devuelve **FIX**, se arregla y se vuelve a pasar. No se entrega con hallazgos abiertos.

---

## LAS REGLAS DURAS (valen para todos los pasos)

### §9 · Prohibido negar la culpa
Nunca *"no es tu culpa"*, *"no lo haces mal"*, *"tus anuncios no van mal"*, *"el curso no estaba mal"*, *"no eras tú"*. La cabeza se queda con la palabra fea **aunque vaya negada**. Se **afirma la causa externa**.

- MAL: «Tus anuncios no van mal. Lo que va mal viene después.»
- BIEN: «Tus anuncios traen gente. Lo que pasa después es lo que se la come.»

Vale igual para el **audio**, para los **overlays** y para los **pies**. Un overlay que incumple la regla y se queda 24 segundos en pantalla es peor que una frase dicha de pasada.

### El síntoma tiene que ser universal
Lo que abre el reel lo tiene que reconocer **absolutamente todo el mundo** del nicho, no algunos. La prueba: que el que mire piense *"esto es literalmente mi semana"*, no *"esto le pasará a alguno"*.

### El gancho promete, no resuelve
Si el reel suelta su mejor frase en el segundo 3, el resto es cuesta abajo y la gente se va. **El remate va al final.**

### Cero aritmética mental
Nadie sigue una división de oído mientras mira un reel. O el número **viene ya dado**, o la cuenta **se ve escrita en pantalla**. Nunca *"treinta entre seis salen a cinco"*.

### Los clasificatorios llevan outro
Un reel de clasificar (ranking, tier list, montones, casillas) **no puede acabar en el último elemento**: necesita un cierre que recoja lo que se acaba de ver, sin meter información nueva.

### El material que existe manda
Antes de escribir un beat, comprueba que se puede grabar. **Una sola persona**: ningún beat puede pedir dos personajes a la vez ni que se toquen. Y si no hay b-roll en vídeo, no se escriben beats que lo den por hecho: se rediseñan con cara a cámara, pantalla verde o dibujo en pantalla.

### Privacidad de las capturas
Las capturas de conversaciones llevan **nombres reales**. Ninguna sale a pantalla con un nombre legible. Si se usa una, el guion **manda por escrito** el tapado: rectángulo negro **opaco** sobre la cabecera del chat, sobre el nombre del remitente y sobre el avatar. **Nunca desenfoque**, que se revierte. Si tapando lo necesario la captura ya no aporta nada, se cambia el beat. Y hay material que está prohibido del todo: cualquier captura de un CRM con nombres, teléfonos o motivos de rechazo de leads reales.

### Las palabras de comentario no se repiten
Si el CTA pide comentar una palabra, esa palabra es **única en toda la serie**. Antes de elegir, mira las que ya están cogidas por otros reels.

### El CTA, sus 6 piezas
**ACCIÓN** (un solo verbo) · **DÓNDE** · **PORQUÉ con beneficio** · **PRUEBA VISUAL** · **CONFIRMACIÓN** · **QUÉ PASA DESPUÉS**. Más el **triángulo de la congruencia**: lo que se dice, lo que se ve y lo que se lee apuntan a lo mismo.
Dos detalles que fallan siempre: en el reproductor de Reels el **botón de seguir está abajo a la izquierda**, no arriba; y no se manda el pulgar a un enlace que no existe.

---

## RESUMEN, PARA NO PERDERSE

```
1 · CRUCE      → diagnosticar y EXPLICAR la celda y lo que impone
2 · FORMATO    → 3 compiten, gana 1, se ENSEÑA el dibujo
3 · GUION      → 6 ganchos + cuerpo + overlays + CTA
4 · MAQUETADO  → REEL.html editable, con el dibujo dentro
5 · REVISORES  → voz · grabable · CTA. Gate, no adorno
```

Paso a paso. Enseñando cada uno. Sin saltarse ninguno.
