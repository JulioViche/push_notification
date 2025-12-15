# 📄 Instrucciones para Compilar el Manual en PDF

## 🎯 Pasos Rápidos

### 1. Preparar las Imágenes

Primero, debes tomar todas las capturas de pantalla necesarias. Revisa el archivo `IMAGENES_NECESARIAS.md` para la lista completa.

**Ubicación de imágenes**: `docs/images/`

**Lista mínima requerida:**
- arquitectura.png
- home_screen.png
- schedule_screen.png
- notification_list.png
- notification_detail.png
- notification_instant.png
- notification_buttons.png
- notification_scheduled.png
- firebase_console.png
- notification_background.png
- notification_terminated.png
- androidmanifest.png

### 2. Agregar el Link del Video

Edita el archivo `template.tex` y busca la línea:

```latex
\textcolor{blue}{\textbf{[INSERTAR LINK DEL VIDEO AQUÍ]}}
```

Reemplázala con tu link real:

```latex
\textcolor{blue}{\url{https://drive.google.com/file/d/tu-id-de-video}}
```

O simplemente:

```latex
\url{https://drive.google.com/file/d/tu-id-de-video}
```

### 3. Verificar Nombre en la Carátula

Busca la línea que dice:

```latex
{\LARGE \color{coloralumno} \textbf{Julio Viche}}\\[1cm]
```

Si es necesario, cambia el nombre.

---

## 🖥️ Opción 1: Compilar en Overleaf (Más Fácil)

**Recomendado si no tienes LaTeX instalado**

1. Ve a https://www.overleaf.com/
2. Crea una cuenta gratuita
3. Haz clic en "New Project" → "Upload Project"
4. Comprime la carpeta `docs/` en un ZIP
5. Sube el ZIP a Overleaf
6. Espera a que compile automáticamente
7. Descarga el PDF generado
8. Renombra el archivo a: `viche_julio_2t2p.pdf`

**Ventajas:**
- No necesitas instalar nada
- Compila automáticamente
- Muestra errores claramente
- Gratuito

---

## 🖥️ Opción 2: Compilar Localmente (Windows)

### Paso 1: Instalar MiKTeX

1. Descarga MiKTeX: https://miktex.org/download
2. Ejecuta el instalador
3. Durante la instalación:
   - Selecciona "Install missing packages on-the-fly: Yes"
   - Instala para "Anyone who uses this computer"
4. Espera a que termine la instalación (puede tomar 10-15 minutos)

### Paso 2: Instalar Editor (Opcional)

**TeXstudio** (Recomendado para principiantes):
1. Descarga: https://www.texstudio.org/
2. Instala normalmente
3. Abre `template.tex` con TeXstudio
4. Presiona F5 para compilar

**O usar VS Code** (si ya lo tienes):
1. Instala la extensión "LaTeX Workshop"
2. Abre `template.tex`
3. Guarda el archivo (Ctrl+S) para compilar automáticamente

### Paso 3: Compilar desde Terminal

Abre PowerShell en la carpeta `docs`:

```powershell
cd d:\julio\Android\AndoridStudioProjects\push_notification\docs
pdflatex template.tex
pdflatex template.tex
```

**¿Por qué dos veces?** La primera compila el contenido, la segunda actualiza referencias cruzadas.

### Paso 4: Renombrar el PDF

```powershell
Rename-Item template.pdf viche_julio_2t2p.pdf
```

---

## 🖥️ Opción 3: Usar Docker (Avanzado)

Si tienes Docker instalado:

```bash
docker run --rm -v "${PWD}:/workspace" -w /workspace texlive/texlive pdflatex template.tex
docker run --rm -v "${PWD}:/workspace" -w /workspace texlive/texlive pdflatex template.tex
```

---

## ⚠️ Solución de Problemas

### Error: "File not found: sw-logo.png"

**Solución**: Asegúrate de que los archivos `sw-logo.png` y `decoration.png` estén en la carpeta `docs/` (no en `docs/images/`)

### Error: "File not found: home_screen.png"

**Solución**: Verifica que todas las imágenes estén en `docs/images/` y con los nombres exactos (minúsculas, guiones bajos)

### Error: "Package not found"

**Solución**: 
- En MiKTeX: Acepta instalar paquetes cuando te lo pida
- O ejecuta: `mpm --install=missing-packages`

### Error: "Undefined control sequence"

**Solución**: Revisa que no hayas modificado comandos LaTeX sin querer. Compara con el original.

### Error: Imágenes muy grandes o muy pequeñas

**Solución**: Edita el `template.tex` y ajusta los anchos:

```latex
\includegraphics[width=0.5\textwidth]{imagen.png}
```

Cambia `0.5` por otro valor (0.3 = 30%, 0.7 = 70%, etc.)

### Error: Texto en código se sale del margen

**Solución**: Ya está configurado `breaklines=true`, pero si persiste, reduce el tamaño de fuente en la configuración de listings.

---

## 📊 Verificar Calidad del PDF

Antes de entregar, verifica:

1. **Imágenes claras**: Haz zoom al 200% y verifica que el texto sea legible
2. **Todas las imágenes cargadas**: No debe haber rectángulos con nombres de archivo
3. **Link del video funcional**: Cópialo y pruébalo en un navegador
4. **Nombre correcto**: El PDF debe llamarse `viche_julio_2t2p.pdf`
5. **Todas las páginas**: El manual debe tener al menos 20-25 páginas

---

## 📏 Tamaño del PDF

El PDF generado debería tener:
- **Tamaño aproximado**: 5-15 MB (dependiendo de las imágenes)
- **Páginas**: 20-30 páginas
- **Formato**: A4

Si el PDF es muy grande (>30 MB), comprime las imágenes antes de insertarlas.

---

## 🎨 Personalización Adicional (Opcional)

### Cambiar colores de la carátula:

En `template.tex`, busca:

```latex
\definecolor{colorcarrera}{HTML}{485057}
\definecolor{colormateria}{HTML}{C45911}
```

Cambia los códigos hexadecimales por los que prefieras.

### Agregar más contenido:

Puedes agregar secciones adicionales antes de `\section*{Conclusiones...}`:

```latex
\subsection*{14. Características Adicionales}

Texto aquí...
```

---

## 📤 Entregar el Trabajo

Una vez compilado el PDF:

1. ✅ Verificar nombre: `viche_julio_2t2p.pdf`
2. ✅ Verificar que incluye el link del video
3. ✅ Verificar que todas las imágenes están presentes
4. ✅ Crear el ZIP del código: `viche_julio_2t2p.zip`
5. ✅ Subir ambos archivos a la plataforma

---

## 🚀 Comando Único (PowerShell)

Si ya tienes todo listo, ejecuta:

```powershell
cd d:\julio\Android\AndoridStudioProjects\push_notification\docs
pdflatex template.tex
pdflatex template.tex
Rename-Item template.pdf viche_julio_2t2p.pdf
explorer .
```

Esto:
1. Navega a la carpeta
2. Compila el PDF (dos veces)
3. Renombra el archivo
4. Abre la carpeta en el explorador

---

## 📞 Ayuda Adicional

Si tienes problemas:

1. Revisa los logs de compilación (template.log)
2. Busca la línea que dice "Error" o "!"
3. Google el error específico + "latex"
4. Considera usar Overleaf si es muy complicado localmente

---

**¡Éxito con tu entrega!** 🎓
