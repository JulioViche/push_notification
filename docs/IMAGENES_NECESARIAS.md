# 📸 Imágenes Necesarias para el Manual

Para compilar correctamente el manual en LaTeX, debes tomar las siguientes capturas de pantalla y colocarlas en la carpeta `docs/images/`.

## 📋 Lista de Imágenes Requeridas

### 1. **sw-logo.png** (Logo de la carrera)
- Ya debe existir en `docs/`
- Logo de la carrera de Software

### 2. **decoration.png** (Decoración de carátula)
- Ya debe existir en `docs/`
- Decoración celeste para la parte inferior de la carátula

### 3. **arquitectura.png**
- **Descripción**: Diagrama de la arquitectura del sistema
- **Contenido**: Mostrar las capas: UI (Screens) → Services (NotificationService, FirebaseService, DatabaseService) → Models → Database/Firebase
- **Herramienta sugerida**: draw.io, Lucidchart, o cualquier herramienta de diagramas
- **Dimensiones sugeridas**: 1920x1080 px

### 4. **home_screen.png**
- **Descripción**: Pantalla principal de la aplicación
- **Contenido**: 
  - Token FCM en la parte superior
  - 4 botones: Instantánea (azul), Con Botones (verde), Programar (naranja), Ver Historial
- **Cómo obtenerla**: 
  - Ejecutar la app: `flutter run`
  - Tomar captura de la pantalla principal
- **Dimensiones sugeridas**: Screenshot del emulador/dispositivo

### 5. **schedule_screen.png**
- **Descripción**: Pantalla de programación de notificaciones
- **Contenido**:
  - Campos de título y mensaje
  - Selectores de fecha y hora
  - Resumen del tiempo restante
  - Botón "Programar Notificación"
- **Cómo obtenerla**: 
  - En la app, presionar botón naranja "Programar Notificación"
  - Llenar los campos con datos de ejemplo
  - Tomar captura

### 6. **notification_list.png**
- **Descripción**: Pantalla de historial de notificaciones
- **Contenido**:
  - Lista de notificaciones con diferentes colores (azul, verde, naranja)
  - Timestamps visibles
  - Botones de eliminar
- **Cómo obtenerla**:
  - Generar varias notificaciones de diferentes tipos
  - Ir a "Ver Historial"
  - Tomar captura

### 7. **notification_detail.png**
- **Descripción**: Pantalla de detalle de una notificación
- **Contenido**:
  - Badge con tipo de notificación
  - Título completo
  - Mensaje completo
  - Fecha y hora
  - ID
- **Cómo obtenerla**:
  - En el historial, hacer clic en una notificación
  - Tomar captura de la pantalla de detalle

### 8. **notification_instant.png**
- **Descripción**: Notificación instantánea en la barra de notificaciones
- **Contenido**: Notificación simple en la barra de notificaciones de Android
- **Cómo obtenerla**:
  - Presionar botón azul "Notificación Instantánea"
  - Deslizar la barra de notificaciones hacia abajo
  - Tomar captura mostrando la notificación

### 9. **notification_buttons.png**
- **Descripción**: Notificación con botones de acción
- **Contenido**: Notificación mostrando botones "Aceptar" y "Rechazar"
- **Cómo obtenerla**:
  - Presionar botón verde "Notificación con Botones"
  - Deslizar la barra de notificaciones
  - Expandir la notificación si es necesario
  - Tomar captura mostrando los botones

### 10. **notification_scheduled.png**
- **Descripción**: Notificación programada que llegó con app cerrada
- **Contenido**: Notificación en barra de notificaciones con la app cerrada
- **Cómo obtenerla**:
  - Programar una notificación para 2 minutos después
  - CERRAR la app completamente (swipe en recientes)
  - Esperar a que llegue la notificación
  - Tomar captura de la notificación en la barra

### 11. **firebase_console.png**
- **Descripción**: Firebase Console mostrando el envío de notificaciones
- **Contenido**: 
  - Formulario de Cloud Messaging
  - Campos de título y mensaje
  - Selector de target/audiencia
- **Cómo obtenerla**:
  - Ir a Firebase Console
  - Cloud Messaging → Send your first message
  - Tomar captura del formulario

### 12. **notification_background.png**
- **Descripción**: Notificación Firebase recibida en modo Background
- **Contenido**: Notificación en barra con app minimizada
- **Cómo obtenerla**:
  - Minimizar la app (botón Home)
  - Enviar notificación desde Firebase Console
  - Tomar captura de la notificación en barra

### 13. **notification_terminated.png**
- **Descripción**: Notificación Firebase recibida en modo Terminated
- **Contenido**: Notificación en barra con app completamente cerrada
- **Cómo obtenerla**:
  - Cerrar la app completamente (swipe en recientes)
  - Enviar notificación desde Firebase Console
  - Tomar captura de la notificación en barra

### 14. **androidmanifest.png**
- **Descripción**: Código del AndroidManifest.xml
- **Contenido**: 
  - Permisos configurados
  - Receivers configurados
- **Cómo obtenerla**:
  - Abrir `android/app/src/main/AndroidManifest.xml` en VS Code
  - Tomar captura mostrando los permisos y receivers
  - Asegurar que el texto sea legible

---

## 📐 Especificaciones Técnicas

### Formato de Imágenes
- **Formato recomendado**: PNG (mejor calidad, sin compresión)
- **Formato alternativo**: JPG (solo para capturas fotográficas)
- **Resolución mínima**: 1280x720 px
- **Resolución óptima**: 1920x1080 px o superior

### Calidad
- **DPI mínimo**: 150 DPI
- **DPI recomendado**: 300 DPI para impresión
- **Sin compresión excesiva**: Asegurar que el texto sea legible

### Nombres de Archivo
- Usar exactamente los nombres listados arriba
- Minúsculas, sin espacios, con guiones bajos
- Extensión .png

---

## 🛠️ Herramientas Recomendadas

### Para Capturas de Pantalla
- **Windows**: 
  - `Windows + Shift + S` (Snipping Tool)
  - Snip & Sketch
  - Greenshot (gratuito)
  - ShareX (gratuito, avanzado)

- **Android Emulator**:
  - Botón de cámara en la barra lateral del emulador
  - `Ctrl + S` dentro del emulador

- **Dispositivo Real**:
  - `Volumen Abajo + Power` (mayoría de Android)
  - `ADB`: `adb shell screencap -p /sdcard/screen.png`

### Para Diagramas
- **draw.io** (https://app.diagrams.net/) - Gratuito, en línea
- **Lucidchart** (https://www.lucidchart.com/) - Gratuito con límites
- **Figma** (https://www.figma.com/) - Gratuito
- **Excalidraw** (https://excalidraw.com/) - Gratuito, simple

---

## 📁 Estructura de Carpetas

```
docs/
├── template.tex
├── images/
│   ├── arquitectura.png
│   ├── home_screen.png
│   ├── schedule_screen.png
│   ├── notification_list.png
│   ├── notification_detail.png
│   ├── notification_instant.png
│   ├── notification_buttons.png
│   ├── notification_scheduled.png
│   ├── firebase_console.png
│   ├── notification_background.png
│   ├── notification_terminated.png
│   └── androidmanifest.png
├── sw-logo.png
└── decoration.png
```

---

## 🚀 Pasos para Generar el PDF

Una vez tengas todas las imágenes:

1. **Instalar LaTeX** (si no lo tienes):
   - Windows: MiKTeX (https://miktex.org/)
   - O TeX Live (https://www.tug.org/texlive/)

2. **Abrir terminal en la carpeta docs**:
   ```bash
   cd docs
   ```

3. **Compilar el documento**:
   ```bash
   pdflatex template.tex
   pdflatex template.tex
   ```
   (Ejecutar dos veces para referencias cruzadas)

4. **Alternativa: Usar Overleaf**:
   - Subir todos los archivos a Overleaf (https://www.overleaf.com/)
   - Compilar en línea (más fácil)

5. **Renombrar el PDF**:
   ```bash
   mv template.pdf viche_julio_2t2p.pdf
   ```

---

## ✅ Checklist Final

Antes de compilar, verifica:

- [ ] Todas las 14 imágenes están en `docs/images/`
- [ ] Los nombres de archivo coinciden exactamente
- [ ] Las imágenes tienen buena resolución (legibles)
- [ ] sw-logo.png y decoration.png están en `docs/`
- [ ] El link del video está insertado en template.tex
- [ ] Tu nombre está en la carátula

---

## 📝 Notas Adicionales

- Si una imagen no existe, LaTeX mostrará un rectángulo con el nombre del archivo
- Las notas en cursiva bajo las imágenes son solo referencias, no aparecerán en el PDF
- Para mejor calidad, toma las capturas en dispositivo real (no emulador)
- Asegúrate de que el texto en las capturas sea legible al 100% de zoom

---

**¡Buena suerte con tu manual!** 🎓
