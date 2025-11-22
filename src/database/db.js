// src/database/db.js
const mysql = require('mysql2/promise');
require('dotenv').config(); // Carga las variables del archivo .env

// Configuración del pool de conexiones
const pool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

// Prueba de conexión inmediata al ejecutar este archivo
// (Esto es solo para verificar, luego lo usaremos en el servidor)
(async () => {
    try {
        const connection = await pool.getConnection();
        console.log('✅ ¡CONEXIÓN EXITOSA a MariaDB!');
        connection.release(); // Soltar la conexión
    } catch (error) {
        console.error('❌ Error de conexión:', error.message);
    }
})();

module.exports = pool;