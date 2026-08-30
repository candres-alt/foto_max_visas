# Foto Max Visas

Aplicación móvil desarrollada en Flutter como proyecto académico.

## Descripción

La aplicación permite al usuario ingresar un Application ID y preparar una consulta relacionada con el estado de una visa.

También incluye acceso directo al sitio oficial CEAC mediante el paquete externo `url_launcher`.

## Tecnologías utilizadas

- Flutter
- Dart
- Android Studio
- Visual Studio Code
- Git
- GitHub

## Funcionalidades

- Interfaz desarrollada con Material Design.
- Campo para ingresar Application ID.
- Botón para consultar estado.
- Mensaje dinámico mediante `setState`.
- Acceso al sitio oficial CEAC.
- Uso del paquete externo `url_launcher`.
- Ejecución en emulador Android Pixel 7.

## Control de versiones

El proyecto fue desarrollado utilizando Git y GitHub, registrando los avances mediante diferentes commits.

## Autor

Carlos Andres Barberan


---

# Actividad Integradora 2

## Desarrollo de una Aplicación Flutter con Navegación y Nuevos Widgets

### Descripción

Para la Actividad Integradora 2 se continuó mejorando la aplicación **Foto Max Visas**, desarrollada originalmente en la Actividad Integradora 1.

En esta nueva versión se incorporaron nuevas pantallas, navegación mediante `Navigator`, nuevos widgets de Flutter, interacciones con el usuario, manejo de estado mediante `setState()`, uso de un paquete externo y una mejor organización del proyecto mediante carpetas.

---

## Nuevas funcionalidades

La aplicación ahora cuenta con:

- Pantalla principal de bienvenida.
- Navegación entre diferentes pantallas mediante `Navigator.push`.
- Consulta de visa mediante Application ID.
- Acceso al portal oficial CEAC.
- Catálogo de servicios mediante `GridView`.
- Sistema de servicios favoritos.
- Cambio visual del icono de favorito mediante `setState()`.
- Mensajes mediante `SnackBar`.
- Ventanas informativas mediante `AlertDialog`.
- Pantalla de contacto y ayuda.
- Acceso a recursos oficiales externos mediante `url_launcher`.
- Diseño personalizado con logo, colores e icono de Foto Max Visas.

---

## Pantallas de la aplicación

### 1. Inicio

Es la pantalla principal de la aplicación. Presenta el logo de Foto Max Visas y permite acceder a las demás funciones.

Desde esta pantalla se puede navegar hacia:

- Consultar Visa
- Servicios
- Contacto y Ayuda

![Pantalla Inicio](capturas/actividad_2/A2-01-Inicio.png)

---

### 2. Consultar Visa

Permite ingresar un `Application ID` y acceder al sistema oficial CEAC para consultar el estado de una solicitud.

La pantalla utiliza `setState()` para modificar el mensaje mostrado al usuario después de ingresar el número de solicitud.

![Pantalla Consultar Visa](capturas/actividad_2/A2-02-Consulta-Visa.png)

![Consulta utilizando setState](capturas/actividad_2/A2-03-Consulta-setState.png)

---

### 3. Servicios

Presenta diferentes servicios mediante un `GridView`.

Cada servicio utiliza una tarjeta reutilizable desarrollada en el archivo:

`lib/widgets/service_card.dart`

El usuario puede marcar o desmarcar servicios como favoritos mediante un botón con forma de corazón.

![Servicios mediante GridView](capturas/actividad_2/A2-04-Servicios-GridView.png)

![Favoritos y SnackBar](capturas/actividad_2/A2-05-Favoritos-SnackBar.png)

---

### 4. Contacto y Ayuda

Esta pantalla contiene recursos de ayuda e información para el usuario.

Permite:

- Consultar asistencia.
- Mostrar información mediante `AlertDialog`.
- Acceder al sitio oficial CEAC.
- Acceder a información oficial sobre visas.
- Consultar información acerca de Foto Max Visas.

![Pantalla Contacto y Ayuda](capturas/actividad_2/A2-06-Contacto-Ayuda.png)

![AlertDialog](capturas/actividad_2/A2-07-AlertDialog.png)

![Asistencia](capturas/actividad_2/A2-08-Asistencia-AlertDialog.png)

---

## Navegación

La navegación entre las pantallas se realiza mediante:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const ConsultaScreen(),
  ),
);