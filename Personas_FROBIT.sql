CREATE DATABASE Personas_db;
USE Personas_db;
CREATE TABLE Personas (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Apellido VARCHAR(50),
    Nombres VARCHAR(50),
    DNI VARCHAR(15),
    Domicilio VARCHAR(100),
    Telefono VARCHAR(20),
    Id_Estado INT,
    FecHora_Registros DATETIME,
    FecHora_Modificacion DATETIME,
    FOREIGN KEY (Id_Estado) REFERENCES Estados(Id_Estado)
);
CREATE TABLE Estados (
    Id_Estado INT PRIMARY KEY,
    Descripcion VARCHAR(20)
);
INSERT INTO Estados (Id_Estado, Descripcion) 
VALUES 
(1, 'Activo'),
(2, 'Inactivo');
DELIMITER //

CREATE PROCEDURE Registrar_Persona(
    IN p_Apellido VARCHAR(50), 
    IN p_Nombres VARCHAR(50), 
    IN p_DNI VARCHAR(15), 
    IN p_Domicilio VARCHAR(100), 
    IN p_Telefono VARCHAR(20), 
    IN p_Id_Estado INT, 
    IN p_FecHora_Registros DATETIME
)
BEGIN
    INSERT INTO Personas (Apellido, Nombres, DNI, Domicilio, Telefono, Id_Estado, FecHora_Registros) 
    VALUES (p_Apellido, p_Nombres, p_DNI, p_Domicilio, p_Telefono, p_Id_Estado, p_FecHora_Registros);
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE Consultar_Persona(IN p_Id INT)
BEGIN
    SELECT * FROM Personas WHERE Id = p_Id;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE Consultar_Persona(IN p_Id INT)
BEGIN
    SELECT * FROM Personas WHERE Id = p_Id;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE Eliminar_Persona(IN p_Id INT)
BEGIN
    UPDATE Personas 
    SET Id_Estado = 2, FecHora_Modificacion = NOW() 
    WHERE Id = p_Id;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE Actualizar_Persona(
    IN p_Id INT,
    IN p_Apellido VARCHAR(50), 
    IN p_Nombres VARCHAR(50), 
    IN p_DNI VARCHAR(15), 
    IN p_Domicilio VARCHAR(100), 
    IN p_Telefono VARCHAR(20), 
    IN p_Id_Estado INT
)
BEGIN
    UPDATE Personas
    SET Apellido = p_Apellido, 
        Nombres = p_Nombres, 
        DNI = p_DNI, 
        Domicilio = p_Domicilio, 
        Telefono = p_Telefono, 
        Id_Estado = p_Id_Estado,
        FecHora_Modificacion = NOW()
    WHERE Id = p_Id;
END //

DELIMITER ;
