// src/services/banguat.js

//Se construyó el XML necesario para el protocolo SOAP y se utilizó la 
// librería axios para hacer la petición POST al servidor del banco, y xml2js para convertir la respuesta a JSON"
const axios = require('axios');
const xml2js = require('xml2js');

// Configuración de la API del Banco
const URL_BANGUAT = 'https://www.banguat.gob.gt/variables/ws/tipocambio.asmx';

const obtenerTipoCambioDia = async () => {
    // 1. Construir el "Sobre" (Envelope) SOAP.
    
    const xmlBody = `<?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
        <TipoCambioDia xmlns="http://www.banguat.gob.gt/variables/ws/" />
      </soap:Body>
    </soap:Envelope>`;

    try {
        // 2. Enviar la petición al Banco (POST request)
        const response = await axios.post(URL_BANGUAT, xmlBody, {
            headers: {
                'Content-Type': 'text/xml; charset=utf-8',
                'SOAPAction': 'http://www.banguat.gob.gt/variables/ws/TipoCambioDia'
            }
        });

        // 3. Traducir el XML a JSON (Parsing)
        const parser = new xml2js.Parser({ explicitArray: false });
        const result = await parser.parseStringPromise(response.data);

        // 4. Navegar por la respuesta para encontrar el dato exacto
        
        const datos = result['soap:Envelope']['soap:Body']['TipoCambioDiaResponse']['TipoCambioDiaResult']['CambioDolar']['VarDolar'];

        // Si hay muchos datos, devuelve un array. Si es solo hoy, devuelve un objeto.
        // Tomamos el dato más reciente (o el único).
        const datoDia = Array.isArray(datos) ? datos[datos.length - 1] : datos;

        // 5. Retornar solo lo que nos interesa limpio
        return {
            fecha: datoDia.fecha,
            valor: parseFloat(datoDia.referencia),
            origen: 'Banco de Guatemala (SOAP)'
        };

    } catch (error) {
        console.error('❌ Error consultando Banguat:', error.message);
        throw new Error('No se pudo obtener el tipo de cambio');
    }
};

// --- CÓDIGO DE PRUEBA (Solo se ejecuta si corres este archivo directamente) ---
if (require.main === module) {
    obtenerTipoCambioDia()
        .then(datos => console.log('✅ Datos recibidos del Banco:', datos))
        .catch(err => console.error(err));
}

module.exports = { obtenerTipoCambioDia };