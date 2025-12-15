# 🎥 Guía para Grabar el Video de Demostración

## 📋 Requisitos del Video

- ⏱️ **Duración**: 2-3 minutos
- 📹 **Contenido**: Pantalla completa del computador
- 👤 **Rostro visible**: Todo el tiempo (webcam en esquina)
- 🎤 **Audio**: Explicación clara de lo que haces
- 📤 **Subida**: Cuenta institucional (Google Drive o YouTube)
- 🔓 **Permisos**: Público o "Cualquiera con el enlace"

---

## 🎬 Guion Sugerido (2-3 minutos)

### **[0:00 - 0:15] Introducción (15 seg)**

**Qué mostrar:**
- Saluda a cámara
- Preséntate brevemente

**Qué decir:**
```
"Hola, soy Julio Viche. Les presento mi aplicación de notificaciones 
push desarrollada en Flutter, que maneja notificaciones locales y 
remotas en tres estados diferentes: foreground, background y terminated."
```

---

### **[0:15 - 0:30] Pantalla Principal (15 seg)**

**Qué mostrar:**
- Abrir la aplicación en el emulador/dispositivo
- Mostrar la pantalla principal con los botones
- Señalar el token FCM en la parte superior

**Qué decir:**
```
"Esta es la pantalla principal. Aquí tenemos cuatro funcionalidades: 
notificaciones instantáneas, notificaciones con botones de acción, 
programación de notificaciones con temporizador, y el historial. 
En la parte superior vemos el token de Firebase Cloud Messaging."
```

---

### **[0:30 - 0:50] Notificación Instantánea (20 seg)**

**Qué mostrar:**
1. Presionar botón azul "Notificación Instantánea"
2. Deslizar barra de notificaciones para mostrarla
3. Hacer clic en la notificación
4. Mostrar que navega al historial

**Qué decir:**
```
"Primero, demostraré una notificación instantánea. Presiono el botón 
azul, y aquí aparece la notificación en la barra. Al hacer clic, 
la aplicación navega automáticamente al historial donde se guardó 
la notificación en la base de datos SQLite."
```

---

### **[0:50 - 1:10] Notificación con Botones (20 seg)**

**Qué mostrar:**
1. Volver al home (botón atrás)
2. Presionar botón verde "Notificación con Botones"
3. Deslizar barra y mostrar botones "Aceptar" y "Rechazar"
4. Presionar uno de los botones

**Qué decir:**
```
"Ahora una notificación con botones de acción. Presiono el botón verde, 
y aquí vemos que la notificación incluye dos botones: Aceptar y Rechazar. 
Estos permiten al usuario interactuar directamente desde la notificación 
sin abrir la aplicación."
```

---

### **[1:10 - 1:40] Programar Notificación (30 seg)**

**Qué mostrar:**
1. Volver al home
2. Presionar botón naranja "Programar Notificación"
3. Ingresar título: "Prueba de Temporizador"
4. Ingresar mensaje: "Esta notificación se programó"
5. Seleccionar fecha (hoy) y hora (2 minutos adelante)
6. Mostrar el resumen con tiempo restante
7. Presionar "Programar Notificación"
8. Mostrar mensaje de confirmación

**Qué decir:**
```
"La funcionalidad más importante es el temporizador. Ingreso un título 
y mensaje, selecciono la fecha y hora exacta. El sistema muestra cuánto 
tiempo falta. Programo la notificación. Esta funcionará incluso si cierro 
completamente la aplicación, gracias a las alarmas exactas de Android."
```

---

### **[1:40 - 2:00] Historial (20 seg)**

**Qué mostrar:**
1. Ir al historial desde el botón o desde el menú
2. Mostrar la lista de notificaciones con colores
3. Hacer clic en una notificación
4. Mostrar el detalle completo

**Qué decir:**
```
"En el historial vemos todas las notificaciones guardadas. Cada tipo 
tiene un color diferente: azul para locales, verde para remotas de Firebase, 
y naranja para programadas. Al hacer clic en cualquiera, vemos el detalle 
completo con fecha, hora y tipo."
```

---

### **[2:00 - 2:20] Notificación en Background (20 seg)**

**Qué mostrar:**
1. Volver al home
2. Presionar botón Home del dispositivo (minimizar app)
3. Abrir Firebase Console en navegador
4. Enviar notificación rápida
5. Mostrar que llega en la barra
6. Hacer clic y mostrar que abre la app

**Qué decir:**
```
"Ahora probaré notificaciones remotas. Minimizo la aplicación, envío 
una notificación desde Firebase Console. Aquí llega la notificación 
con la app en segundo plano. Al hacer clic, la aplicación se abre y 
muestra el historial actualizado."
```

---

### **[2:20 - 2:40] Notificación en Terminated (20 seg)**

**Qué mostrar:**
1. Cerrar completamente la app (swipe en recientes)
2. Mostrar que no está en recientes
3. Enviar otra notificación desde Firebase
4. Mostrar que llega con app cerrada
5. Hacer clic y mostrar que inicia la app

**Qué decir:**
```
"Finalmente, la prueba más importante: cierro completamente la aplicación, 
verifico que no esté en procesos activos. Envío una notificación desde 
Firebase. Aquí llega con la app completamente cerrada. Al hacer clic, 
la aplicación inicia desde cero y muestra automáticamente el historial."
```

---

### **[2:40 - 3:00] Cierre (20 seg)**

**Qué mostrar:**
- Volver a la pantalla principal
- Mostrar brevemente el código en VS Code (opcional)

**Qué decir:**
```
"Esta aplicación demuestra el manejo completo de notificaciones push 
en Flutter: locales, remotas, programadas, con botones, y funcionando 
en todos los estados de la aplicación. Todo el código está organizado 
en capas con servicios, modelos y base de datos SQLite. Gracias por su atención."
```

---

## 🛠️ Herramientas Recomendadas

### Opción 1: OBS Studio (Profesional, Gratis)

**Ventajas:** Máxima calidad, control total, gratuito

**Instalación:**
1. Descargar: https://obsproject.com/
2. Instalar normalmente
3. Abrir OBS Studio

**Configuración:**
1. Agregar fuente → Captura de pantalla
2. Agregar fuente → Dispositivo de captura de video (webcam)
3. Redimensionar webcam a esquina inferior derecha
4. Configurar audio del micrófono
5. Iniciar grabación (Ctrl + R)

**Exportar:**
- Video se guarda en: `C:\Users\TuUsuario\Videos`
- Formato: MP4

---

### Opción 2: Loom (Fácil, En Línea)

**Ventajas:** Super simple, no requiere instalación

**Uso:**
1. Ir a: https://www.loom.com/
2. Crear cuenta gratuita
3. Instalar extensión de Chrome
4. Hacer clic en extensión Loom
5. Seleccionar "Screen + Cam"
6. Iniciar grabación
7. Subir automáticamente a Loom
8. Compartir link

---

### Opción 3: Windows Game Bar (Nativo)

**Ventajas:** Ya viene con Windows 10/11

**Uso:**
1. Presionar `Win + G`
2. Habilitar Game Bar si está deshabilitado
3. Hacer clic en botón de grabación (círculo)
4. Grabar pantalla (no incluye webcam)

**Limitación:** No muestra webcam automáticamente

---

### Opción 4: Bandicam (Prueba Gratis)

**Ventajas:** Buena calidad, fácil de usar

**Limitaciones:** Versión gratis tiene marca de agua

**Uso:**
1. Descargar: https://www.bandicam.com/
2. Instalar versión de prueba
3. Seleccionar "Grabar pantalla"
4. Configurar webcam overlay
5. Iniciar grabación

---

## 📹 Configuración Recomendada

### Resolución:
- **1920x1080** (Full HD) - Recomendado
- **1280x720** (HD) - Mínimo aceptable

### FPS (Frames por segundo):
- **30 FPS** - Suficiente para tutoriales
- **60 FPS** - Opcional, mayor fluidez

### Formato de salida:
- **MP4** - Mejor compatibilidad
- **Codec**: H.264

### Tamaño de webcam:
- **20-25%** de la pantalla
- Ubicación: Esquina inferior derecha

### Audio:
- **Micrófono claro**
- Evitar ruido de fondo
- Hablar claramente y pausadamente

---

## 🎤 Tips para Grabar

### Antes de Grabar:

1. ✅ **Cerrar aplicaciones innecesarias** (evita notificaciones)
2. ✅ **Desactivar notificaciones del sistema** (Windows)
3. ✅ **Probar micrófono** (grabación de prueba)
4. ✅ **Probar webcam** (buena iluminación)
5. ✅ **Tener la app lista para demostrar**
6. ✅ **Tener Firebase Console abierto** en otra pestaña
7. ✅ **Practicar el guion** al menos una vez

### Durante la Grabación:

1. 👀 **Mirar a la cámara** de vez en cuando
2. 🗣️ **Hablar claro y pausado**
3. 🖱️ **Movimientos lentos con el mouse** (más fácil de seguir)
4. ⏸️ **Hacer pausas** entre acciones importantes
5. 🎯 **Señalar con el cursor** lo que estás explicando
6. 😊 **Mantener actitud positiva** y profesional

### Si cometes un error:

- **Opción 1:** Pausar grabación, corregir, continuar
- **Opción 2:** Editar después (si usas OBS o Bandicam)
- **Opción 3:** Regrabar desde el inicio (si es grave)

---

## 🎬 Edición Básica (Opcional)

Si quieres mejorar el video:

### Herramientas Gratuitas:

1. **DaVinci Resolve** (profesional, gratis)
   - https://www.blackmagicdesign.com/products/davinciresolve

2. **Shotcut** (simple, gratis)
   - https://shotcut.org/

3. **OpenShot** (muy simple, gratis)
   - https://www.openshot.org/

### Ediciones Básicas:

- Cortar inicio/final innecesarios
- Eliminar silencios largos
- Agregar zoom en momentos clave
- Agregar texto con puntos importantes
- Ajustar audio (normalizar volumen)

---

## 📤 Subir a Cuenta Institucional

### Opción 1: Google Drive

1. Ir a https://drive.google.com/
2. Iniciar sesión con tu cuenta institucional (@uisrael.edu.ec)
3. Hacer clic en "+ Nuevo" → "Subir archivo"
4. Seleccionar tu video MP4
5. Esperar a que termine de subir
6. Hacer clic derecho en el video → "Compartir"
7. Cambiar a "Cualquiera con el enlace"
8. Copiar el enlace
9. Pegar en el template.tex

**Link final:**
```
https://drive.google.com/file/d/XXXXXXXXXXXXXXXXX/view?usp=sharing
```

---

### Opción 2: YouTube

1. Ir a https://studio.youtube.com/
2. Iniciar sesión con cuenta institucional
3. Hacer clic en "Crear" → "Subir video"
4. Seleccionar el video
5. Configurar:
   - Título: "Sistema de Notificaciones Push - Flutter - Julio Viche"
   - Descripción: Breve descripción del proyecto
   - Visibilidad: **"No listado"** (importante: no público)
6. Publicar
7. Copiar el enlace del video
8. Pegar en el template.tex

**Link final:**
```
https://youtu.be/XXXXXXXXXXX
```

---

## ✅ Verificación Final

Antes de entregar:

- [ ] Video dura entre 2-3 minutos
- [ ] Tu rostro es visible todo el tiempo
- [ ] Se ve toda la pantalla del computador
- [ ] Audio se escucha claro
- [ ] Demuestra todas las funcionalidades
- [ ] Muestra foreground, background y terminated
- [ ] Link está en cuenta institucional
- [ ] Permisos configurados correctamente
- [ ] Link pegado en template.tex
- [ ] Link funciona (probado en navegador)

---

## 🚨 Errores Comunes

### "No se ve la webcam"
- Solución: En OBS, verifica que agregaste "Dispositivo de captura de video"

### "No se escucha el audio"
- Solución: Verifica que el micrófono esté configurado en la herramienta de grabación

### "Video muy pesado (>500MB)"
- Solución: Exportar en 720p en lugar de 1080p, o comprimir con HandBrake

### "No puedo subir a Drive/YouTube"
- Solución: Verifica tu cuenta institucional, puede tener restricciones

### "El video se traba"
- Solución: Cerrar aplicaciones, grabar en resolución menor (720p)

---

## 💡 Tip Extra

Si quieres hacer un video **realmente profesional**:

1. Agregar intro de 3 segundos con tu nombre
2. Usar música de fondo suave (sin derechos de autor)
3. Agregar transiciones entre secciones
4. Agregar texto en pantalla con puntos clave
5. Finalizar con una conclusión visual

Pero **NO es obligatorio** - un video simple y claro es suficiente.

---

**¡Éxito con tu video!** 🎥
