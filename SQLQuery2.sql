USE CriminalisticaDB;
GO

-- =======================================
-- LIMPIAR DATOS ANTERIORES
-- =======================================
DELETE FROM Delito;
DELETE FROM Ubicacion;
DELETE FROM Barrio;
DELETE FROM Persona;
DELETE FROM TipoDelito;
DELETE FROM Estado;
DELETE FROM Localidad;
GO

DBCC CHECKIDENT ('Delito', RESEED, 0);
DBCC CHECKIDENT ('Ubicacion', RESEED, 0);
DBCC CHECKIDENT ('Barrio', RESEED, 0);
DBCC CHECKIDENT ('Persona', RESEED, 0);
DBCC CHECKIDENT ('TipoDelito', RESEED, 0);
DBCC CHECKIDENT ('Estado', RESEED, 0);
DBCC CHECKIDENT ('Localidad', RESEED, 0);
GO

-- =======================================
-- ESTADOS
-- =======================================
INSERT INTO Estado (Nombre) VALUES
('Reportado por fuente oficial'),
('Validado para visualización'),
('Pendiente de revisión'),
('Archivado');
GO

-- =======================================
-- TIPOS DE DELITO
-- =======================================
INSERT INTO TipoDelito (Nombre, Descripcion) VALUES
('Hurto a personas', 'Hurto cometido contra personas.'),
('Hurto a residencias', 'Hurto cometido en viviendas.'),
('Hurto a comercio', 'Hurto cometido en establecimientos comerciales.'),
('Hurto de bicicletas', 'Hurto de bicicletas.'),
('Hurto de automotores', 'Hurto de vehículos automotores.'),
('Hurto de motocicletas', 'Hurto de motocicletas.'),
('Homicidio', 'Delito contra la vida.'),
('Lesiones personales', 'Agresión física reportada como delito.'),
('Violencia intrafamiliar', 'Violencia registrada en contexto familiar.'),
('Delitos sexuales', 'Delitos relacionados con violencia sexual.'),
('Extorsión', 'Exigencia ilegal mediante presión o amenaza.'),
('Secuestro', 'Privación ilegal de la libertad.');
GO

-- =======================================
-- LOCALIDADES DE BOGOTÁ
-- =======================================
INSERT INTO Localidad (Nombre, NumeroLocalidad, CodigoPostal) VALUES
('Usaquén', 1, NULL),
('Chapinero', 2, NULL),
('Santa Fe', 3, NULL),
('San Cristóbal', 4, NULL),
('Usme', 5, NULL),
('Tunjuelito', 6, NULL),
('Bosa', 7, NULL),
('Kennedy', 8, NULL),
('Fontibón', 9, NULL),
('Engativá', 10, NULL),
('Suba', 11, NULL),
('Barrios Unidos', 12, NULL),
('Teusaquillo', 13, NULL),
('Los Mártires', 14, NULL),
('Antonio Nariño', 15, NULL),
('Puente Aranda', 16, NULL),
('La Candelaria', 17, NULL),
('Rafael Uribe Uribe', 18, NULL),
('Ciudad Bolívar', 19, NULL),
('Sumapaz', 20, NULL);
GO

-- =======================================
-- BARRIOS / ZONAS DE REFERENCIA
-- =======================================
INSERT INTO Barrio (Nombre, LocalidadId) VALUES
('Cedritos', 1),
('Chapinero Central', 2),
('Las Nieves', 3),
('20 de Julio', 4),
('Yomasa', 5),
('Venecia', 6),
('Bosa Centro', 7),
('Patio Bonito', 8),
('Fontibón Centro', 9),
('Las Ferias', 10),
('Suba Centro', 11),
('Siete de Agosto', 12),
('Galerías', 13),
('Santa Fe - Mártires', 14),
('Restrepo', 15),
('Ciudad Montes', 16),
('La Candelaria Centro', 17),
('Quiroga', 18),
('Lucero', 19),
('Nazareth', 20);
GO

-- =======================================
-- UBICACIONES DEMO PARA EL MAPA
-- Estas coordenadas son de referencia para probar el sistema.
-- =======================================
INSERT INTO Ubicacion (LocalidadId, BarrioId, Latitud, Longitud) VALUES
(1, 1, 4.728100, -74.034500),
(2, 2, 4.648600, -74.064900),
(3, 3, 4.604900, -74.070300),
(4, 4, 4.570900, -74.094200),
(5, 5, 4.509900, -74.115000),
(6, 6, 4.582200, -74.133800),
(7, 7, 4.630500, -74.194700),
(8, 8, 4.648283, -74.247894),
(9, 9, 4.677500, -74.143700),
(10, 10, 4.690000, -74.093800),
(11, 11, 4.741000, -74.084000),
(12, 12, 4.668400, -74.075600),
(13, 13, 4.643900, -74.077700),
(14, 14, 4.604200, -74.089600),
(15, 15, 4.586900, -74.100600),
(16, 16, 4.617500, -74.114600),
(17, 17, 4.598100, -74.075800),
(18, 18, 4.570100, -74.115900),
(19, 19, 4.548600, -74.151900),
(20, 20, 4.143900, -74.143900);
GO

-- =======================================
-- DELITOS DEMO / SIMULADOS
-- Sirven para probar el backend y el mapa.
-- =======================================
INSERT INTO Delito 
(Nombre, Descripcion, Fecha, TipoDelitoId, UbicacionId, IdEstado) 
VALUES
('Hurto a personas reportado', 'Registro demo para visualización en mapa.', '2026-01-10', 1, 1, 2),
('Hurto a comercio reportado', 'Registro demo para visualización en mapa.', '2026-01-12', 3, 2, 2),
('Lesiones personales reportadas', 'Registro demo para visualización en mapa.', '2026-01-14', 8, 3, 2),
('Hurto de bicicleta reportado', 'Registro demo para visualización en mapa.', '2026-01-16', 4, 4, 2),
('Violencia intrafamiliar reportada', 'Registro demo para visualización en mapa.', '2026-01-18', 9, 5, 2),
('Hurto a personas reportado', 'Registro demo para visualización en mapa.', '2026-01-20', 1, 6, 2),
('Hurto de motocicleta reportado', 'Registro demo para visualización en mapa.', '2026-01-22', 6, 7, 2),
('Hurto a residencia reportado', 'Registro demo para visualización en mapa.', '2026-01-24', 2, 8, 2),
('Hurto de automotor reportado', 'Registro demo para visualización en mapa.', '2026-01-26', 5, 9, 2),
('Extorsión reportada', 'Registro demo para visualización en mapa.', '2026-01-28', 11, 10, 2),
('Hurto a personas reportado', 'Registro demo para visualización en mapa.', '2026-02-02', 1, 11, 2),
('Hurto a comercio reportado', 'Registro demo para visualización en mapa.', '2026-02-04', 3, 12, 2),
('Lesiones personales reportadas', 'Registro demo para visualización en mapa.', '2026-02-06', 8, 13, 2),
('Homicidio reportado', 'Registro demo para visualización en mapa.', '2026-02-08', 7, 14, 2),
('Hurto a personas reportado', 'Registro demo para visualización en mapa.', '2026-02-10', 1, 15, 2),
('Hurto de bicicletas reportado', 'Registro demo para visualización en mapa.', '2026-02-12', 4, 16, 2),
('Hurto a residencia reportado', 'Registro demo para visualización en mapa.', '2026-02-14', 2, 17, 2),
('Violencia intrafamiliar reportada', 'Registro demo para visualización en mapa.', '2026-02-16', 9, 18, 2),
('Hurto a personas reportado', 'Registro demo para visualización en mapa.', '2026-02-18', 1, 19, 2),
('Lesiones personales reportadas', 'Registro demo para visualización en mapa.', '2026-02-20', 8, 20, 2);
GO
