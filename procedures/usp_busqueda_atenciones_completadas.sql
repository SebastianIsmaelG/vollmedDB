DELIMITER $$
--
-- Verificar si la base de datos existe antes de continuar
--
IF NOT EXISTS (SELECT COUNT(*) FROM information_schema.schemata WHERE schema_name = 'vollmed' THEN 
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La base de datos vollmed no existe.';
END IF $$

USE vollmed $$
--
-- ----------------------------------
--
CREATE PROCEDURE `busqueda_atenciones_completadas`()  
BEGIN
    -- Cuenta cuántos pacientes fueron atendidos en el año actual
    SELECT CONCAT("Hemos tratado ", COUNT(*), " pacientes con éxito durante el año ", YEAR(CURDATE())) 
           AS resultado
    FROM consultas 
    WHERE YEAR(consultas.fecha) = YEAR(CURDATE()) 
          AND consultas.estado = 'completado';
END $$

DELIMITER ;