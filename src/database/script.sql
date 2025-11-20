CREATE DATABASE IF NOT EXISTS recuperacion_db;
USE recuperacion_db;

CREATE TABLE IF NOT EXISTS historial_consultas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_consulta DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_tipo_cambio DATE NOT NULL,
    tipo_cambio DECIMAL(10, 5) NOT NULL,
    origen_api VARCHAR(100) NOT NULL
);

-- Insertar datos de prueba (Requisito: mostrar al menos 5 registros)
INSERT INTO historial_consultas (fecha_tipo_cambio, tipo_cambio, origen_api) VALUES 
('2025-11-20', 7.72341, 'Banguat SOAP'),
('2025-11-19', 7.71000, 'Banguat SOAP'),
('2025-11-18', 7.71500, 'Banguat SOAP'),
('2025-11-17', 7.72000, 'Banguat SOAP'),
('2025-11-16', 7.72100, 'Banguat SOAP');