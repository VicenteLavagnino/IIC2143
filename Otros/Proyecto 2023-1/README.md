# 2023-1-grupo-66

## Info
Repositorio sobre MyBread, una panedería virtual.

Los CRUD están implementados, pero no se puede interactuar con la BD desde la UI.

El diagrama de entidad-relación se puede encontrar en /docs

## Producción
  * [MyBread](https://mybread.onrender.com/)

## Installation
1. Clone the repo
```sh
git clone https://github.com/IIC2143/2023-1-grupo-66.git
```
2. Instalar las gemas (mac)
```sh
brew bundle
```
3. Correr el proyecto
```sh
rails s

```
## Consideraciones

1. En la revisión del rubocop, se exceptuaron algunos archivos relacionados al manejo de device, tales como 
``` "app/controllers/users/registrations_controller.rb" ```

2. Las secciones Products, Reviews y Requests no son funcionalmente compatibles en su operatividad debido a que el enfoque de este sprint fue categorizarlas y hacerlas operar de manera individual y relacionadamente y no como subcategorías dependiente de otra.

## Admin access

Active Admin en /admin

```
admin@example.com
password
```

