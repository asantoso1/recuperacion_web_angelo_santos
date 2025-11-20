// src/app.js
const express = require('express');
const cors = require('cors');
require('dotenv').config();

// Rutas
const apiRoutes = require('./routes/api');

const app = express();
const PORT = process.env.PORT || 3000;

// Middlewares (Configuraciones previas)
app.use(cors()); // Permite que el frontend hable con el backend
app.use(express.json());
app.use(express.static('src/public')); // Carpeta pública para el HTML frontend

// Usar las rutas
app.use('/api', apiRoutes);

// Iniciar servidor
app.listen(PORT, () => {
    console.log(`🚀 Servidor corriendo en http://localhost:${PORT}`);
    console.log(`🔗 API disponible en http://localhost:${PORT}/api/consultar-cambio`);
});