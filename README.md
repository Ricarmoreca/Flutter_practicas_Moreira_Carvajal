# taskflow

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Alcance de TaskFlow

Problema: Necesito organizar inventario de productos para no haber margen de error.
Usuario objetivo: Empleado de supermercado que verifica productos.

### Historias de usuario y criterios de aceptación
1. Como empleado, quiero listar los productos que hay dentro de la aplicación.
   Criterio: la lista muestra título, prioridad y estado de cada producto.
2. Como empleado, quiero abrir un producto para leer su descripción.
   Criterio: al tocar una tarjeta aparece el detalle del producto elegido.
3. Como empleado, quiero agregar más productos para registrar mercadería nueva.
   Criterio: el formulario guarda un producto válido y la lista lo muestra.
4. Como empleado, quiero editar un producto para corregir sus datos.
   Criterio: los cambios guardados aparecen en lista y detalle.
5. Como empleado, quiero eliminar un producto que no volverá a restock para limpiar la lista.
   Criterio: después de confirmar, el producto desaparece de la lista.

### Modelo de datos
Task: id (entero único), title (texto), description (texto),
priority (Alta, Media o Baja), isCompleted (en stock/agotado),
userId (entero que identifica al usuario de prueba).

### Pantallas previstas
Lista: tarjetas de tareas y acción para crear.
Detalle: información completa y futuras acciones de editar o eliminar.
Formulario: campos de título, descripción y prioridad.

### Requisitos no funcionales
La navegación debe tener textos comprensibles.
Un id inexistente debe mostrar un mensaje en vez de cerrar la app.

### Contrato de API que necesitaremos
GET /products          listar productos
GET /products/:id      consultar detalle
POST /products         agregar producto
PATCH /products/:id    actualizar producto
DELETE /products/:id   eliminar producto

Estas rutas describen el contrato pendiente para productos; no corresponden a
la API de tareas conectada actualmente.

## API de tareas

TaskFlow consulta tareas de JSONPlaceholder mediante una petición `GET` a:

`https://jsonplaceholder.typicode.com/todos?userId=2`

El parámetro de consulta `userId` filtra las tareas del usuario. TaskFlow usa
el valor `2` en `TaskApiService`; al comprobar la URL, la API devolvió 20
tareas, con IDs del 21 al 40.

Cada objeto recibido incluye los campos `userId`, `id`, `title` y `completed`.
`Task.fromJson` asigna esos campos al modelo (`completed` se convierte en
`isCompleted`) y completa los campos que la API no envía con estos valores:

- `description`: `Sin descripción (API)`
- `priority`: `Sin prioridad (API)`

Marcar una tarea como completada o pendiente solo actualiza el estado en
memoria dentro de TaskFlow; el cambio no se envía a la API ni queda guardado al
recargar.