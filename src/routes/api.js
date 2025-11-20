// src/routes/api.js
const express = require('express');
const router = express.Router();
const cambioController = require('../controllers/cambioController');

// Cuando alguien entre a /consultar-cambio, se ejecuta el controlador
router.get('/consultar-cambio', cambioController.obtenerDatos);

module.exports = router;