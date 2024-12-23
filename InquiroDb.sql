 --Base de Datos: Inquiro
CREATE DATABASE InquiroDB;
GO

USE InquiroDB;
GO

 --Tabla de Usuarios
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY IDENTITY(1,1),
    NombreUsuario NVARCHAR(50) UNIQUE NOT NULL,
    Contrasena NVARCHAR(255) NOT NULL,
    FechaRegistro DATETIME DEFAULT GETDATE()
);
GO

-- Tabla de Preguntas
CREATE TABLE Preguntas (
    PreguntaID INT PRIMARY KEY IDENTITY(1,1),
    UsuarioID INT FOREIGN KEY REFERENCES Usuarios(UsuarioID) ON DELETE CASCADE,
    Titulo NVARCHAR(255) NOT NULL,
    Descripcion NVARCHAR(MAX),
    FechaCreacion DATETIME DEFAULT GETDATE(),
	-- 0: Abierta, 1: Cerrada
    Cerrada BIT DEFAULT 0 
);
GO

 --Tabla de Respuestas
CREATE TABLE Respuestas (
    RespuestaID INT PRIMARY KEY IDENTITY(1,1),
    PreguntaID INT FOREIGN KEY REFERENCES Preguntas(PreguntaID) ON DELETE CASCADE,
    UsuarioID INT FOREIGN KEY REFERENCES Usuarios(UsuarioID) ON DELETE NO ACTION,
    Contenido NVARCHAR(MAX) NOT NULL,
    FechaCreacion DATETIME DEFAULT GETDATE()
);
GO

USE InquiroDB;
GO

 --Procedimiento almacenado de registro de Usuarios
GO
CREATE PROCEDURE RegistrarUsuario
    @NombreUsuario NVARCHAR(50),
    @Contrasena NVARCHAR(255)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Usuarios WHERE NombreUsuario = @NombreUsuario)
    BEGIN
        THROW 50000, 'Este nombre de usuario ya está en uso. Por favor, intenta con otro nombre.', 1;
    END
    
    IF @NombreUsuario = '' OR @Contrasena = ''
    BEGIN
        THROW 50001, 'Ningún campo puede estar vacío.', 1;
    END

    INSERT INTO Usuarios (NombreUsuario, Contrasena)
    VALUES (@NombreUsuario, @Contrasena);
END;
GO

 --Procedimiento para iniciar sesión
 CREATE PROCEDURE IniciarSesion
    @NombreUsuario NVARCHAR(50),
    @Contrasena NVARCHAR(255)
AS
BEGIN
    BEGIN TRY
        IF LTRIM(RTRIM(@NombreUsuario)) = '' OR LTRIM(RTRIM(@Contrasena)) = ''
        BEGIN
            SELECT 0 AS Resultado, 'Los campos no pueden estar vacíos.' AS Mensaje, NULL AS UsuarioID;
            RETURN;
        END

        DECLARE @UsuarioID INT;

        SELECT @UsuarioID = UsuarioID
        FROM Usuarios
        WHERE LOWER(TRIM(NombreUsuario)) = LOWER(TRIM(@NombreUsuario))
          AND Contrasena = @Contrasena;

        IF @UsuarioID IS NOT NULL
        BEGIN
            SELECT 1 AS Resultado, 'Inicio de sesión exitoso.' AS Mensaje, @UsuarioID AS UsuarioID;
        END
        ELSE
        BEGIN
            SELECT 0 AS Resultado, 'Credenciales inválidas.' AS Mensaje, NULL AS UsuarioID;
        END
    END TRY
    BEGIN CATCH
        SELECT 0 AS Resultado, ERROR_MESSAGE() AS Mensaje, NULL AS UsuarioID;
    END CATCH
END;

GO

USE InquiroDB;
GO

--Procedimiento para Obtener Preguntas
CREATE PROCEDURE ObtenerPreguntas
AS
BEGIN
    SELECT 
        PreguntaID,
        UsuarioID,
        Titulo,
        Descripcion,
        FechaCreacion,
        Cerrada
    FROM Preguntas
    ORDER BY FechaCreacion DESC;
END;
GO

--Procedimiento para Agregar una Pregunta 
CREATE PROCEDURE AgregarPregunta
    @Titulo NVARCHAR(255),
    @Descripcion NVARCHAR(MAX),
    @UsuarioID INT
AS
BEGIN
    INSERT INTO Preguntas (Titulo, Descripcion, UsuarioID, FechaCreacion, Cerrada)
    VALUES (@Titulo, @Descripcion, @UsuarioID, GETDATE(), 0);
END;
GO

--Procedimiento para Cerrar una Pregunta
CREATE PROCEDURE CerrarPregunta
    @PreguntaID INT,
    @UsuarioID INT
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM Preguntas
        WHERE PreguntaID = @PreguntaID AND UsuarioID = @UsuarioID
    )
    BEGIN
        THROW 50004, 'No tiene permisos para cerrar esta pregunta.', 1;
    END

    UPDATE Preguntas
    SET Cerrada = 1
    WHERE PreguntaID = @PreguntaID;
END;
GO


USE InquiroDB;
GO


--Procedimiento para responder una pregunta
CREATE PROCEDURE AgregarRespuesta
    @PreguntaID INT,
    @UsuarioID INT,
    @Contenido NVARCHAR(MAX)
AS
BEGIN
    IF @Contenido = ''
    BEGIN
        THROW 50002, 'El contenido de la respuesta no puede estar vacío.', 1;
    END

    IF EXISTS (SELECT 1 FROM Preguntas WHERE PreguntaID = @PreguntaID AND Cerrada = 1)
    BEGIN
        THROW 50003, 'La pregunta está cerrada y no puede recibir más respuestas.', 1;
    END

    INSERT INTO Respuestas (PreguntaID, UsuarioID, Contenido, FechaCreacion)
    VALUES (@PreguntaID, @UsuarioID, @Contenido, GETDATE());
END;
GO


