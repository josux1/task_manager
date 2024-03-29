# Sistema de gestión de tareas
El proyecto es un aplicación móvil, que permite a los usuarios administrar sus tareas. 

# Funciones principales
### TaskManager
- Leer las tareas atraves de la api.
- Crear nuevas tareas atraves de la api.
- Eliminar tareas atraves de la api.
- Actualizar tareas atraves de la api.
- Comprobación de red de internet.
- Pull to Refresh.

### Arquitectura

Este proyecto está hecho con la arquitectura MVVC con DDD (Modelo Vista - Vista Controlador. Con Domain Driven Design) para Flutter.

- Repository
- Service
- Provider
- Controller
- Screen

| Capa | Función |
| ------ | ------ |
| Repository | Se encarga de géstionar todas las comunicaciones por peticiones http con los servicios que se le conecten. |
| Service | Se encarga de géstionar toda la lógica de negocio del modulo. Ej. Si es módulo de Pérfil. El service se encarga de pasarle toda la informacion que viene del Repository, como se requiera, al controller.
| Provider | Se encarga de dar la referencia al controller. Provee la instancia del Service al controller.|
| Controller | Se encarga de administrar toda la logica visual del screen. Le pasa toda la informacion que viene del service al screen. Ej. Muestra cuadros de Diálogo, Modales etc. |
| Screen | Se encarga de mostrar toda la pantalla del módulo.  |

### Info Versionamiento

 Versón de Flutter
• Flutter 3.19.3
• Dart 3.3.1
• App Version 1.0.0