# ✅ Checklist Final - Entrega del Trabajo

## 📋 Estado Actual

### ✅ Completado:
- [x] Aplicación Flutter completamente funcional
- [x] Notificaciones locales instantáneas implementadas
- [x] Notificaciones con botones implementadas
- [x] Notificaciones programadas con temporizador
- [x] Notificaciones Firebase (foreground, background, terminated)
- [x] Base de datos SQLite con historial
- [x] Sistema de navegación con rutas
- [x] 4 pantallas completas (Home, List, Detail, Schedule)
- [x] Configuración de permisos Android
- [x] Template LaTeX del manual creado
- [x] Documentación completa en IMPLEMENTACION.md

### ❌ Pendiente de Completar:

---

## 🎯 Tareas Restantes (En Orden)

### 1️⃣ Tomar Capturas de Pantalla (30 min)

**Ubicación:** `docs/images/`

**Lista completa de imágenes necesarias:**

| # | Archivo | Descripción | Cómo Obtenerla |
|---|---------|-------------|----------------|
| 1 | arquitectura.png | Diagrama de capas | Crear con draw.io |
| 2 | home_screen.png | Pantalla principal | Screenshot de la app |
| 3 | schedule_screen.png | Programar notificación | Screenshot |
| 4 | notification_list.png | Historial | Screenshot |
| 5 | notification_detail.png | Detalle | Screenshot |
| 6 | notification_instant.png | Notif. en barra | Screenshot |
| 7 | notification_buttons.png | Notif. con botones | Screenshot |
| 8 | notification_scheduled.png | Notif. programada | Screenshot |
| 9 | firebase_console.png | Firebase Console | Screenshot |
| 10 | notification_background.png | Notif. background | Screenshot |
| 11 | notification_terminated.png | Notif. terminated | Screenshot |
| 12 | androidmanifest.png | Código del manifest | Screenshot |

**Herramienta:** `Windows + Shift + S` o Snipping Tool

**Ver detalles en:** `docs/IMAGENES_NECESARIAS.md`

---

### 2️⃣ Grabar Video de Demostración (30-45 min)

**Requisitos:**
- ⏱️ Duración: 2-3 minutos
- 👤 Rostro visible TODO el tiempo
- 🖥️ Pantalla completa del computador
- 🎤 Audio claro con explicación

**Contenido del video:**
1. Introducción (15 seg)
2. Pantalla principal (15 seg)
3. Notificación instantánea (20 seg)
4. Notificación con botones (20 seg)
5. Programar notificación (30 seg)
6. Historial (20 seg)
7. Notificación background (20 seg)
8. Notificación terminated (20 seg)
9. Cierre (20 seg)

**Herramienta recomendada:** OBS Studio o Loom

**Guion detallado en:** `docs/GUIA_VIDEO.md`

---

### 3️⃣ Subir Video a Cuenta Institucional (5 min)

**Opciones:**
- Google Drive (recomendado)
- YouTube (no listado)

**Pasos:**
1. Subir video a Drive/YouTube
2. Configurar permisos: "Cualquiera con el enlace"
3. Copiar el link
4. **IMPORTANTE:** Probar el link en navegador incógnito

**Ejemplo de link:**
```
https://drive.google.com/file/d/1ABC123XYZ/view?usp=sharing
```

---

### 4️⃣ Insertar Link del Video en el Manual (2 min)

**Archivo:** `docs/template.tex`

**Buscar la línea:**
```latex
\textcolor{blue}{\textbf{[INSERTAR LINK DEL VIDEO AQUÍ]}}
```

**Reemplazar por:**
```latex
\url{https://drive.google.com/file/d/TU-ID-AQUI/view?usp=sharing}
```

---

### 5️⃣ Compilar el Manual en PDF (10 min)

**Opción A: Overleaf (Más Fácil)**
1. Ir a https://www.overleaf.com/
2. Subir carpeta `docs/` en un ZIP
3. Compilar automáticamente
4. Descargar PDF

**Opción B: Local (Si tienes LaTeX)**
```powershell
cd docs
pdflatex template.tex
pdflatex template.tex
```

**Instrucciones completas en:** `docs/COMO_COMPILAR.md`

---

### 6️⃣ Renombrar PDF (1 min)

**Nombre requerido:** `viche_julio_2t2p.pdf`

**Comando:**
```powershell
Rename-Item template.pdf viche_julio_2t2p.pdf
```

---

### 7️⃣ Comprimir Código Fuente en ZIP (5 min)

**Incluir en el ZIP:**
```
viche_julio_2t2p.zip
├── lib/                  (TODO el código)
├── android/              (Configuraciones)
├── pubspec.yaml
├── pubspec.lock
├── analysis_options.yaml
├── firebase.json
└── README.md (opcional)
```

**NO incluir:**
- build/
- .dart_tool/
- .idea/
- .vscode/

**Comando PowerShell:**
```powershell
Compress-Archive -Path lib,android,pubspec.yaml,pubspec.lock,analysis_options.yaml,firebase.json -DestinationPath viche_julio_2t2p.zip
```

**O usar:** WinRAR / 7-Zip manualmente

---

### 8️⃣ Verificación Final (5 min)

**Checklist antes de entregar:**

- [ ] PDF se llama: `viche_julio_2t2p.pdf`
- [ ] PDF contiene TODAS las imágenes (no hay rectángulos vacíos)
- [ ] PDF tiene el link del video
- [ ] Link del video funciona (probado)
- [ ] Video dura 2-3 minutos
- [ ] Tu rostro es visible en el video TODO el tiempo
- [ ] ZIP se llama: `viche_julio_2t2p.zip`
- [ ] ZIP contiene carpeta `lib/` completa
- [ ] ZIP contiene carpeta `android/` con configuraciones
- [ ] ZIP incluye `pubspec.yaml`
- [ ] Tamaño del PDF es razonable (<30 MB)
- [ ] Tamaño del ZIP es razonable (<50 MB)

---

## 📦 Archivos Finales a Entregar

```
📄 viche_julio_2t2p.pdf     (Manual de desarrollador con imágenes y link)
📦 viche_julio_2t2p.zip     (Código fuente de la aplicación)
```

---

## ⏱️ Tiempo Estimado Total

| Tarea | Tiempo Estimado |
|-------|-----------------|
| Tomar capturas | 30 minutos |
| Grabar video | 30-45 minutos |
| Subir video | 5 minutos |
| Insertar link en manual | 2 minutos |
| Compilar PDF | 10 minutos |
| Renombrar archivos | 1 minuto |
| Comprimir código | 5 minutos |
| Verificación final | 5 minutos |
| **TOTAL** | **~1.5 - 2 horas** |

---

## 🚀 Plan de Acción Recomendado

### Sesión 1 (1 hora):
1. ✅ Ejecutar la app: `flutter run`
2. ✅ Tomar todas las capturas de pantalla
3. ✅ Guardar en `docs/images/`
4. ✅ Crear diagrama de arquitectura (draw.io)

### Sesión 2 (45 min):
1. ✅ Configurar OBS Studio o Loom
2. ✅ Practicar el guion una vez
3. ✅ Grabar el video completo
4. ✅ Revisar que se vea y escuche bien

### Sesión 3 (30 min):
1. ✅ Subir video a Google Drive/YouTube
2. ✅ Configurar permisos
3. ✅ Copiar link
4. ✅ Insertar link en template.tex
5. ✅ Compilar PDF (Overleaf o local)
6. ✅ Renombrar PDF
7. ✅ Comprimir código en ZIP
8. ✅ Renombrar ZIP
9. ✅ Verificación final
10. ✅ **ENTREGAR**

---

## 📞 Recursos de Ayuda

| Archivo | Descripción |
|---------|-------------|
| `IMAGENES_NECESARIAS.md` | Lista detallada de todas las imágenes |
| `GUIA_VIDEO.md` | Guion completo para el video |
| `COMO_COMPILAR.md` | Instrucciones para compilar el PDF |
| `IMPLEMENTACION.md` | Documentación técnica completa |

---

## ⚠️ Errores Comunes a Evitar

1. ❌ **Olvidar incluir el rostro en el video**
   - ✅ Usa OBS con webcam overlay o Loom

2. ❌ **Link del video sin permisos**
   - ✅ Configurar: "Cualquiera con el enlace puede ver"

3. ❌ **Imágenes con nombres incorrectos**
   - ✅ Usar nombres exactos: `home_screen.png` (no `home screen.png`)

4. ❌ **PDF sin todas las imágenes**
   - ✅ Verificar que no haya rectángulos vacíos

5. ❌ **Nombres de archivo incorrectos**
   - ✅ Usar: `viche_julio_2t2p.pdf` y `viche_julio_2t2p.zip`

6. ❌ **Video demasiado largo o corto**
   - ✅ Mantener entre 2-3 minutos

7. ❌ **Incluir carpeta build/ en el ZIP**
   - ✅ Solo incluir: lib/, android/, pubspec.yaml, etc.

8. ❌ **Compilar solo una vez el PDF**
   - ✅ Ejecutar `pdflatex` DOS veces

---

## 🎯 Criterios de Evaluación (Posibles)

Basado en los requisitos, probablemente evalúen:

- ✅ **Funcionalidad completa** (30%)
  - Notificaciones locales, remotas, programadas
  - Foreground, background, terminated
  
- ✅ **Manual completo** (30%)
  - Explicación paso a paso
  - Imágenes claras y HD
  - Link del video incluido
  
- ✅ **Video demostrativo** (25%)
  - Duración correcta
  - Rostro visible
  - Demuestra todas las funcionalidades
  
- ✅ **Código fuente** (15%)
  - Organización
  - Arquitectura
  - Documentación

---

## 🏁 Última Verificación

Antes de hacer clic en "Enviar":

```
✅ Tengo el archivo: viche_julio_2t2p.pdf
✅ El PDF tiene TODAS las imágenes
✅ El PDF tiene el link del video
✅ El link del video FUNCIONA (probado)
✅ El video dura 2-3 minutos
✅ Mi rostro es visible en el video
✅ Tengo el archivo: viche_julio_2t2p.zip
✅ El ZIP contiene lib/ y android/
✅ He probado ambos archivos en otra computadora (opcional pero recomendado)
```

---

**¡Todo está listo para entregar! Solo falta ejecutar las tareas pendientes.** 💪

**Tiempo restante estimado: 1.5 - 2 horas**

**¡Mucho éxito!** 🎓
