create database if not exists `vollmed`;

use `vollmed`;
--
-- Base de datos: `vollmed`
--
-- --------------------------------------------------------
-- 
-- Estructura de tabla para la tabla `medicamentos`
--
CREATE TABLE 
    `establecimientos` (
        `id` int NOT NULL COMMENT 'id del establecimiento',
        `nombre` varchar(100) NOT NULL COMMENT 'Nombre del establecimiento',
        `direccion` varchar(100) NOT NULL COMMENT 'Direccion del establecimiento',
        `telefono` varchar(25) NOT NULL COMMENT 'Contacto telefonico del establecimiento',
        `email` varchar(100) NOT NULL COMMENT 'Email del establecimiento'
    )DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `box_atenciones`
--
CREATE TABLE 
    `box_atenciones` (
        `id` int NOT NULL COMMENT 'id del box',
        `nombre` varchar(100) NOT NULL COMMENT 'Nombre del box',
        `tipo` ENUM ('sala', 'area', 'box') COMMENT 'Estilo o uso de la seccion de atencion',
        `ubicacion` int NOT NULL COMMENT 'id del establecimiento ubicado',
        `estado` ENUM ('activa','inactiva','mantenimiento') COMMENT 'Estado de la seccion'
    )DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------

CREATE TABLE
    `medicamentos` (
        `id` bigint NOT NULL COMMENT 'id del medicamento',
        `nombre` varchar(100) NOT NULL COMMENT 'Nombre del medicamento',
        `laboratorio` varchar(100) NOT NULL COMMENT 'Marca de laboratorio',
        `forma_de_uso` varchar(100) NOT NULL COMMENT 'Metodo de uso/ consumo del medicamento',
        `descripcion` text NOT NULL COMMENT 'Informacion relevante sobre el uso del medicamento'
    ) DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `salud_previsionales`
--
CREATE TABLE
    `salud_previsionales` (
        `id` INT NOT NULL COMMENT 'id de salud previsional',
        `nombre` varchar(100) NOT NULL COMMENT 'Nombre de la institucion prestadora de servicios'
    ) DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `pacientes`
--
CREATE TABLE
    `pacientes` (
        `id` bigint NOT NULL COMMENT 'id del paciente',
        `primer_nombre` varchar(100) NOT NULL COMMENT 'Nombres del paciente',
        `segundo_nombre` varchar(100) DEFAULT NULL COMMENT 'Nombres del paciente',
        `primer_apellido` varchar(100) NOT NULL COMMENT 'Apellidos del paciente',
        `segundo_apellido` varchar(100) DEFAULT NULL COMMENT 'Apellidos del paciente',
        `email` varchar(100) NOT NULL COMMENT 'Email del paciente',
        `telefono` varchar(25) NOT NULL COMMENT 'Contacto telefonico del paciente',
        `DNI` varchar(10) NOT NULL COMMENT 'Cedula DNI del paciente',
        `salud_previsional` int NOT NULL COMMENT 'id de salud previsional registrado',
        `region` varchar(100) NOT NULL COMMENT 'Región en la que se encuentra domiciliado el paciente',
        `ciudad` varchar(100) NOT NULL COMMENT 'Ciudad en la que se encuentra domiciliado el paciente',
        `domicilio` varchar(120) NOT NULL COMMENT 'Numero y calle donde se encuentra domiciliado el paciente'
    ) DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `medicos`
--
CREATE TABLE
    `medicos` (
        `id` bigint NOT NULL COMMENT 'id medicos',
        `primer_nombre` varchar(50) NOT NULL COMMENT 'Nombres del funcionario',
        `segundo_nombre` varchar(50) DEFAULT NULL COMMENT 'Nombres del funcionario',
        `primer_apellido` varchar(50) NOT NULL COMMENT 'Apellidos del funcionario',
        `segundo_apellido` varchar(50) DEFAULT NULL COMMENT 'Apellidos del funcionario',
        `fecha_nacimiento` date NOT NULL COMMENT 'Fecha de nacimiento del funcionario',
        `genero` varchar(50) DEFAULT NULL COMMENT 'Genero del funcionario',
        `nacionalidad` varchar(50) NOT NULL COMMENT 'Nacionalidad del funcionario',
        `DNI` varchar(10) NOT NULL COMMENT 'Cedula DNI del funcionario',
        `certificado_SIS` varchar(10) NOT NULL COMMENT 'Certificado de inscripción en el Registro Nacional de Prestadores del funcionario',
        `especialidad` varchar(100) NOT NULL COMMENT 'Especialidad del area medica del funcionario',
        `email` varchar(100) NOT NULL COMMENT 'Email del funcionario',
        `telefono` varchar(25) NOT NULL COMMENT 'Contacto telefonico del funcionario',
        `region` varchar(100) NOT NULL COMMENT 'Región en la que se encuentra domiciliado el funcionario',
        `ciudad` varchar(100) NOT NULL COMMENT 'Ciudad en la que se encuentra domiciliado el funcionario',
        `domicilio` varchar(120) DEFAULT NULL COMMENT 'Numero y calle donde se encuentra domiciliado el funcionario',
        `estado_laboral` ENUM ('activo', 'licencia', 'retirado') NOT NULL COMMENT 'Estado laboral del funcionario',
        `ingreso_funciones` date NOT NULL COMMENT 'Fecha del ingreso de labores del funcionario',
        `box_asignado` int NOT NULL COMMENT 'id de la seccion de atencion al que fue asignado'
    ) DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `receta_medica`
--
CREATE TABLE
    `receta_medica` (
        `id` bigint NOT NULL COMMENT 'id receta médica',
        `id_consulta` bigint NOT NULL COMMENT 'id de la consulta asociada',
        `instrucciones` TEXT COMMENT 'Instrucciones para el paciente'
    ) DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `consultas`
--
CREATE TABLE
    `consultas` (
        `id` bigint NOT NULL COMMENT 'id consultas',
        `fecha` datetime NOT NULL COMMENT 'Fecha ingreso del procedimiento',
        `id_medico` bigint NOT NULL COMMENT 'id medico',
        `id_paciente` bigint NOT NULL COMMENT 'id paciente',
        `box_asignado` int NOT NULL COMMENT 'id del box de atencion en el que fue realizada la consulta',
        `estado` ENUM ('ingresado', 'en_curso', 'completado') DEFAULT 'ingresado' COMMENT 'Estado de la consulta (Ingresado/En Curso/Completado)',
        `signos_vitales` JSON COMMENT 'Signos vitales del paciente',
        `peso` DECIMAL(5, 2) COMMENT 'Peso del paciente en kg',
        `PAS` INT COMMENT 'Presión arterial sistólica',
        `PAD` INT COMMENT 'Presión arterial diastólica',
        `temperatura_bucal` DECIMAL(4, 2) COMMENT 'Temperatura bucal en °C',
        `temperatura_rectal` DECIMAL(4, 2) COMMENT 'Temperatura rectal en °C',
        `temperatura_axilar` DECIMAL(4, 2) COMMENT 'Temperatura axilar en °C',
        `frecuencia_cardiaca` INT COMMENT 'Frecuencia cardíaca en latidos por minuto',
        `frecuencia_respiratoria` INT COMMENT 'Frecuencia respiratoria en respiraciones por minuto',
        `glicemia` DECIMAL(5, 2) COMMENT 'Nivel de glucosa en sangre en mg/dL',
        `alergias` TEXT COMMENT 'Alergias conocidas del paciente',
        `motivo_consulta` TEXT COMMENT 'Motivo de la consulta (anamnesis)',
        `diagnostico` TEXT COMMENT 'Diagnóstico del médico',
        `procedimiento` TEXT COMMENT 'Procedimiento realizado',
        `id_receta_medica` bigint COMMENT 'id referencia a la receta médica (FK de receta_medica.id)'
    ) DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `receta_medicacion`
--
CREATE TABLE
    `receta_medicacion` (
        `id` bigint NOT NULL COMMENT 'id relación receta-medicación',
        `id_receta_medica` bigint NOT NULL COMMENT 'id de la receta médica',
        `id_medicamento` bigint NOT NULL COMMENT 'id del medicamento',
        `dosis` VARCHAR(100) COMMENT 'Dosis del medicamento',
        `frecuencia` VARCHAR(100) COMMENT 'Frecuencia de administración',
        `duracion` VARCHAR(100) COMMENT 'Duración del tratamiento'
    ) DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;
