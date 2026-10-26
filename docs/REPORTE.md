# Reporte del proyecto – Oaxaca Turismo

**Asignatura:** Desarrollo de Aplicaciones Móviles · **Unidad 3**
**Integrantes:** _Nombre A_ y _Nombre B_ · **Repositorio:** _URL_

## 1. Descripción
Catálogo de destinos turísticos de Oaxaca con búsqueda, categorías y favoritos, alimentado por JSON local con imágenes remotas.

## 2. Arquitectura
Arquitectura por capas (core, models, data, providers, screens, widgets). Explicar aquí el flujo JSON → Datasource → Repository → Provider → UI y por qué se separó así (responsabilidad única, facilidad de prueba y de trabajo en pareja).

## 3. Mapeo de JSON
Describir `destinos.json` y `categorias.json`, y los `fromJson` estrictos de `Destination` y `Category` (casts tipados, errores controlados en `CatalogProvider.load`).

## 4. Pantallas y widgets
| Pantalla | Propósito |
|---|---|
| Welcome | Bienvenida y resumen |
| Home | Catálogo, búsqueda, filtros |
| Detail | Información del destino |
| Favorites | Favoritos |
| Categories | Lista de categorías |
| CategoryResults | Destinos por categoría |

Widgets: ver README (14). _Agregar capturas._

## 5. Diseño y UX
Paleta: verde salvia `#5B8E7D`, arena `#D9A066`, fondo `#F7F5F0`, texto `#2F3E46`. Tarjetas redondeadas, márgenes de 16 px, estados vacíos y de carga.

## 6. Flujo Git
Tabla de ramas, PRs (enlaces) y distribución de commits por integrante.

## 7. Los 5 conflictos de merge
Por cada uno: archivo, ramas, captura del conflicto, cómo se resolvió y enlace al PR.

## 8. Conclusiones
_Aprendizajes y dificultades de cada integrante._
