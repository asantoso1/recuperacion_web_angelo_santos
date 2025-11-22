# Examen de Recuperación - Desarrollo Web
## Consumo de API SOAP Banguat + Historial en MariaDB

Este proyecto es una aplicación Full Stack que consume el Web Service SOAP del Banco de Guatemala para obtener el tipo de cambio del día (GTQ a USD) y almacena un historial de consultas en una base de datos MariaDB.

### Tecnologías Utilizadas:

* **Backend:** Node.js + Express
* **Base de Datos:** MariaDB
* **Protocolo API:** SOAP (XML) con parsing a JSON
* **Frontend:** HTML5 + Bootstrap 5 + JavaScript Vanilla

### Instrucciones de Instalación:

1.  **Clonar el repositorio:**
    ```bash
    git clone [https://github.com/asantoso1/recuperacion_web_angelo_santos.git]
    cd recuperacion_web_angelo_santos
    ```

2.  **Instalar dependencias:**
    ```bash
    npm install
    ```

3.  **Configurar Base de Datos:**
    * Asegúrese de tener MariaDB corriendo.
    * Ejecute el script SQL ubicado en `src/database/script.sql` para crear la tabla.

4.  **Variables de Entorno:**
    Cree un archivo `.env` en la raíz con sus credenciales:
    ```env
    PORT=3000
    DB_HOST=localhost
    DB_USER=root
    DB_PASSWORD=
    DB_NAME=recuperacion_db
    ```

5.  **Ejecutar el proyecto:**
    ```bash
    node src/app.js
    ```
    Acceda a `http://localhost:3000` en su navegador.

### Estructura del Proyecto (Arquitectura)
El proyecto sigue una arquitectura MVC (Modelo-Vista-Controlador) modular:
* `src/services`: Lógica de conexión SOAP con Banguat.
* `src/controllers`: Orquestación de datos y reglas de negocio.
* `src/database`: Conexión y scripts SQL.
* `src/routes`: Definición de endpoints de la API.
* `src/public`: Interfaz de usuario.

