# Pruebas de regresion — EEFF Consolidados

Valida la aplicacion (un solo archivo `EEFF_Consolidados.html`) **sin navegador**,
ejecutando su JavaScript dentro de stubs de DOM/localStorage con Node.js.

## Requisito
- Node.js instalado: https://nodejs.org

## Como ejecutar
Desde la carpeta del proyecto:

```
node pruebas/verificar.js
```

o doble clic en **`verificar-pruebas.bat`** (en la raiz del proyecto).

## Que valida (50 comprobaciones)
- Que **todas las pantallas** rendericen sin error: Panel, Glosario (con busqueda),
  Bibliografia, Manual de usuario, Casos (los 6 filtros) y Reporte para los 3 roles.
- Las **4 unidades** con sus **6 pestanas** cada una (Contenido, Ejemplo,
  Ejercicios, Simulador, Autoevaluacion, Notas).
- Exportaciones (CSV/JSON) e impresion de unidad.
- **Calculos** de los simuladores (U1 = 42000, U3 = 184000, U4 = 104400).
- Que **los asientos de todos los casos cuadren** (Debe = Haber).
- Formateadores de importes (`fmtAmount`, `fmtImporte`) y logica de avance
  (pesos suman 100 %, `unitProgress` parte de 0).

## Resultado
- Codigo de salida **0** = todo bien.
- Codigo de salida **1** = alguna comprobacion fallo (revisar la lista impresa).

> Recomendado: ejecutar estas pruebas **antes de publicar** cambios con `publicar.bat`.
