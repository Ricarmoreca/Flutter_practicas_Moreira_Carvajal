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

La API concreta se elegirá después. Estas rutas son requisitos, no
direcciones de un servidor ya conectado.