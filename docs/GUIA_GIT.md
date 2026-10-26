# Guía Git: ramas, Pull Requests y los 5 conflictos de merge

Integrantes: **A** y **B**. Regla: nadie hace commit directo en `main`; todo por rama + Pull Request.

## 0. Preparación (A)
```bash
git init && git add . && git commit -m "chore: proyecto base"   # commit inicial en main (único permitido)
git branch -M main
git remote add origin https://github.com/USUARIO/oaxaca_turismo.git
git push -u origin main
```
B clona el repo: `git clone <url>`. Activar protección de `main` en GitHub (Settings → Branches) exigiendo PR.

## 1. Reparto de ramas (actividad equilibrada)
| Rama | Responsable | Contenido |
|---|---|---|
| `feature/tema-y-widgets-base` | A | app_theme, widgets base |
| `feature/modelos-y-datos` | B | modelos, datasource, repository, JSON |
| `feature/provider-estado` | B | CatalogProvider |
| `feature/pantalla-home` | A | HomeScreen |
| `feature/pantalla-detalle` | B | DetailScreen |
| `feature/favoritos-y-categorias` | A | Favorites, Categories, CategoryResults |
| `feature/bienvenida` | B | WelcomeScreen, main.dart |

Haz commits pequeños (`feat:`, `fix:`, `style:`) y abre un PR por rama con descripción: qué cambia, cómo probarlo, captura. El compañero revisa y aprueba antes de fusionar (Merge commit para que se vea el árbol).

## 2. Los 5 conflictos (provocarlos deliberadamente)
Plantilla para cada uno, ya con las ramas creadas desde el mismo `main`:
```bash
# A
git checkout -b conflicto/N-a main     # edita la línea indicada, commit, push, PR a main, merge
# B (sin actualizar su rama con lo de A)
git checkout -b conflicto/N-b main     # edita LA MISMA línea distinto, commit, push, abre PR
# Al intentar fusionar B -> main aparece el conflicto:
git checkout conflicto/N-b
git pull origin main                   # o: git merge origin/main
# Git marca <<<<<<< HEAD ... ======= ... >>>>>>>
# Resuelve a mano conservando lo valioso de ambos, luego:
git add <archivo>
git commit -m "merge: resuelve conflicto N en <archivo>"
git push
```
| # | Archivo | Línea a modificar | Cambio de A | Cambio de B | Resolución sugerida |
|---|---|---|---|---|---|
| 1 | `lib/core/app_theme.dart` | `static const primary` | `0xFF5B8E7D` → `0xFF4F8A78` | `0xFF5B8E7D` → `0xFF6A9C8B` | Elegir un tono y acordarlo |
| 2 | `lib/screens/home_screen.dart` | `title: const Text('Destinos')` | `'Destinos Oaxaca'` | `'Explora Oaxaca'` | Elegir un título |
| 3 | `lib/widgets/destination_card.dart` | `borderRadius: BorderRadius.circular(16)` en el Card + `height: 160` de la imagen | radio 20 | radio 12 y altura 180 | Combinar: radio 16, altura 180 |
| 4 | `assets/data/destinos.json` | destino id 1: `calificacion` y `precioMxn` | `4.9` y `95` | `4.8` y `100` | Mantener valores correctos |
| 5 | `pubspec.yaml` | `description:` | texto A | texto B | Redactar uno final |

Para cada conflicto **guarda evidencia** (exigida por la rúbrica): captura del archivo con marcadores `<<<<<<<`, salida de `git status`, captura del commit de merge y el enlace al PR. Al terminar, `git log --graph --oneline --all` muestra el árbol con los merges.

## 3. Verificación final
- `git shortlog -sn` → commits repartidos entre A y B.
- Ningún commit directo a `main` salvo el inicial.
- `flutter analyze` sin errores y la app sin overflows antes del último PR.
