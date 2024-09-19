---

# Cat Breeds - Flutter App

**Cat Breeds** es una aplicación desarrollada en **Flutter** que muestra una lista de razas de gatos obtenida de [The Cat API](https://developers.thecatapi.com/). La aplicación sigue principios de **Clean Code**, **Clean Architecture** y utiliza el patrón de diseño **BLoC** (Business Logic Component) para gestionar los estados y eventos de la aplicación.

## Tabla de Contenidos

- [Descripción del Proyecto](#descripción-del-proyecto)
- [Estructura de Archivos](#estructura-de-archivos)
- [Principios Aplicados](#principios-aplicados)
  - [Clean Code](#clean-code)
  - [Clean Architecture](#clean-architecture)
  - [Patrón BLoC](#patrón-bloc)
- [Plugins Utilizados](#plugins-utilizados)
- [Instrucciones de Ejecución](#instrucciones-de-ejecución)
- [API Utilizada](#api-utilizada)
- [Contribuciones](#contribuciones)
- [Licencia](#licencia)

## Descripción del Proyecto

Esta aplicación permite a los usuarios explorar una variedad de razas de gatos, filtrarlas mediante un buscador y acceder a información detallada de cada raza, incluyendo su país de origen, nivel de inteligencia y una descripción completa.

Características clave:

- **Splash Screen** con un logo de gato y un indicador de carga.
- **Landing Page** con un buscador funcional que permite filtrar las razas de gatos por nombre.
- **Cards** con el nombre de la raza, una imagen, su país de origen y nivel de inteligencia.
- **Vista de detalles** de cada raza con información extendida.
- Uso del patrón **BLoC** para el manejo de estados y la lógica de la aplicación.

## Estructura de Archivos

El proyecto sigue una estructura que respeta la **Clean Architecture**. A continuación, se presenta un desglose de las carpetas y archivos principales:

```plaintext
lib/
│
├── blocs/                        # Manejo de la lógica de estados y eventos con BLoC
│   └── breed_bloc.dart
│
├── core/                         # Manejo de utilidades y errores comunes
│   └── errors/
│       └── failure.dart
│
├── data/                         # Fuentes de datos y modelo de datos
│   ├── datasources/
│   │   └── breed_remote_datasource.dart   # Llamadas a la API
│   ├── models/
│   │   └── breed_model.dart               # Modelo de datos
│   └── repositories/
│       └── breed_repository_impl.dart     # Implementación del repositorio
│
├── domain/                       # Capa de dominio (independiente de frameworks)
│   ├── entities/
│   │   └── breed.dart                    # Entidad de dominio
│   ├── repositories/
│   │   └── breed_repository.dart         # Contrato del repositorio
│   └── usecases/
│       └── get_breeds.dart               # Caso de uso (obtener razas)
│
├── ui/                           # Presentación (UI)
│   ├── screens/                  # Pantallas
│   │   ├── detail_view.dart      # Vista de detalles de una raza
│   │   ├── landing_view.dart     # Pantalla principal con buscador y cards
│   │   └── splash_screen.dart    # Pantalla de carga inicial (splash screen)
│   └── widgets/                  # Widgets reutilizables
│       └── breed_card.dart       # Widget para mostrar la tarjeta de una raza
│
└── main.dart                     # Entrada principal del proyecto
```

### Principios Aplicados

#### Clean Code

El código sigue principios de **Clean Code**:

- **Nombres significativos**: Cada clase, método y variable tiene un nombre claro y descriptivo.
- **Funciones pequeñas**: Cada función cumple con una única responsabilidad.
- **Evitar duplicación**: La lógica reutilizable se encapsula en métodos y clases reutilizables.

#### Clean Architecture

La aplicación sigue la **Clean Architecture**, lo que garantiza que las diferentes capas de la aplicación estén desacopladas entre sí. Esto mejora la mantenibilidad y escalabilidad del proyecto.

- **Capa de dominio**: Contiene las entidades y los casos de uso. Es independiente de cualquier framework.
- **Capa de datos**: Contiene las fuentes de datos, como la API, y transforma los datos entre el formato del dominio y los modelos de datos.
- **Capa de presentación**: Gestiona la UI y se comunica con la capa de dominio a través del patrón BLoC.

#### Patrón BLoC (Business Logic Component)

El patrón **BLoC** se usa para separar la lógica de la interfaz de usuario. Esto permite manejar el flujo de datos (eventos y estados) de manera eficiente:

- Los **eventos** desencadenan cambios en los estados.
- La UI **observa** los estados y se actualiza cuando cambia el estado.

El Bloc maneja la obtención de las razas de gatos desde la API y actualiza la UI dependiendo de si los datos se cargaron, si hubo un error o si la carga está en progreso.

### Plugins Utilizados

Si es necesario instalar algún plugin adicional, aquí están algunos que podrían ser requeridos:

1. **flutter_bloc**: Para implementar el patrón BLoC.

   ```yaml
   dependencies:
     flutter_bloc: ^7.0.0
   ```

2. **http**: Para hacer solicitudes HTTP a la API.

   ```yaml
   dependencies:
     http: ^0.13.0
   ```

### Instrucciones de Ejecución

Para ejecutar este proyecto en tu entorno local, sigue los pasos a continuación:

1. Clona el repositorio:

   ```bash
   git clone https://github.com/Luarsami/cat-breeds.git
   ```

2. Navega al directorio del proyecto:

   ```bash
   cd cat-breeds
   ```

3. Instala las dependencias:

   ```bash
   flutter pub get
   ```

4. Ejecuta el proyecto en un dispositivo emulado o físico:

   ```bash
   flutter run
   ```

### API Utilizada

La aplicación consume la API de [The Cat API](https://developers.thecatapi.com/), que proporciona información sobre diferentes razas de gatos. Se utiliza el endpoint `/v1/breeds` para obtener una lista de razas, y se pasan los datos relevantes como:

- Nombre de la raza.
- Imagen de la raza.
- País de origen.
- Nivel de inteligencia.

### Contribuciones

Las contribuciones son bienvenidas. Si deseas contribuir a este proyecto, por favor realiza un **fork** del repositorio, crea una **rama** con tus cambios y envía un **pull request**.

1. Haz un **fork** del proyecto.
2. Crea una nueva rama (`git checkout -b feature/nueva-funcionalidad`).
3. Realiza los cambios necesarios y haz un commit (`git commit -m 'Añadir nueva funcionalidad'`).
4. Envía tus cambios (`git push origin feature/nueva-funcionalidad`).
5. Abre un **pull request**.

### Licencia

Este proyecto está bajo la licencia MIT. Puedes consultar el archivo [LICENSE](LICENSE) para más detalles.

---
