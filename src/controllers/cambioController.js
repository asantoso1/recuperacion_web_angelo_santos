// src/controllers/cambioController.js
const banguatService = require('../services/banguat');
const pool = require('../database/db');

// Función auxiliar para convertir fecha de "19/11/2025" a "2025-11-19" (Formato SQL)
const formatearFechaParaSQL = (fechaString) => {
    // Si no viene fecha, usamos la de hoy
    if (!fechaString) return new Date();
    
    const partes = fechaString.split('/'); // Separa por la barra
    if (partes.length !== 3) return new Date(); // Si falla el formato, devuelve hoy
    return `${partes[2]}-${partes[1]}-${partes[0]}`; // Año-Mes-Día
};

const obtenerDatos = async (req, res) => {
    try {
        // 1. Pedir datos al Banco
        const datosBanguat = await banguatService.obtenerTipoCambioDia();
        
        // 2. Preparar datos para la Base de Datos
        const fechaSQL = formatearFechaParaSQL(datosBanguat.fecha);
        
        // 3. Insertar en MariaDB (Guardar historial)
        const queryInsert = `
            INSERT INTO historial_consultas (fecha_tipo_cambio, tipo_cambio, origen_api)
            VALUES (?, ?, ?)
        `;
        
        await pool.query(queryInsert, [
            fechaSQL, 
            datosBanguat.valor, 
            datosBanguat.origen
        ]);

        // 4. Consultar los últimos 5 registros para mostrarlos (Requisito del examen)
        const [historial] = await pool.query('SELECT * FROM historial_consultas ORDER BY id DESC LIMIT 5');

        // 5. Responder al Frontend (o Postman)
        res.json({
            mensaje: 'Consulta exitosa y guardada',
            actual: datosBanguat,
            historial: historial
        });

    } catch (error) {
        console.error('Error en el controlador:', error);
        res.status(500).json({ error: 'Error procesando la solicitud' });
    }
};

module.exports = { obtenerDatos };