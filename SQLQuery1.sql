USE CriminalisticaDB;
GO

-- TABLA: Localidad
CREATE TABLE Localidad (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(150) NOT NULL,
    NumeroLocalidad INT NULL,
    CodigoPostal INT NULL
);
GO

-- TABLA: Barrio
CREATE TABLE Barrio (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(150) NOT NULL,
    LocalidadId INT NOT NULL,
    FOREIGN KEY (LocalidadId) REFERENCES Localidad(Id) ON DELETE CASCADE
);
GO

-- =======================================
-- TABLA: Ubicacion
-- =======================================
CREATE TABLE Ubicacion (
    Id INT PRIMARY KEY IDENTITY(1,1),
    LocalidadId INT NOT NULL,
    BarrioId INT NOT NULL,
    Latitud FLOAT NOT NULL,
    Longitud FLOAT NOT NULL,
    FOREIGN KEY (LocalidadId) REFERENCES Localidad(Id),
    FOREIGN KEY (BarrioId) REFERENCES Barrio(Id)
);
GO

-- =======================================
-- TABLA: TipoDelito
-- =======================================
CREATE TABLE TipoDelito (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(MAX) NULL
);
GO

-- =======================================
-- TABLA: Estado
-- =======================================
CREATE TABLE Estado (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL
);
GO

-- =======================================
-- TABLA: Delito
-- =======================================
CREATE TABLE Delito (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(200) NOT NULL,
    Descripcion NVARCHAR(MAX) NULL,
    Fecha DATETIME NOT NULL,
    TipoDelitoId INT NOT NULL,
    UbicacionId INT NOT NULL,
    IdEstado INT NOT NULL,
    FOREIGN KEY (TipoDelitoId) REFERENCES TipoDelito(Id),
    FOREIGN KEY (UbicacionId) REFERENCES Ubicacion(Id),
    FOREIGN KEY (IdEstado) REFERENCES Estado(Id)
);
GO

-- TABLA: Persona
CREATE TABLE Persona (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Apellido NVARCHAR(100) NOT NULL,
    Edad INT NOT NULL,
    TipoDocumento NVARCHAR(10) NOT NULL,
    Documento INT NOT NULL UNIQUE
);
GO

-- ÍNDICES PARA OPTIMIZACIÓN
CREATE INDEX IDX_Barrio_LocalidadId ON Barrio(LocalidadId);
GO

CREATE INDEX IDX_Ubicacion_LocalidadId ON Ubicacion(LocalidadId);
GO

CREATE INDEX IDX_Ubicacion_BarrioId ON Ubicacion(BarrioId);
GO

CREATE INDEX IDX_Delito_TipoDelitoId ON Delito(TipoDelitoId);
GO

CREATE INDEX IDX_Delito_UbicacionId ON Delito(UbicacionId);
GO

CREATE INDEX IDX_Delito_IdEstado ON Delito(IdEstado);
GO

CREATE INDEX IDX_Persona_Documento ON Persona(Documento);
GO
