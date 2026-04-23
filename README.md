# Monitor de Clima - Cartagena

Aplicación móvil desarrollada en Flutter para la consulta del clima en tiempo real. Este proyecto implementa una arquitectura basada en servicios y utiliza **n8n** como motor de orquestación y automatización para consumir y procesar los datos de la API de OpenWeatherMap.

## Descripción del Proyecto

El objetivo de esta aplicación es demostrar la integración de tecnologías frontend móviles con flujos de trabajo automatizados (Webhooks). La app no consulta la API del clima directamente, sino que delega esa responsabilidad a un flujo de n8n, lo que permite centralizar la lógica de negocio, escalar peticiones y manejar errores desde el orquestador sin modificar el código cliente.

### Características Principales
- **Diseño Glassmorphism:** Interfaz inmersiva con fondos degradados dinámicos y tarjetas translúcidas.
- **Orquestación en la Nube:** Uso de Webhooks en n8n para intermediar las peticiones HTTP.
- **Iconografía Dinámica:** Reacción visual automática según la descripción meteorológica recibida.
- **Arquitectura Limpia:** Separación clara entre UI, Modelos y Servicios en Flutter.

---

## Instalación y Uso (Para Desarrolladores)

Si deseas clonar y correr este proyecto en tu entorno local, sigue estos pasos:

### Prerrequisitos
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (Versión 3.0 o superior)
- Editor de código (VS Code, Android Studio)
- Dispositivo físico o emulador Android/iOS configurado
- Una cuenta en [n8n Cloud](https://n8n.cloud/) o una instancia local de n8n.

### Pasos de Instalación

1. **Clonar el repositorio:**
   ```bash
   git clone [https://github.com/TU_USUARIO/Monitor-de-Clima-Local.git](https://github.com/TU_USUARIO/Monitor-de-Clima-Local.git)

2. **Instalar dependencias:**
    - flutter pub get

3. Importar el flujo en n8n

Para que la aplicación funcione correctamente, necesitas levantar el orquestador usando el archivo JSON incluido en este repositorio.

- Abre tu entorno de [n8n](https://app.n8n.cloud/).
- En el menú lateral izquierdo, ve a la sección **Workflows**.
- Haz clic en el botón superior derecho **"Add workflow"** (Agregar flujo de trabajo).
- En el nuevo lienzo en blanco, haz clic en el menú superior derecho `...` (o `☰`) y selecciona **"Import from File"** (Importar desde archivo).
- Selecciona el archivo `flujo_n8n_clima.json` que se encuentra en la raíz de este repositorio.
- Una vez cargado el flujo, haz doble clic en el nodo **Webhook**, copia la *Production URL* y pégala en la variable `webhookUrl` dentro de `lib/services/weather_service.dart`.
- haz clic en public para publicar el flujo

4. **Ejecutar la aplicación:** 
    - flutter run


   