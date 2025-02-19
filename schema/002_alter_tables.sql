--
-- Índices para tablas
--
-- --------------------------------------------------------
--
-- Verificacion de la tabla medicamentos
--
IF NOT EXISTS (
    SELECT
        1
    FROM
        information_schema.tables
    WHERE
        table_schema = 'vollmed'
        AND table_name = 'medicamentos'
) THEN SIGNAL SQLSTATE '45000'
SET
    MESSAGE_TEXT = 'Error: La tabla medicamentos no existe';

END IF;

-- --------------------------------------------------------
--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos` ADD PRIMARY KEY (`id`),
-- --------------------------------------------------------
--
-- Verificacion de la tabla consultas
--
IF NOT EXISTS (
    SELECT
        1
    FROM
        information_schema.tables
    WHERE
        table_schema = 'vollmed'
        AND table_name = 'consultas'
) THEN SIGNAL SQLSTATE '45000'
SET
    MESSAGE_TEXT = 'Error: La tabla consultas no existe';

END IF;

-- --------------------------------------------------------
--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas` ADD PRIMARY KEY (`id`),
ADD CONSTRAINT `fk_consultas_medicos` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id`),
ADD CONSTRAINT `fk_consultas_pacientes` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id`),
ADD CONSTRAINT `fk_consultas_receta_medica` FOREIGN KEY (`id_receta_medica`) REFERENCES `receta_medica` (`id`);

-- --------------------------------------------------------
--
-- Verificacion de la tabla `medicos`
--
IF NOT EXISTS (
    SELECT
        1
    FROM
        information_schema.tables
    WHERE
        table_schema = 'vollmed'
        AND table_name = 'medicos'
) THEN SIGNAL SQLSTATE '45000'
SET
    MESSAGE_TEXT = 'Error: La tabla medicos no existe';

END IF;

-- --------------------------------------------------------
--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos` ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `email` (`email`),
ADD UNIQUE KEY `DNI` (`DNI`);

-- --------------------------------------------------------
--
-- Verificacion de la tabla `pacientes`
--
IF NOT EXISTS (
    SELECT
        1
    FROM
        information_schema.tables
    WHERE
        table_schema = 'vollmed'
        AND table_name = 'pacientes'
) THEN SIGNAL SQLSTATE '45000'
SET
    MESSAGE_TEXT = 'Error: La tabla pacientes no existe';

END IF;

-- --------------------------------------------------------
--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes` ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `email` (`email`),
ADD UNIQUE KEY `DNI` (`DNI`);

-- --------------------------------------------------------
--
-- Verificacion de la tabla `receta_medica`
--
IF NOT EXISTS (
    SELECT
        1
    FROM
        information_schema.tables
    WHERE
        table_schema = 'vollmed'
        AND table_name = 'receta_medica'
) THEN SIGNAL SQLSTATE '45000'
SET
    MESSAGE_TEXT = 'Error: La tabla receta_medica no existe';

END IF;

-- --------------------------------------------------------
--
-- Indices de la tabla `receta_medica`
--
ALTER TABLE `receta_medica` ADD PRIMARY KEY (`id`),
ADD CONSTRAINT `fk_recetamedica_consultas` FOREIGN KEY (`id_consulta`) REFERENCES `consultas` (`id`);

-- --------------------------------------------------------
--
-- Verificacion de la tabla `salud_previsionales`
--
IF NOT EXISTS (
    SELECT
        1
    FROM
        information_schema.tables
    WHERE
        table_schema = 'vollmed'
        AND table_name = 'salud_previsionales'
) THEN SIGNAL SQLSTATE '45000'
SET
    MESSAGE_TEXT = 'Error: La tabla salud_previsionales no existe';

END IF;

-- --------------------------------------------------------
--
-- Indices de la tabla `salud_previsionales`
--
ALTER TABLE `salud_previsionales` ADD PRIMARY KEY (`id`);

-- --------------------------------------------------------
--
-- Verificacion de la tabla `receta_medicacion`
--
IF NOT EXISTS (
    SELECT
        1
    FROM
        information_schema.tables
    WHERE
        table_schema = 'vollmed'
        AND table_name = 'receta_medicacion'
) THEN SIGNAL SQLSTATE '45000'
SET
    MESSAGE_TEXT = 'Error: La tabla receta_medicacion no existe';

END IF;

-- --------------------------------------------------------
--
-- Indices de la tabla `receta_medicacion`
--
ALTER TABLE `receta_medicacion` ADD PRIMARY KEY (`id`),
ADD CONSTRAINT `fk_receta_medicacion_receta_medica` FOREIGN KEY (`id_receta_medica`) REFERENCES `receta_medica` (`id`),
ADD CONSTRAINT `fk_receta_medicacion_medicamentos` FOREIGN KEY (`id_medicacion`) REFERENCES `medicacion` (`id`);


--
-- AUTO_INCREMENT para tablas
--
--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `receta_medica` MODIFY `id` bigint not null AUTO_INCREMENT;

-- --------------------------------------------------------
--
--AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos` MODIFY `id` bigint NOT NULL AUTO_INCREMENT;
-- --------------------------------------------------------

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas` MODIFY `id` bigint NOT NULL AUTO_INCREMENT ;

-- --------------------------------------------------------
--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos` MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------
--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes` MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------
--
-- AUTO_INCREMENT de la tabla `receta_medica`
--
ALTER TABLE `receta_medica` MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------
--
-- AUTO_INCREMENT de la tabla `salud_previsionales`
--
ALTER TABLE `salud_previsionales` MODIFY `id` int NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------
--
-- AUTO_INCREMENT de la tabla `receta_medicacion`
--
ALTER TABLE `receta_medicacion` MODIFY `id` bigint NOT NULL AUTO_INCREMENT;