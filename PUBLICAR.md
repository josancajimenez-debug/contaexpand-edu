# Publicar EEFF Consolidados en GitHub Pages

Esta guia deja la app en internet con un enlace, y hace que **cada cambio se
suba y se publique automaticamente**.

> El repositorio local ya quedo inicializado con el primer commit.
> Solo falta conectarlo a **tu** cuenta de GitHub (una sola vez).

---

## Paso 1 — Crear el repositorio en GitHub (una vez)

1. Entra a https://github.com e inicia sesion (o crea una cuenta gratis).
2. Arriba a la derecha: **+** -> **New repository**.
3. Nombre sugerido: `contaexpand-edu`.
4. Deja el resto por defecto. **Publico** (necesario para Pages gratis).
   - NO marques "Add a README" (ya tenemos archivos).
5. **Create repository**.

## Paso 2 — Conectar y subir (una vez)

En la carpeta del proyecto, abre una terminal (o Git Bash) y ejecuta,
reemplazando `TU-USUARIO`:

```
git remote add origin https://github.com/TU-USUARIO/contaexpand-edu.git
git branch -M main
git push -u origin main
```

La primera vez te pedira iniciar sesion en GitHub (se abre una ventana del
navegador o el Administrador de Credenciales de Windows). Acepta.

## Paso 3 — Activar GitHub Pages (una vez)

1. En el repo: **Settings** -> **Pages**.
2. En **Build and deployment** -> **Source**: elige **Deploy from a branch**.
3. **Branch**: `main` y carpeta `/ (root)`. **Save**.
4. Espera 1-2 minutos. Aparecera el enlace publico, del tipo:

   `https://TU-USUARIO.github.io/contaexpand-edu/`

Ese es el enlace que compartes con los estudiantes. Funciona en PC y movil
(pueden usar "Agregar a pantalla de inicio").

---

## Publicar cambios (automatico)

Cada vez que se modifique la app:

- **Opcion facil:** doble clic en **`publicar.bat`**. Sube todo y GitHub Pages
  se actualiza solo en 1-2 minutos.
- **Opcion manual (terminal):**
  ```
  git add -A
  git commit -m "Descripcion del cambio"
  git push
  ```

> Al usar "Deploy from a branch", **cada push publica automaticamente** la
> nueva version del sitio. No hay que hacer nada mas.

---

## Notas importantes

- El repositorio es **publico**: el codigo de la app y el logo (con el
  telefono) quedan visibles en internet.
- La carpeta **BIBLIOGRAFIA** y los respaldos **NO se suben** (estan excluidos
  en `.gitignore`) para no publicar PDFs con derechos de autor.
- El **progreso de cada estudiante se guarda en su propio navegador**
  (localStorage). Esto NO consolida el avance entre computadoras: para eso se
  necesita una version con backend y base de datos.
- La **clave de docente/administrador** es un control local (disuasorio); al
  ser codigo publico, no es una barrera de seguridad real.
